// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async' as _i65;

import 'package:discord_replicate/data/api/client/api_module.dart' as _i71;
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart'
    as _i24;
import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart'
    as _i38;
import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart'
    as _i26;
import 'package:discord_replicate/data/api/graphql_user_group_remote_api_impl.dart'
    as _i30;
import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart'
    as _i34;
import 'package:discord_replicate/data/repository/channel_repository_impl.dart'
    as _i40;
import 'package:discord_replicate/data/repository/firebase_auth_repository_impl.dart'
    as _i4;
import 'package:discord_replicate/data/repository/server_repository_impl.dart'
    as _i28;
import 'package:discord_replicate/data/repository/user_group_repository_impl.dart'
    as _i32;
import 'package:discord_replicate/data/repository/user_repository_impl.dart'
    as _i36;
import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart'
    as _i21;
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart'
    as _i20;
import 'package:discord_replicate/data/store/server_store/hivedb_server_store.dart'
    as _i18;
import 'package:discord_replicate/data/store/server_store/inmemory_server_store.dart'
    as _i22;
import 'package:discord_replicate/data/store/store.dart' as _i10;
import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart'
    as _i16;
import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart'
    as _i15;
import 'package:discord_replicate/data/store/user_store/hivedb_user_store.dart'
    as _i13;
import 'package:discord_replicate/data/store/user_store/inmemory_user_store.dart'
    as _i12;
import 'package:discord_replicate/data/usecase/auth/sign_in_usecase_impl.dart'
    as _i9;
import 'package:discord_replicate/data/usecase/channel/get_all_channel_member_usecase_impl.dart'
    as _i69;
import 'package:discord_replicate/data/usecase/channel/get_channel_by_id_usecase_impl.dart'
    as _i42;
import 'package:discord_replicate/data/usecase/channel/get_channel_member_by_id_usecase_impl.dart'
    as _i44;
import 'package:discord_replicate/data/usecase/channel/get_channel_messages_usecase_impl.dart'
    as _i46;
import 'package:discord_replicate/data/usecase/channel/send_channel_message_usecase_impl.dart'
    as _i60;
import 'package:discord_replicate/data/usecase/channel/subscribe_channel_message_usecase_impl.dart'
    as _i63;
import 'package:discord_replicate/data/usecase/server/get_server_by_id_usecase_impl.dart'
    as _i50;
import 'package:discord_replicate/data/usecase/server/join_server_usecase_impl.dart'
    as _i54;
import 'package:discord_replicate/data/usecase/server/leave_server_usecase_impl.dart'
    as _i56;
import 'package:discord_replicate/data/usecase/user/get_current_user_usecase_impl.dart'
    as _i48;
import 'package:discord_replicate/data/usecase/user/get_user_by_id_usecase_impl.dart'
    as _i52;
import 'package:discord_replicate/data/usecase/user/observe_user_changes_usecase_impl.dart'
    as _i58;
import 'package:discord_replicate/domain/api/channel_remote_api.dart' as _i37;
import 'package:discord_replicate/domain/api/server_remote_api.dart' as _i25;
import 'package:discord_replicate/domain/api/user_group_remote_api.dart'
    as _i29;
import 'package:discord_replicate/domain/api/user_remote_api.dart' as _i33;
import 'package:discord_replicate/domain/model/channel.dart' as _i19;
import 'package:discord_replicate/domain/model/server.dart' as _i17;
import 'package:discord_replicate/domain/model/user.dart' as _i11;
import 'package:discord_replicate/domain/model/user_group.dart' as _i14;
import 'package:discord_replicate/domain/repository/auth_repository.dart'
    as _i3;
import 'package:discord_replicate/domain/repository/channel_repository.dart'
    as _i39;
import 'package:discord_replicate/domain/repository/server_repository.dart'
    as _i27;
import 'package:discord_replicate/domain/repository/user_group_repository.dart'
    as _i31;
import 'package:discord_replicate/domain/repository/user_repository.dart'
    as _i35;
import 'package:discord_replicate/domain/usecase/auth/sign_in_usecase.dart'
    as _i8;
import 'package:discord_replicate/domain/usecase/channel/get_all_channel_member_usecase.dart'
    as _i68;
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart'
    as _i41;
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart'
    as _i43;
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart'
    as _i45;
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart'
    as _i59;
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart'
    as _i62;
import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart'
    as _i49;
import 'package:discord_replicate/domain/usecase/server/join_server_usecase.dart'
    as _i53;
import 'package:discord_replicate/domain/usecase/server/leave_server_usecase.dart'
    as _i55;
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart'
    as _i47;
import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart'
    as _i51;
import 'package:discord_replicate/domain/usecase/user/observe_user_changes_usecase.dart'
    as _i57;
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart'
    as _i6;
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart'
    as _i66;
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart'
    as _i67;
import 'package:discord_replicate/presentation/bloc/message/message_bloc.dart'
    as _i70;
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart'
    as _i5;
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart'
    as _i61;
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart'
    as _i64;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i23;
import 'package:injectable/injectable.dart' as _i2;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i3.AuthRepository>(() => _i4.FirebaseAuthRepositoryImpl(),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i5.NavigationCubit, _i6.AuthBloc,
          _i7.GlobalKey<_i7.NavigatorState>>(
      (_authBloc, _navigator) => _i5.NavigationCubit(_authBloc, _navigator));
  gh.factory<_i8.SignInUseCase>(() => _i9.SignInUseCaseImpl(),
      registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i11.User>>(() => _i12.InMemoryUserStore(),
      instanceName: 'CACHE_USER', registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i11.User>>(() => _i13.HiveUserStore(),
      instanceName: 'DB_USER', registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i14.UserGroup>>(() => _i15.InMemoryUserGroupStore(),
      instanceName: 'CACHE_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i14.UserGroup>>(() => _i16.HiveUserGroupStore(),
      instanceName: 'DB_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i17.Server>>(() => _i18.HiveServerStore(),
      instanceName: 'DB_SERVER', registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i19.Channel>>(() => _i20.InMemoryChannelStore(),
      instanceName: 'CACHE_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i19.Channel>>(() => _i21.HiveChannelStore(),
      instanceName: 'DB_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<_i10.Store<_i17.Server>>(() => _i22.InMemoryServerStore(),
      instanceName: 'CACHE_SERVER', registerFor: {_prod, _dev});
  gh.factory<String>(() => apiModule.baseUrl, instanceName: 'BASE_URL');
  gh.factory<String>(() => apiModule.wsUrl, instanceName: 'WS_URL');
  gh.lazySingleton<_i6.AuthBloc>(() => _i6.AuthBloc(get<_i3.AuthRepository>()));
  gh.factory<_i23.Link>(
      () => apiModule.link(get<String>(instanceName: 'BASE_URL'),
          get<String>(instanceName: 'WS_URL'), get<_i3.AuthRepository>()),
      instanceName: 'API_LINK');
  gh.lazySingleton<_i23.GraphQLClient>(
      () => apiModule.client(get<_i23.Link>(instanceName: 'API_LINK')));
  gh.singleton<_i24.GraphQLClientHelper>(
      _i24.GraphQLClientHelper(get<_i23.GraphQLClient>()));
  gh.lazySingleton<_i25.ServerRemoteApi>(
      () => _i26.GraphQLServerRemoteApiImpl(get<_i24.GraphQLClientHelper>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i27.ServerRepository>(
      () => _i28.ServerRepositoryImpl(
          get<_i25.ServerRemoteApi>(),
          get<_i10.Store<_i17.Server>>(instanceName: 'DB_SERVER'),
          get<_i10.Store<_i17.Server>>(instanceName: 'CACHE_SERVER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i29.UserGroupRemoteApi>(
      () => _i30.GraphQLUserGroupRemoteApiImpl(get<_i24.GraphQLClientHelper>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i31.UserGroupRepository>(
      () => _i32.UserGroupRepositoryImpl(
          get<_i29.UserGroupRemoteApi>(),
          get<_i10.Store<_i14.UserGroup>>(instanceName: 'DB_USERGROUP'),
          get<_i10.Store<_i14.UserGroup>>(instanceName: 'CACHE_USERGROUP')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i33.UserRemoteApi>(
      () => _i34.GraphQLUserRemoteApiImpl(get<_i24.GraphQLClientHelper>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i35.UserRepository>(
      () => _i36.UserRepositoryImpl(
          get<_i33.UserRemoteApi>(),
          get<_i10.Store<_i11.User>>(instanceName: 'DB_USER'),
          get<_i10.Store<_i11.User>>(instanceName: 'CACHE_USER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i37.ChannelRemoteApi>(
      () => _i38.GraphQLChannelRemoteApiImpl(get<_i24.GraphQLClientHelper>()),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i39.ChannelRepository>(
      () => _i40.ChannelRepositoryImpl(
          get<_i37.ChannelRemoteApi>(),
          get<_i10.Store<_i19.Channel>>(instanceName: 'DB_CHANNEL'),
          get<_i10.Store<_i19.Channel>>(instanceName: 'CACHE_CHANNEL')),
      registerFor: {_prod, _dev});
  gh.factory<_i41.GetChannelByIdUseCase>(
      () => _i42.GetChannelByIdUseCaseImpl(get<_i39.ChannelRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i43.GetChannelMemberByIdUseCase>(
      () => _i44.GetChannelMemberByIdUseCaseImpl(
          get<_i41.GetChannelByIdUseCase>(), get<_i31.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i45.GetChannelMessagesUseCase>(
      () => _i46.GetChannelMessageUseCaseImpl(get<_i39.ChannelRepository>(),
          get<_i43.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factory<_i47.GetCurrentUserUseCase>(
      () => _i48.GetCurrentUserUseCaseImpl(
          get<_i3.AuthRepository>(), get<_i35.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i49.GetServerByIdUseCase>(
      () => _i50.GetServerByIdUseCaseImpl(get<_i27.ServerRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i51.GetUserByIdUseCase>(
      () => _i52.GetUserByIdUseCaseImpl(get<_i35.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i53.JoinServerUseCase>(
      () => _i54.JoinServerUseCaseImpl(
          get<_i47.GetCurrentUserUseCase>(),
          get<_i35.UserRepository>(),
          get<_i27.ServerRepository>(),
          get<_i39.ChannelRepository>(),
          get<_i31.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i55.LeaveServerUseCase>(
      () => _i56.LeaveServerUseCaseImpl(
          get<_i47.GetCurrentUserUseCase>(),
          get<_i27.ServerRepository>(),
          get<_i39.ChannelRepository>(),
          get<_i35.UserRepository>(),
          get<_i31.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i57.ObserveUserChangesUseCase>(
      () => _i58.ObserveUserChangesUseCaseImpl(get<_i35.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i59.SendChannelMessageUseCase>(
      () => _i60.SendChannelMessageUseCaseImpl(get<_i39.ChannelRepository>(),
          get<_i43.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factory<_i61.ServerBloc>(() => _i61.ServerBloc(
      get<_i49.GetServerByIdUseCase>(),
      get<_i53.JoinServerUseCase>(),
      get<_i55.LeaveServerUseCase>()));
  gh.factory<_i62.SubscribeChannelMessageUseCase>(
      () => _i63.SubscribeChannelMessageUseCaseImpl(
          get<_i39.ChannelRepository>(),
          get<_i43.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i64.UserBloc, _i65.Stream<_i6.AuthState>, dynamic>(
      (authStateStream, _) => _i64.UserBloc(
          authStateStream,
          get<_i47.GetCurrentUserUseCase>(),
          get<_i57.ObserveUserChangesUseCase>()));
  gh.factoryParam<_i66.ChannelBloc, _i61.ServerBloc, _i67.DirectMessageBloc>(
      (_serverBloc, _dmBloc) => _i66.ChannelBloc(
          _serverBloc, _dmBloc, get<_i41.GetChannelByIdUseCase>()));
  gh.factoryParam<_i67.DirectMessageBloc, _i65.Stream<_i64.UserState>, dynamic>(
      (userStateStream, _) => _i67.DirectMessageBloc(
          userStateStream, get<_i47.GetCurrentUserUseCase>()));
  gh.factory<_i68.GetAllChannelMemberUseCase>(
      () => _i69.GetAllChannelMemberUseCaseImpl(
          get<_i31.UserGroupRepository>(), get<_i41.GetChannelByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i70.MessageBloc, _i19.Channel, dynamic>((_channel, _) =>
      _i70.MessageBloc(
          _channel,
          get<_i47.GetCurrentUserUseCase>(),
          get<_i62.SubscribeChannelMessageUseCase>(),
          get<_i45.GetChannelMessagesUseCase>(),
          get<_i43.GetChannelMemberByIdUseCase>(),
          get<_i59.SendChannelMessageUseCase>()));
  return get;
}

class _$ApiModule extends _i71.ApiModule {}
