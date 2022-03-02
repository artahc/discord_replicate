import 'package:discord_replicate/common/app_logger.dart';
import 'package:discord_replicate/domain/model/channel/channel.dart';
import 'package:discord_replicate/domain/model/member/member.dart';
import 'package:discord_replicate/domain/model/server/server.dart';
import 'package:discord_replicate/domain/model/user/user.dart';
import 'package:discord_replicate/domain/repository/channel_repository.dart';
import 'package:discord_replicate/domain/repository/server_repository.dart';
import 'package:discord_replicate/domain/repository/user_group_repository.dart';
import 'package:discord_replicate/domain/repository/user_repository.dart';
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';
import 'package:discord_replicate/domain/usecase/user/join_server_usecase.dart';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockServerRepository extends Mock implements ServerRepository {}

class MockChannelRepository extends Mock implements ChannelRepository {}

class MockUserGroupRepository extends Mock implements UserGroupRepository {}

class MockGetCurrentUserUseCase extends Mock implements GetCurrentUserUseCase {}

class MockUser extends Mock implements User {}

class MockServer extends Mock implements Server {}

class MockChannel extends Mock implements Channel {}

class MockMember extends Mock implements Member {}

void main() {
  var mockUserRepo = MockUserRepository();
  var mockServerRepo = MockServerRepository();
  var mockChannelRepo = MockChannelRepository();
  var mockUserGroupRepo = MockUserGroupRepository();
  var mockGetCurrentUserUseCase = MockGetCurrentUserUseCase();

  var mockUser = MockUser();
  var mockServer = MockServer();
  var mockMember = MockMember();

  var joinServerUseCase = JoinServerUseCaseImpl(
    getCurrentChannelUseCase: mockGetCurrentUserUseCase,
    channelRepo: mockChannelRepo,
    serverRepo: mockServerRepo,
    userGroupRepo: mockUserGroupRepo,
    userRepo: mockUserRepo,
  );

  setUpAll(() {
    registerFallbackValue(mockUser);
    registerFallbackValue(mockServer);
    registerFallbackValue(mockMember);
  });

  tearDown(() {
    reset(mockUserRepo);
    reset(mockServerRepo);
    reset(mockChannelRepo);
    reset(mockUserGroupRepo);
    reset(mockGetCurrentUserUseCase);
    reset(mockUser);
    reset(mockServer);
    reset(mockMember);
  });
  test('Test logic JoinServerUseCase. All required method should be called.', () async {
    when(() => mockUser.uid).thenReturn("");
    when(() => mockServer.channels).thenReturn([]);
    when(() => mockServer.userGroupRef).thenReturn("");

    when(() => mockGetCurrentUserUseCase.invoke()).thenAnswer((_) => Future.value(mockUser));
    when(() => mockServerRepo.joinServer(userId: any(named: "userId"), serverId: any(named: "serverId"))).thenAnswer((_) => Future.value(mockServer));
    when(() => mockServerRepo.saveServer(any())).thenAnswer((_) => Future.value(null));
    when(() => mockChannelRepo.saveAllChannels(any())).thenAnswer((_) => Future.value(null));
    when(() => mockUserGroupRepo.getAllMember(any())).thenAnswer((_) => Future.value([mockMember]));
    when(() => mockUserGroupRepo.saveAllMembers(any(), any())).thenAnswer((_) => Future.value(null));

    var server = await joinServerUseCase.invoke(serverId: "");

    verify(() => mockGetCurrentUserUseCase.invoke()).called(1);
    verify(() => mockServerRepo.joinServer(userId: any(named: "userId"), serverId: any(named: "serverId"))).called(1);
    verify(() => mockServerRepo.saveServer(any())).called(1);
    verify(() => mockChannelRepo.saveAllChannels(any())).called(1);
    verify(() => mockUserGroupRepo.saveAllMembers(any(), any())).called(1);
    assert(server == mockServer);
  });

  test('Fail when calling joinServer in RemoteAPI logic JoinServerUseCase. Verify further operation is not called.', () async {
    when(() => mockUser.uid).thenReturn("");
    when(() => mockServer.channels).thenReturn([]);
    when(() => mockServer.userGroupRef).thenReturn("");

    when(() => mockGetCurrentUserUseCase.invoke()).thenAnswer((_) => Future.value(mockUser));
    when(() => mockServerRepo.joinServer(userId: any(named: "userId"), serverId: any(named: "serverId")))
        .thenAnswer((_) => Future.error(Exception("Error in server for joinServer")));
    when(() => mockServerRepo.saveServer(any())).thenAnswer((_) => Future.value(null));
    when(() => mockChannelRepo.saveAllChannels(any())).thenAnswer((_) => Future.value(null));
    when(() => mockUserGroupRepo.getAllMember(any())).thenAnswer((_) => Future.value([mockMember]));
    when(() => mockUserGroupRepo.saveAllMembers(any(), any())).thenAnswer((_) => Future.value(null));

    await expectLater(
      joinServerUseCase.invoke(serverId: ""),
      throwsA(predicate((e) => e is Exception)),
    );

    verify(() => mockGetCurrentUserUseCase.invoke()).called(1);
    verify(() => mockServerRepo.joinServer(userId: any(named: "userId"), serverId: any(named: "serverId"))).called(1);
    verifyNever(() => mockServerRepo.saveServer(any()));
    verifyNever(() => mockChannelRepo.saveAllChannels(any()));
    verifyNever(() => mockUserGroupRepo.saveAllMembers(any(), any()));
  });
}

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  String toString() {
    return "ServerException(message: $message)";
  }
}
