// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async' as _i87;

import 'package:discord_replicate/data/api/client/graphql_client_helper.dart'
    as _i13;
import 'package:discord_replicate/data/api/client/mock_graphql_client_helper.dart'
    as _i14;
import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart'
    as _i61;
import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart'
    as _i55;
import 'package:discord_replicate/data/api/graphql_user_group_remote_api_impl.dart'
    as _i57;
import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart'
    as _i59;
import 'package:discord_replicate/data/api/mocks/mock_channel_remote_api.dart'
    as _i6;
import 'package:discord_replicate/data/api/mocks/mock_server_remote_api.dart'
    as _i21;
import 'package:discord_replicate/data/api/mocks/mock_user_group_remote_api.dart'
    as _i44;
import 'package:discord_replicate/data/api/mocks/mock_user_remote_api.dart'
    as _i48;
import 'package:discord_replicate/data/mapper/channel_mapper.dart' as _i52;
import 'package:discord_replicate/data/mapper/member_mapper.dart' as _i15;
import 'package:discord_replicate/data/mapper/message_mapper.dart' as _i16;
import 'package:discord_replicate/data/mapper/server_mapper.dart' as _i53;
import 'package:discord_replicate/data/mapper/user_mapper.dart' as _i54;
import 'package:discord_replicate/data/module/firebase_module.dart' as _i10;
import 'package:discord_replicate/data/module/graphql_client_module.dart'
    as _i12;
import 'package:discord_replicate/data/repository/channel_repository_impl.dart'
    as _i62;
import 'package:discord_replicate/data/repository/firebase_auth_repository_impl.dart'
    as _i51;
import 'package:discord_replicate/data/repository/mocks/mock_auth_repository.dart'
    as _i4;
import 'package:discord_replicate/data/repository/mocks/mock_channel_repository.dart'
    as _i8;
import 'package:discord_replicate/data/repository/mocks/mock_server_repository.dart'
    as _i23;
import 'package:discord_replicate/data/repository/mocks/mock_user_group_repository.dart'
    as _i46;
import 'package:discord_replicate/data/repository/mocks/mock_user_repository.dart'
    as _i50;
import 'package:discord_replicate/data/repository/server_repository_impl.dart'
    as _i56;
import 'package:discord_replicate/data/repository/user_group_repository_impl.dart'
    as _i58;
import 'package:discord_replicate/data/repository/user_repository_impl.dart'
    as _i60;
import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart'
    as _i30;
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart'
    as _i42;
import 'package:discord_replicate/data/store/channel_store/mock_channel_store.dart'
    as _i31;
import 'package:discord_replicate/data/store/server_store/hivedb_server_store.dart'
    as _i33;
import 'package:discord_replicate/data/store/server_store/inmemory_server_store.dart'
    as _i34;
import 'package:discord_replicate/data/store/server_store/mock_server_store.dart'
    as _i35;
import 'package:discord_replicate/data/store/store.dart' as _i26;
import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart'
    as _i37;
import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart'
    as _i38;
import 'package:discord_replicate/data/store/user_group_store/mock_usergroup_store.dart'
    as _i39;
import 'package:discord_replicate/data/store/user_store/hivedb_user_store.dart'
    as _i28;
import 'package:discord_replicate/data/store/user_store/inmemory_user_store.dart'
    as _i40;
import 'package:discord_replicate/data/store/user_store/mock_user_store.dart'
    as _i41;
import 'package:discord_replicate/data/usecase/auth/sign_in_usecase_impl.dart'
    as _i25;
import 'package:discord_replicate/data/usecase/channel/get_all_channel_member_usecase_impl.dart'
    as _i91;
import 'package:discord_replicate/data/usecase/channel/get_channel_by_id_usecase_impl.dart'
    as _i64;
import 'package:discord_replicate/data/usecase/channel/get_channel_member_by_id_usecase_impl.dart'
    as _i66;
import 'package:discord_replicate/data/usecase/channel/get_channel_messages_usecase_impl.dart'
    as _i68;
import 'package:discord_replicate/data/usecase/channel/send_channel_message_usecase_impl.dart'
    as _i82;
import 'package:discord_replicate/data/usecase/channel/subscribe_channel_message_usecase_impl.dart'
    as _i85;
import 'package:discord_replicate/data/usecase/server/get_server_by_id_usecase_impl.dart'
    as _i72;
import 'package:discord_replicate/data/usecase/server/join_server_usecase_impl.dart'
    as _i76;
import 'package:discord_replicate/data/usecase/server/leave_server_usecase_impl.dart'
    as _i78;
import 'package:discord_replicate/data/usecase/user/get_current_user_usecase_impl.dart'
    as _i70;
import 'package:discord_replicate/data/usecase/user/get_user_by_id_usecase_impl.dart'
    as _i74;
import 'package:discord_replicate/data/usecase/user/observe_user_changes_usecase_impl.dart'
    as _i80;
import 'package:discord_replicate/domain/api/channel_remote_api.dart' as _i5;
import 'package:discord_replicate/domain/api/server_remote_api.dart' as _i20;
import 'package:discord_replicate/domain/api/user_group_remote_api.dart'
    as _i43;
import 'package:discord_replicate/domain/api/user_remote_api.dart' as _i47;
import 'package:discord_replicate/domain/model/channel.dart' as _i29;
import 'package:discord_replicate/domain/model/server.dart' as _i32;
import 'package:discord_replicate/domain/model/user.dart' as _i27;
import 'package:discord_replicate/domain/model/user_group.dart' as _i36;
import 'package:discord_replicate/domain/repository/auth_repository.dart'
    as _i3;
import 'package:discord_replicate/domain/repository/channel_repository.dart'
    as _i7;
import 'package:discord_replicate/domain/repository/server_repository.dart'
    as _i22;
import 'package:discord_replicate/domain/repository/user_group_repository.dart'
    as _i45;
import 'package:discord_replicate/domain/repository/user_repository.dart'
    as _i49;
import 'package:discord_replicate/domain/usecase/auth/sign_in_usecase.dart'
    as _i24;
import 'package:discord_replicate/domain/usecase/channel/get_all_channel_member_usecase.dart'
    as _i90;
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart'
    as _i63;
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart'
    as _i65;
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart'
    as _i67;
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart'
    as _i81;
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart'
    as _i84;
import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart'
    as _i71;
import 'package:discord_replicate/domain/usecase/server/join_server_usecase.dart'
    as _i75;
import 'package:discord_replicate/domain/usecase/server/leave_server_usecase.dart'
    as _i77;
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart'
    as _i69;
import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart'
    as _i73;
import 'package:discord_replicate/domain/usecase/user/observe_user_changes_usecase.dart'
    as _i79;
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart'
    as _i18;
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart'
    as _i88;
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart'
    as _i89;
import 'package:discord_replicate/presentation/bloc/message/message_bloc.dart'
    as _i92;
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart'
    as _i17;
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart'
    as _i83;
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart'
    as _i86;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:flutter/cupertino.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i11;
import 'package:injectable/injectable.dart' as _i2;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseModule = _$FirebaseModule();
  final graphQLClientModule = _$GraphQLClientModule();
  gh.lazySingleton<_i3.AuthRepository>(() => _i4.MockAuthRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i5.ChannelRemoteApi>(() => _i6.MockChannelRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i7.ChannelRepository>(() => _i8.MockChannelRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i9.FirebaseAuth>(() => _i10.MockFirebaseAuth(),
      registerFor: {_test});
  gh.lazySingleton<_i9.FirebaseAuth>(() => firebaseModule.auth(),
      registerFor: {_dev, _prod});
  gh.lazySingleton<_i11.GraphQLClient>(() => _i12.MockGraphQLClient(),
      registerFor: {_test});
  gh.lazySingleton<_i13.GraphQLClientHelper>(
      () => _i14.MockGraphQLClientHelper(),
      registerFor: {_test});
  gh.factory<_i15.MemberMapper>(() => _i15.MemberMapper());
  gh.factory<_i16.MessageMapper>(() => _i16.MessageMapper());
  gh.factoryParam<_i17.NavigationCubit, _i18.AuthBloc,
          _i19.GlobalKey<_i19.NavigatorState>>(
      (_authBloc, _navigator) => _i17.NavigationCubit(_authBloc, _navigator));
  gh.lazySingleton<_i20.ServerRemoteApi>(() => _i21.MockServerRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i22.ServerRepository>(() => _i23.MockServerRepository(),
      registerFor: {_test});
  gh.factory<_i24.SignInUseCase>(() => _i25.SignInUseCaseImpl(),
      registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i27.User>>(() => _i28.HiveUserStore(),
      instanceName: 'DB_USER', registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i29.Channel>>(() => _i30.HiveChannelStore(),
      instanceName: 'DB_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i29.Channel>>(() => _i31.MockHiveChannelStore(),
      instanceName: 'DB_CHANNEL', registerFor: {_test});
  gh.factory<_i26.Store<_i29.Channel>>(() => _i31.MockCacheChannelStore(),
      instanceName: 'CACHE_CHANNEL', registerFor: {_test});
  gh.factory<_i26.Store<_i32.Server>>(() => _i33.HiveServerStore(),
      instanceName: 'DB_SERVER', registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i32.Server>>(() => _i34.InMemoryServerStore(),
      instanceName: 'CACHE_SERVER', registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i32.Server>>(() => _i35.MockHiveServerStore(),
      instanceName: 'DB_SERVER', registerFor: {_test});
  gh.factory<_i26.Store<_i32.Server>>(() => _i35.MockCacheServerStore(),
      instanceName: 'CACHE_SERVER', registerFor: {_test});
  gh.factory<_i26.Store<_i36.UserGroup>>(() => _i37.HiveUserGroupStore(),
      instanceName: 'DB_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i36.UserGroup>>(() => _i38.InMemoryUserGroupStore(),
      instanceName: 'CACHE_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i36.UserGroup>>(() => _i39.MockHiveUserGroupStore(),
      instanceName: 'DB_USERGROUP', registerFor: {_test});
  gh.factory<_i26.Store<_i36.UserGroup>>(() => _i39.MockCacheUserGroupStore(),
      instanceName: 'CACHE_USERGROUP', registerFor: {_test});
  gh.factory<_i26.Store<_i27.User>>(() => _i40.InMemoryUserStore(),
      instanceName: 'CACHE_USER', registerFor: {_prod, _dev});
  gh.factory<_i26.Store<_i27.User>>(() => _i41.MockHiveUserStore(),
      instanceName: 'DB_USER', registerFor: {_test});
  gh.factory<_i26.Store<_i27.User>>(() => _i41.MockCacheUserStore(),
      instanceName: 'CACHE_USER', registerFor: {_test});
  gh.factory<_i26.Store<_i29.Channel>>(() => _i42.InMemoryChannelStore(),
      instanceName: 'CACHE_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<String>(() => graphQLClientModule.wsUrl, instanceName: 'WS_URL');
  gh.factory<String>(() => graphQLClientModule.baseUrl,
      instanceName: 'BASE_URL');
  gh.lazySingleton<_i43.UserGroupRemoteApi>(() => _i44.MockUserGroupRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i45.UserGroupRepository>(
      () => _i46.MockUserGroupRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i47.UserRemoteApi>(() => _i48.MockUserRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i49.UserRepository>(() => _i50.MockUserRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i18.AuthBloc>(
      () => _i18.AuthBloc(get<_i3.AuthRepository>()));
  gh.lazySingleton<_i3.AuthRepository>(
      () => _i51.FirebaseAuthRepositoryImpl(get<_i9.FirebaseAuth>()),
      registerFor: {_prod, _dev});
  gh.factory<_i52.ChannelMapper>(() =>
      _i52.ChannelMapper(get<_i16.MessageMapper>(), get<_i15.MemberMapper>()));
  gh.factory<_i11.Link>(
      () => graphQLClientModule.link(get<String>(instanceName: 'BASE_URL'),
          get<String>(instanceName: 'WS_URL'), get<_i3.AuthRepository>()),
      instanceName: 'API_LINK');
  gh.factory<_i53.ServerMapper>(
      () => _i53.ServerMapper(get<_i52.ChannelMapper>()));
  gh.factory<_i54.UserMapper>(() =>
      _i54.UserMapper(get<_i52.ChannelMapper>(), get<_i53.ServerMapper>()));
  gh.lazySingleton<_i11.GraphQLClient>(
      () =>
          graphQLClientModule.client(get<_i11.Link>(instanceName: 'API_LINK')),
      registerFor: {_dev, _prod});
  gh.singleton<_i13.GraphQLClientHelper>(
      _i13.GraphQLClientHelper(get<_i11.GraphQLClient>()),
      registerFor: {_dev, _prod});
  gh.lazySingleton<_i20.ServerRemoteApi>(
      () => _i55.GraphQLServerRemoteApiImpl(
          get<_i13.GraphQLClientHelper>(), get<_i53.ServerMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i22.ServerRepository>(
      _i56.ServerRepositoryImpl(
          get<_i20.ServerRemoteApi>(),
          get<_i26.Store<_i32.Server>>(instanceName: 'DB_SERVER'),
          get<_i26.Store<_i32.Server>>(instanceName: 'CACHE_SERVER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i43.UserGroupRemoteApi>(
      () => _i57.GraphQLUserGroupRemoteApiImpl(
          get<_i13.GraphQLClientHelper>(), get<_i15.MemberMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i45.UserGroupRepository>(
      _i58.UserGroupRepositoryImpl(
          get<_i43.UserGroupRemoteApi>(),
          get<_i26.Store<_i36.UserGroup>>(instanceName: 'DB_USERGROUP'),
          get<_i26.Store<_i36.UserGroup>>(instanceName: 'CACHE_USERGROUP')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i47.UserRemoteApi>(
      () => _i59.GraphQLUserRemoteApiImpl(
          get<_i13.GraphQLClientHelper>(), get<_i54.UserMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i49.UserRepository>(
      _i60.UserRepositoryImpl(
          get<_i47.UserRemoteApi>(),
          get<_i26.Store<_i27.User>>(instanceName: 'DB_USER'),
          get<_i26.Store<_i27.User>>(instanceName: 'CACHE_USER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i5.ChannelRemoteApi>(
      () => _i61.GraphQLChannelRemoteApiImpl(get<_i13.GraphQLClientHelper>(),
          get<_i16.MessageMapper>(), get<_i52.ChannelMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i7.ChannelRepository>(
      _i62.ChannelRepositoryImpl(
          get<_i5.ChannelRemoteApi>(),
          get<_i26.Store<_i29.Channel>>(instanceName: 'DB_CHANNEL'),
          get<_i26.Store<_i29.Channel>>(instanceName: 'CACHE_CHANNEL')),
      registerFor: {_prod, _dev});
  gh.factory<_i63.GetChannelByIdUseCase>(
      () => _i64.GetChannelByIdUseCaseImpl(get<_i7.ChannelRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i65.GetChannelMemberByIdUseCase>(
      () => _i66.GetChannelMemberByIdUseCaseImpl(
          get<_i63.GetChannelByIdUseCase>(), get<_i45.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i67.GetChannelMessagesUseCase>(
      () => _i68.GetChannelMessageUseCaseImpl(get<_i7.ChannelRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i69.GetCurrentUserUseCase>(
      () => _i70.GetCurrentUserUseCaseImpl(
          get<_i3.AuthRepository>(), get<_i49.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i71.GetServerByIdUseCase>(
      () => _i72.GetServerByIdUseCaseImpl(get<_i22.ServerRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i73.GetUserByIdUseCase>(
      () => _i74.GetUserByIdUseCaseImpl(get<_i49.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i75.JoinServerUseCase>(
      () => _i76.JoinServerUseCaseImpl(
          get<_i69.GetCurrentUserUseCase>(),
          get<_i49.UserRepository>(),
          get<_i22.ServerRepository>(),
          get<_i7.ChannelRepository>(),
          get<_i45.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i77.LeaveServerUseCase>(
      () => _i78.LeaveServerUseCaseImpl(
          get<_i69.GetCurrentUserUseCase>(),
          get<_i22.ServerRepository>(),
          get<_i7.ChannelRepository>(),
          get<_i49.UserRepository>(),
          get<_i45.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i79.ObserveUserChangesUseCase>(
      () => _i80.ObserveUserChangesUseCaseImpl(get<_i49.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i81.SendChannelMessageUseCase>(
      () => _i82.SendChannelMessageUseCaseImpl(get<_i7.ChannelRepository>(),
          get<_i65.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factory<_i83.ServerBloc>(() => _i83.ServerBloc(
      get<_i71.GetServerByIdUseCase>(),
      get<_i75.JoinServerUseCase>(),
      get<_i77.LeaveServerUseCase>()));
  gh.factory<_i84.SubscribeChannelMessageUseCase>(
      () => _i85.SubscribeChannelMessageUseCaseImpl(
          get<_i7.ChannelRepository>(),
          get<_i65.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i86.UserBloc, _i87.Stream<_i18.AuthState>, dynamic>(
      (authStateStream, _) => _i86.UserBloc(
          authStateStream,
          get<_i69.GetCurrentUserUseCase>(),
          get<_i79.ObserveUserChangesUseCase>()));
  gh.factoryParam<_i88.ChannelBloc, _i83.ServerBloc, _i89.DirectMessageBloc>(
      (_serverBloc, _dmBloc) => _i88.ChannelBloc(
          _serverBloc, _dmBloc, get<_i63.GetChannelByIdUseCase>()));
  gh.factoryParam<_i89.DirectMessageBloc, _i87.Stream<_i86.UserState>, dynamic>(
      (userStateStream, _) => _i89.DirectMessageBloc(
          userStateStream, get<_i69.GetCurrentUserUseCase>()));
  gh.factory<_i90.GetAllChannelMemberUseCase>(
      () => _i91.GetAllChannelMemberUseCaseImpl(
          get<_i45.UserGroupRepository>(), get<_i63.GetChannelByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i92.MessageBloc, _i87.Stream<_i88.ChannelState>, dynamic>(
      (channelStateStream, _) => _i92.MessageBloc(
          channelStateStream,
          get<_i69.GetCurrentUserUseCase>(),
          get<_i84.SubscribeChannelMessageUseCase>(),
          get<_i67.GetChannelMessagesUseCase>(),
          get<_i65.GetChannelMemberByIdUseCase>(),
          get<_i81.SendChannelMessageUseCase>()));
  return get;
}

class _$FirebaseModule extends _i10.FirebaseModule {}

class _$GraphQLClientModule extends _i12.GraphQLClientModule {}
