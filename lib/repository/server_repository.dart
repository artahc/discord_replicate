import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
import 'package:discord_replicate/external/app_extension.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/repository/repository_interface.dart';
import 'package:discord_replicate/service/graphql_client_helper.dart';
import 'package:discord_replicate/service/hive_database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class ServerQuery {
  ServerQuery._();

  static final loadById = r"""
    query Server($id: String!, $limitMember: Int!) {
      server(id: $id) {
        id
        name
        imageUrl
        userGroupRef
        channels {
          id
          name
          userGroupRef
        }
        members(limit: $limitMember) {
          uid
          avatarUrl
          name
        }
      }
    }
  """;
}

class ServerRepository implements Repository<Server> {
  late Logger log = Logger();

  final GraphQLClientHelper _api;
  final DatabaseService _db;

  ServerRepository({GraphQLClientHelper? apiClient, HiveDatabaseService? database})
      : _api = apiClient ?? GetIt.I.get<GraphQLClientHelper>(),
        _db = database ?? GetIt.I.get<DatabaseService>();

  @override
  Future<Server?> load(String id) async {
    var query = ServerQuery.loadById;
    var variables = {
      "id": id,
      "limitMember": 20,
    };

    var local = LazyStream(
      () async => _db
          .load<Server>(id)
          .then((server) {
            if (server != null) log.d("Server found on local database. $server");
            return server;
          })
          .asStream()
          .where((server) => server != null),
    );

    var remote = LazyStream(
      () async {
        return _api
            .query(query, variables: variables)
            .then((json) async {
              var server = Server.fromJson(json['server']);
              log.d("Server retrieved from remote API. $server");

              await _db.save<Server>(server.id, server);
              return server;
            })
            .onError((Exception error, stackTrace) => Future.error(mapException(error)))
            .asStream();
      },
    );

    var source = await ConcatStream([local, remote]).firstWhere((element) => element != null);
    return source!;
  }

  @override
  Future<List<Server>> loadAll() async {
    var result = await _db.loadAll<Server>();
    return result;
  }

  @override
  Future save(Server server) async {
    await _db.save<Server>(server.id, server);
  }

  @override
  Future saveAll(List<Server> servers) async {
    var keyValue = servers.toKeyValuePair(keyConverter: (e) => e.id, valueConverter: (e) => e);
    await _db.saveAll(keyValue);
  }

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) {
      return NotFoundException("Server not found.", source: e);
    }
    return e;
  }
}
