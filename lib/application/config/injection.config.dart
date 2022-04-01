// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async' as _i80;

import 'package:discord_replicate/data/api/client/graphql_client_helper.dart'
    as _i47;
import 'package:discord_replicate/data/api/client/graphql_client_module.dart'
    as _i86;
import 'package:discord_replicate/data/api/client/mock_graphql_client_helper.dart'
    as _i11;
import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart'
    as _i54;
import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart'
    as _i48;
import 'package:discord_replicate/data/api/graphql_user_group_remote_api_impl.dart'
    as _i50;
import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart'
    as _i52;
import 'package:discord_replicate/data/api/mocks/mock_channel_remote_api.dart'
    as _i6;
import 'package:discord_replicate/data/api/mocks/mock_server_remote_api.dart'
    as _i18;
import 'package:discord_replicate/data/api/mocks/mock_user_group_remote_api.dart'
    as _i37;
import 'package:discord_replicate/data/api/mocks/mock_user_remote_api.dart'
    as _i41;
import 'package:discord_replicate/data/mapper/channel_mapper.dart' as _i44;
import 'package:discord_replicate/data/mapper/member_mapper.dart' as _i12;
import 'package:discord_replicate/data/mapper/message_mapper.dart' as _i13;
import 'package:discord_replicate/data/mapper/server_mapper.dart' as _i45;
import 'package:discord_replicate/data/mapper/user_mapper.dart' as _i46;
import 'package:discord_replicate/data/repository/channel_repository_impl.dart'
    as _i55;
import 'package:discord_replicate/data/repository/firebase_auth_repository_impl.dart'
    as _i4;
import 'package:discord_replicate/data/repository/mocks/mock_auth_repository.dart'
    as _i8;
import 'package:discord_replicate/data/repository/mocks/mock_channel_repository.dart'
    as _i9;
import 'package:discord_replicate/data/repository/mocks/mock_server_repository.dart'
    as _i20;
import 'package:discord_replicate/data/repository/mocks/mock_user_group_repository.dart'
    as _i39;
import 'package:discord_replicate/data/repository/mocks/mock_user_repository.dart'
    as _i43;
import 'package:discord_replicate/data/repository/server_repository_impl.dart'
    as _i49;
import 'package:discord_replicate/data/repository/user_group_repository_impl.dart'
    as _i51;
import 'package:discord_replicate/data/repository/user_repository_impl.dart'
    as _i53;
import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart'
    as _i25;
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart'
    as _i26;
import 'package:discord_replicate/data/store/server_store/hivedb_server_store.dart'
    as _i28;
import 'package:discord_replicate/data/store/server_store/inmemory_server_store.dart'
    as _i29;
import 'package:discord_replicate/data/store/store.dart' as _i23;
import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart'
    as _i31;
import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart'
    as _i32;
import 'package:discord_replicate/data/store/user_store/hivedb_user_store.dart'
    as _i35;
import 'package:discord_replicate/data/store/user_store/inmemory_user_store.dart'
    as _i34;
import 'package:discord_replicate/data/usecase/auth/sign_in_usecase_impl.dart'
    as _i22;
import 'package:discord_replicate/data/usecase/channel/get_all_channel_member_usecase_impl.dart'
    as _i84;
import 'package:discord_replicate/data/usecase/channel/get_channel_by_id_usecase_impl.dart'
    as _i57;
import 'package:discord_replicate/data/usecase/channel/get_channel_member_by_id_usecase_impl.dart'
    as _i59;
import 'package:discord_replicate/data/usecase/channel/get_channel_messages_usecase_impl.dart'
    as _i61;
import 'package:discord_replicate/data/usecase/channel/send_channel_message_usecase_impl.dart'
    as _i75;
import 'package:discord_replicate/data/usecase/channel/subscribe_channel_message_usecase_impl.dart'
    as _i78;
import 'package:discord_replicate/data/usecase/server/get_server_by_id_usecase_impl.dart'
    as _i65;
import 'package:discord_replicate/data/usecase/server/join_server_usecase_impl.dart'
    as _i69;
import 'package:discord_replicate/data/usecase/server/leave_server_usecase_impl.dart'
    as _i71;
import 'package:discord_replicate/data/usecase/user/get_current_user_usecase_impl.dart'
    as _i63;
import 'package:discord_replicate/data/usecase/user/get_user_by_id_usecase_impl.dart'
    as _i67;
import 'package:discord_replicate/data/usecase/user/observe_user_changes_usecase_impl.dart'
    as _i73;
import 'package:discord_replicate/domain/api/channel_remote_api.dart' as _i5;
import 'package:discord_replicate/domain/api/server_remote_api.dart' as _i17;
import 'package:discord_replicate/domain/api/user_group_remote_api.dart'
    as _i36;
import 'package:discord_replicate/domain/api/user_remote_api.dart' as _i40;
import 'package:discord_replicate/domain/model/channel.dart' as _i24;
import 'package:discord_replicate/domain/model/server.dart' as _i27;
import 'package:discord_replicate/domain/model/user.dart' as _i33;
import 'package:discord_replicate/domain/model/user_group.dart' as _i30;
import 'package:discord_replicate/domain/repository/auth_repository.dart'
    as _i3;
import 'package:discord_replicate/domain/repository/channel_repository.dart'
    as _i7;
import 'package:discord_replicate/domain/repository/server_repository.dart'
    as _i19;
import 'package:discord_replicate/domain/repository/user_group_repository.dart'
    as _i38;
import 'package:discord_replicate/domain/repository/user_repository.dart'
    as _i42;
import 'package:discord_replicate/domain/usecase/auth/sign_in_usecase.dart'
    as _i21;
import 'package:discord_replicate/domain/usecase/channel/get_all_channel_member_usecase.dart'
    as _i83;
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart'
    as _i56;
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart'
    as _i58;
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart'
    as _i60;
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart'
    as _i74;
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart'
    as _i77;
import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart'
    as _i64;
import 'package:discord_replicate/domain/usecase/server/join_server_usecase.dart'
    as _i68;
import 'package:discord_replicate/domain/usecase/server/leave_server_usecase.dart'
    as _i70;
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart'
    as _i62;
import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart'
    as _i66;
import 'package:discord_replicate/domain/usecase/user/observe_user_changes_usecase.dart'
    as _i72;
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart'
    as _i15;
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart'
    as _i81;
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart'
    as _i82;
import 'package:discord_replicate/presentation/bloc/message/message_bloc.dart'
    as _i85;
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart'
    as _i14;
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart'
    as _i76;
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart'
    as _i79;
import 'package:flutter/cupertino.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final graphQLClientModule = _$GraphQLClientModule();
  gh.singleton<_i3.AuthRepository>(_i4.FirebaseAuthRepositoryImpl(),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i5.ChannelRemoteApi>(() => _i6.MockChannelRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i7.ChannelRepository>(() => _i8.MockChannelRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i7.ChannelRepository>(() => _i9.MockChannelRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i10.GraphQLClient>(() => graphQLClientModule.mockClient(),
      registerFor: {_test});
  gh.singleton<_i10.GraphQLClient>(_i11.MockGraphQLClient(),
      registerFor: {_test});
  gh.factory<_i12.MemberMapper>(() => _i12.MemberMapper());
  gh.factory<_i13.MessageMapper>(() => _i13.MessageMapper());
  gh.factoryParam<_i14.NavigationCubit, _i15.AuthBloc,
          _i16.GlobalKey<_i16.NavigatorState>>(
      (_authBloc, _navigator) => _i14.NavigationCubit(_authBloc, _navigator));
  gh.lazySingleton<_i17.ServerRemoteApi>(() => _i18.MockServerRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i19.ServerRepository>(() => _i20.MockServerRepository(),
      registerFor: {_test});
  gh.factory<_i21.SignInUseCase>(() => _i22.SignInUseCaseImpl(),
      registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i24.Channel>>(() => _i25.HiveChannelStore(),
      instanceName: 'DB_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i24.Channel>>(() => _i26.InMemoryChannelStore(),
      instanceName: 'CACHE_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i27.Server>>(() => _i28.HiveServerStore(),
      instanceName: 'DB_SERVER', registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i27.Server>>(() => _i29.InMemoryServerStore(),
      instanceName: 'CACHE_SERVER', registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i30.UserGroup>>(() => _i31.HiveUserGroupStore(),
      instanceName: 'DB_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i30.UserGroup>>(() => _i32.InMemoryUserGroupStore(),
      instanceName: 'CACHE_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i33.User>>(() => _i34.InMemoryUserStore(),
      instanceName: 'CACHE_USER', registerFor: {_prod, _dev});
  gh.factory<_i23.Store<_i33.User>>(() => _i35.HiveUserStore(),
      instanceName: 'DB_USER', registerFor: {_prod, _dev});
  gh.factory<String>(() => graphQLClientModule.wsUrl, instanceName: 'WS_URL');
  gh.factory<String>(() => graphQLClientModule.baseUrl,
      instanceName: 'BASE_URL');
  gh.lazySingleton<_i36.UserGroupRemoteApi>(() => _i37.MockUserGroupRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i38.UserGroupRepository>(
      () => _i39.MockUserGroupRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i40.UserRemoteApi>(() => _i41.MockUserRemoteApi(),
      registerFor: {_test});
  gh.lazySingleton<_i42.UserRepository>(() => _i43.MockUserRepository(),
      registerFor: {_test});
  gh.lazySingleton<_i15.AuthBloc>(
      () => _i15.AuthBloc(get<_i3.AuthRepository>()));
  gh.factory<_i44.ChannelMapper>(() =>
      _i44.ChannelMapper(get<_i13.MessageMapper>(), get<_i12.MemberMapper>()));
  gh.factory<_i10.Link>(
      () => graphQLClientModule.link(get<String>(instanceName: 'BASE_URL'),
          get<String>(instanceName: 'WS_URL'), get<_i3.AuthRepository>()),
      instanceName: 'API_LINK');
  gh.factory<_i45.ServerMapper>(
      () => _i45.ServerMapper(get<_i44.ChannelMapper>()));
  gh.factory<_i46.UserMapper>(() =>
      _i46.UserMapper(get<_i44.ChannelMapper>(), get<_i45.ServerMapper>()));
  gh.lazySingleton<_i10.GraphQLClient>(
      () =>
          graphQLClientModule.client(get<_i10.Link>(instanceName: 'API_LINK')),
      registerFor: {_dev, _prod});
  gh.singleton<_i47.GraphQLClientHelper>(
      _i47.GraphQLClientHelper(get<_i10.GraphQLClient>()),
      registerFor: {_dev, _prod});
  gh.lazySingleton<_i17.ServerRemoteApi>(
      () => _i48.GraphQLServerRemoteApiImpl(
          get<_i47.GraphQLClientHelper>(), get<_i45.ServerMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i19.ServerRepository>(
      _i49.ServerRepositoryImpl(
          get<_i17.ServerRemoteApi>(),
          get<_i23.Store<_i27.Server>>(instanceName: 'DB_SERVER'),
          get<_i23.Store<_i27.Server>>(instanceName: 'CACHE_SERVER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.UserGroupRemoteApi>(
      () => _i50.GraphQLUserGroupRemoteApiImpl(
          get<_i47.GraphQLClientHelper>(), get<_i12.MemberMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i38.UserGroupRepository>(
      _i51.UserGroupRepositoryImpl(
          get<_i36.UserGroupRemoteApi>(),
          get<_i23.Store<_i30.UserGroup>>(instanceName: 'DB_USERGROUP'),
          get<_i23.Store<_i30.UserGroup>>(instanceName: 'CACHE_USERGROUP')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i40.UserRemoteApi>(
      () => _i52.GraphQLUserRemoteApiImpl(
          get<_i47.GraphQLClientHelper>(), get<_i46.UserMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i42.UserRepository>(
      _i53.UserRepositoryImpl(
          get<_i40.UserRemoteApi>(),
          get<_i23.Store<_i33.User>>(instanceName: 'DB_USER'),
          get<_i23.Store<_i33.User>>(instanceName: 'CACHE_USER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i5.ChannelRemoteApi>(
      () => _i54.GraphQLChannelRemoteApiImpl(get<_i47.GraphQLClientHelper>(),
          get<_i13.MessageMapper>(), get<_i44.ChannelMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i7.ChannelRepository>(
      _i55.ChannelRepositoryImpl(
          get<_i5.ChannelRemoteApi>(),
          get<_i23.Store<_i24.Channel>>(instanceName: 'DB_CHANNEL'),
          get<_i23.Store<_i24.Channel>>(instanceName: 'CACHE_CHANNEL')),
      registerFor: {_prod, _dev});
  gh.factory<_i56.GetChannelByIdUseCase>(
      () => _i57.GetChannelByIdUseCaseImpl(get<_i7.ChannelRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i58.GetChannelMemberByIdUseCase>(
      () => _i59.GetChannelMemberByIdUseCaseImpl(
          get<_i56.GetChannelByIdUseCase>(), get<_i38.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i60.GetChannelMessagesUseCase>(
      () => _i61.GetChannelMessageUseCaseImpl(get<_i7.ChannelRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i62.GetCurrentUserUseCase>(
      () => _i63.GetCurrentUserUseCaseImpl(
          get<_i3.AuthRepository>(), get<_i42.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i64.GetServerByIdUseCase>(
      () => _i65.GetServerByIdUseCaseImpl(get<_i19.ServerRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i66.GetUserByIdUseCase>(
      () => _i67.GetUserByIdUseCaseImpl(get<_i42.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i68.JoinServerUseCase>(
      () => _i69.JoinServerUseCaseImpl(
          get<_i62.GetCurrentUserUseCase>(),
          get<_i42.UserRepository>(),
          get<_i19.ServerRepository>(),
          get<_i7.ChannelRepository>(),
          get<_i38.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i70.LeaveServerUseCase>(
      () => _i71.LeaveServerUseCaseImpl(
          get<_i62.GetCurrentUserUseCase>(),
          get<_i19.ServerRepository>(),
          get<_i7.ChannelRepository>(),
          get<_i42.UserRepository>(),
          get<_i38.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i72.ObserveUserChangesUseCase>(
      () => _i73.ObserveUserChangesUseCaseImpl(get<_i42.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i74.SendChannelMessageUseCase>(
      () => _i75.SendChannelMessageUseCaseImpl(get<_i7.ChannelRepository>(),
          get<_i58.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factory<_i76.ServerBloc>(() => _i76.ServerBloc(
      get<_i64.GetServerByIdUseCase>(),
      get<_i68.JoinServerUseCase>(),
      get<_i70.LeaveServerUseCase>()));
  gh.factory<_i77.SubscribeChannelMessageUseCase>(
      () => _i78.SubscribeChannelMessageUseCaseImpl(
          get<_i7.ChannelRepository>(),
          get<_i58.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i79.UserBloc, _i80.Stream<_i15.AuthState>, dynamic>(
      (authStateStream, _) => _i79.UserBloc(
          authStateStream,
          get<_i62.GetCurrentUserUseCase>(),
          get<_i72.ObserveUserChangesUseCase>()));
  gh.factoryParam<_i81.ChannelBloc, _i76.ServerBloc, _i82.DirectMessageBloc>(
      (_serverBloc, _dmBloc) => _i81.ChannelBloc(
          _serverBloc, _dmBloc, get<_i56.GetChannelByIdUseCase>()));
  gh.factoryParam<_i82.DirectMessageBloc, _i80.Stream<_i79.UserState>, dynamic>(
      (userStateStream, _) => _i82.DirectMessageBloc(
          userStateStream, get<_i62.GetCurrentUserUseCase>()));
  gh.factory<_i83.GetAllChannelMemberUseCase>(
      () => _i84.GetAllChannelMemberUseCaseImpl(
          get<_i38.UserGroupRepository>(), get<_i56.GetChannelByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i85.MessageBloc, _i80.Stream<_i81.ChannelState>, dynamic>(
      (channelStateStream, _) => _i85.MessageBloc(
          channelStateStream,
          get<_i62.GetCurrentUserUseCase>(),
          get<_i77.SubscribeChannelMessageUseCase>(),
          get<_i60.GetChannelMessagesUseCase>(),
          get<_i58.GetChannelMemberByIdUseCase>(),
          get<_i74.SendChannelMessageUseCase>()));
  return get;
}

class _$GraphQLClientModule extends _i86.GraphQLClientModule {}
