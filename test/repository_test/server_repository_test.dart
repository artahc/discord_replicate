import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/data/repository/server_repository_impl.dart';
import 'package:discord_replicate/data/store/store.dart';
import 'package:discord_replicate/domain/api/server_remote_api.dart';

import 'package:discord_replicate/domain/model/server.dart';

import 'package:discord_replicate/data/api/client/graphql_client_helper.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

main() {
  final container = GetIt.asNewInstance();

  // Dependency
  late GraphQLClientHelper client;
  late ServerRemoteApi api;
  late Store<Server> mockDb;
  late Store<Server> mockCache;

  // Object under test.
  late ServerRepository serverRepo;

  setUpAll(() async {
    configureDependencies(container, Env.TEST);

    api = container.get();
    mockDb = container.get(instanceName: "DB_SERVER");
    mockCache = container.get(instanceName: "CACHE_SERVER");

    serverRepo = ServerRepositoryImpl(api, mockDb, mockCache);
  });

  test("Load server from remote API, should be able parse result to Server model.", () async {
    var serverId = "JkBxr0EoQOYyDeXagC2h";
    var expectedResult = Server(id: "id", name: "name", userGroupRef: "userGroupRef", imageUrl: "", channels: []);

    when(() => api.getServerById(serverId)).thenAnswer((invocation) => Future.value(expectedResult));
    when(() => mockDb.save(expectedResult)).thenAnswer((invocation) => Future.value(null));
    when(() => mockDb.load(serverId)).thenAnswer((invocation) => Future.value(null));
    when(() => mockCache.save(expectedResult)).thenAnswer((invocation) => Future.value(null));
    when(() => mockCache.load(serverId)).thenAnswer((invocation) => Future.value(null));

    await serverRepo.getServerById(serverId);

    verify(() => mockDb.load(serverId)).called(1);
    verify(() => mockDb.save(expectedResult)).called(1);
    verify(() => mockCache.load(serverId)).called(1);
    verify(() => mockCache.save(expectedResult)).called(1);
  });
}
