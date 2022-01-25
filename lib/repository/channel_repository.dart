import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/repository/repository_interface.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class ChannelQuery {
  ChannelQuery._();

  static final String loadById = r"""
    query Channel($id: String!, $messageLimit: Int, $memberLimit: Int) {
      channel(id: $id) {
        id
        name
        members(limit: $memberLimit) {
          uid
          avatarUrl
          name
        }
        messages(limit: $messageLimit) {
          id
          senderRef
          timestamp
          message
        }
      }
    }
  """;
}

class ChannelMutation {
  ChannelMutation._();

  static String createMessage = "";
}

class ChannelRepository implements Repository<Channel> {
  late Logger log = Logger();

  GraphQLClientHelper _api;
  DatabaseService _db;

  ChannelRepository({
    GraphQLClientHelper? apiClient,
    DatabaseService? database,
  })  : _api = apiClient ?? GetIt.I.get<GraphQLClientHelper>(),
        _db = database ?? GetIt.I.get<DatabaseService>();

  @override
  Future<Channel> load(String id) async {
    var query = ChannelQuery.loadById;
    var variables = {
      "id": id,
      "messageLimit": 30,
      "memberLimit": 100,
    };

    var local = LazyStream(() {
      return _db
          .load<Channel>(id)
          .then((channel) {
            if (channel != null) log.d("Channel found on local database. $channel");
            return channel;
          })
          .onError((Exception error, stackTrace) => Future.error(mapException(error)))
          .asStream()
          .where((channel) => channel != null);
    });

    var remote = LazyStream(() {
      return _api.query(query, variables: variables).then((json) {
        var channel = Channel.fromJson(json['channel']);
        _db.save<Channel>(channel.id, channel);
        log.d("Channel retrieved from remote API. $json");
        return channel;
      }).asStream();
    });

    var result = await ConcatStream([local, remote]).firstWhere((element) => element != null);
    return result!;
  }

  @override
  Future<List<Channel>> loadAll() async {
    var result = await _db.loadAll<Channel>();
    return result;
  }

  @override
  Future<void> save(Channel channel) async {
    await _db.save(channel.id, channel);
  }

  @override
  Future<void> saveAll(List<Channel> items) async {
    await _db.saveAll(items.toKeyValuePair((e) => e.id, (e) => e));
  }

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) {
      return NotFoundException("Room not found in remote API.", source: e);
    }
    return e;
  }
}
