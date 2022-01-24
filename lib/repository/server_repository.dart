import 'package:async/async.dart';
import 'package:discord_replicate/exception/custom_exception.dart';
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
        channels {
          id
          name
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
  Future<Server> load(String id) async {
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
  Future save(Server server) async {
    await _db.save<Server>(server.id, server);
  }

  Future saveAll(List<Server> servers) async {
    for (int i = 0; i < servers.length; i++) {
      await save(servers[i]);
    }
  }

  @override
  Exception mapException(Exception e) {
    if (e is NotFoundException) {
      return NotFoundException("Server not found.", source: e);
    }
    return e;
  }
}
