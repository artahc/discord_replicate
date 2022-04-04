// import 'package:discord_replicate/data/usecase/server/leave_server_usecase_impl.dart';
// import 'package:discord_replicate/domain/model/channel.dart';
// import 'package:discord_replicate/domain/model/member.dart';
// import 'package:discord_replicate/domain/model/server.dart';
// import 'package:discord_replicate/domain/model/user.dart';
// import 'package:discord_replicate/domain/repository/channel_repository.dart';
// import 'package:discord_replicate/domain/repository/server_repository.dart';
// import 'package:discord_replicate/domain/repository/user_group_repository.dart';
// import 'package:discord_replicate/domain/repository/user_repository.dart';
// import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class MockUserRepository extends Mock implements UserRepository {}

// class MockServerRepository extends Mock implements ServerRepository {}

// class MockChannelRepository extends Mock implements ChannelRepository {}

// class MockUserGroupRepository extends Mock implements UserGroupRepository {}

// class MockGetCurrentUserUseCase extends Mock implements GetCurrentUserUseCase {}

// class MockUser extends Mock implements User {}

// class MockServer extends Mock implements Server {}

// class MockChannel extends Mock implements Channel {}

// class MockMember extends Mock implements Member {}

// void main() {
//   group("Logic Test, all mocked, ensure all required method called.", () {
//     var mockUserRepo = MockUserRepository();
//     var mockServerRepo = MockServerRepository();
//     var mockChannelRepo = MockChannelRepository();
//     var mockUserGroupRepo = MockUserGroupRepository();
//     var mockGetCurrentUserUseCase = MockGetCurrentUserUseCase();

//     var mockUser = MockUser();
//     var mockServer = MockServer();
//     var mockMember = MockMember();

//     var leaveServerUseCase = LeaveServerUseCaseImpl(
//       getCurrentUserUseCase: mockGetCurrentUserUseCase,
//       channelRepo: mockChannelRepo,
//       serverRepo: mockServerRepo,
//       _userGroupRepo: mockUserGroupRepo,
//       userRepo: mockUserRepo,
//     );
//     setUpAll(() {
//       registerFallbackValue(mockUser);
//       registerFallbackValue(mockServer);
//       registerFallbackValue(mockMember);
//     });

//     tearDown(() {
//       reset(mockUserRepo);
//       reset(mockServerRepo);
//       reset(mockChannelRepo);
//       reset(mockUserGroupRepo);
//       reset(mockGetCurrentUserUseCase);
//     });

//     test("Leave server. Verify all required method called.", () async {
//       var fakeUser = User(uid: "uid", name: "name", avatarUrl: "avatarUrl", about: "about");
//       var fakeServer = Server(id: "id", name: "name", imageUrl: "imageUrl", userGroupRef: "userGroupRef");

//       when(() => mockGetCurrentUserUseCase.invoke()).thenAnswer((_) async => fakeUser);
//       when(() => mockServerRepo.leaveServer(any())).thenAnswer((_) async => null);
//       when(() => mockServerRepo.getServerById(any())).thenAnswer((_) async => fakeServer);
//       when(() => mockChannelRepo.deleteAllChannel(any())).thenAnswer((_) async => null);
//       when(() => mockUserGroupRepo.deleteUserGroupById(any())).thenAnswer((_) async => null);
//       when(() => mockUserRepo.saveUser(any())).thenAnswer((_) async => null);

//       await expectLater(leaveServerUseCase.invoke(serverId: ""), completes);

//       verify(() => mockGetCurrentUserUseCase.invoke()).called(1);
//       verify(() => mockServerRepo.leaveServer(any())).called(1);
//       verify(() => mockServerRepo.getServerById(any())).called(1);
//       verify(() => mockChannelRepo.deleteAllChannel(any())).called(1);
//       verify(() => mockUserGroupRepo.deleteUserGroupById(any())).called(1);
//       verify(() => mockUserRepo.saveUser(any())).called(1);

//       verifyNoMoreInteractions(mockServerRepo);
//       verifyNoMoreInteractions(mockUserGroupRepo);
//       verifyNoMoreInteractions(mockChannelRepo);
//       verifyNoMoreInteractions(mockUserRepo);
//       verifyNoMoreInteractions(mockGetCurrentUserUseCase);
//     });
//   });
// }
