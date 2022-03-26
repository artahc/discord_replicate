// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:async' as _i68;

import 'package:discord_replicate/data/api/client/api_module.dart' as _i74;
import 'package:discord_replicate/data/api/client/graphql_client_helper.dart'
    as _i27;
import 'package:discord_replicate/data/api/graphql_channel_remote_api_impl.dart'
    as _i41;
import 'package:discord_replicate/data/api/graphql_server_remote_api_impl.dart'
    as _i29;
import 'package:discord_replicate/data/api/graphql_user_group_remote_api_impl.dart'
    as _i33;
import 'package:discord_replicate/data/api/graphql_user_remote_api_impl.dart'
    as _i37;
import 'package:discord_replicate/data/mapper/channel_mapper.dart' as _i25;
import 'package:discord_replicate/data/mapper/member_mapper.dart' as _i5;
import 'package:discord_replicate/data/mapper/message_mapper.dart' as _i6;
import 'package:discord_replicate/data/repository/channel_repository_impl.dart'
    as _i43;
import 'package:discord_replicate/data/repository/firebase_auth_repository_impl.dart'
    as _i4;
import 'package:discord_replicate/data/repository/server_repository_impl.dart'
    as _i31;
import 'package:discord_replicate/data/repository/user_group_repository_impl.dart'
    as _i35;
import 'package:discord_replicate/data/repository/user_repository_impl.dart'
    as _i39;
import 'package:discord_replicate/data/store/channel_store/hivedb_channel_store.dart'
    as _i23;
import 'package:discord_replicate/data/store/channel_store/inmemory_channel_store.dart'
    as _i22;
import 'package:discord_replicate/data/store/server_store/hivedb_server_store.dart'
    as _i20;
import 'package:discord_replicate/data/store/server_store/inmemory_server_store.dart'
    as _i19;
import 'package:discord_replicate/data/store/store.dart' as _i12;
import 'package:discord_replicate/data/store/user_group_store/hivedb_usergroup_store.dart'
    as _i17;
import 'package:discord_replicate/data/store/user_group_store/inmemory_usergroup_store.dart'
    as _i24;
import 'package:discord_replicate/data/store/user_store/hivedb_user_store.dart'
    as _i15;
import 'package:discord_replicate/data/store/user_store/inmemory_user_store.dart'
    as _i14;
import 'package:discord_replicate/data/usecase/auth/sign_in_usecase_impl.dart'
    as _i11;
import 'package:discord_replicate/data/usecase/channel/get_all_channel_member_usecase_impl.dart'
    as _i72;
import 'package:discord_replicate/data/usecase/channel/get_channel_by_id_usecase_impl.dart'
    as _i45;
import 'package:discord_replicate/data/usecase/channel/get_channel_member_by_id_usecase_impl.dart'
    as _i47;
import 'package:discord_replicate/data/usecase/channel/get_channel_messages_usecase_impl.dart'
    as _i49;
import 'package:discord_replicate/data/usecase/channel/send_channel_message_usecase_impl.dart'
    as _i63;
import 'package:discord_replicate/data/usecase/channel/subscribe_channel_message_usecase_impl.dart'
    as _i66;
import 'package:discord_replicate/data/usecase/server/get_server_by_id_usecase_impl.dart'
    as _i53;
import 'package:discord_replicate/data/usecase/server/join_server_usecase_impl.dart'
    as _i57;
import 'package:discord_replicate/data/usecase/server/leave_server_usecase_impl.dart'
    as _i59;
import 'package:discord_replicate/data/usecase/user/get_current_user_usecase_impl.dart'
    as _i51;
import 'package:discord_replicate/data/usecase/user/get_user_by_id_usecase_impl.dart'
    as _i55;
import 'package:discord_replicate/data/usecase/user/observe_user_changes_usecase_impl.dart'
    as _i61;
import 'package:discord_replicate/domain/api/channel_remote_api.dart' as _i40;
import 'package:discord_replicate/domain/api/server_remote_api.dart' as _i28;
import 'package:discord_replicate/domain/api/user_group_remote_api.dart'
    as _i32;
import 'package:discord_replicate/domain/api/user_remote_api.dart' as _i36;
import 'package:discord_replicate/domain/model/channel.dart' as _i21;
import 'package:discord_replicate/domain/model/server.dart' as _i18;
import 'package:discord_replicate/domain/model/user.dart' as _i13;
import 'package:discord_replicate/domain/model/user_group.dart' as _i16;
import 'package:discord_replicate/domain/repository/auth_repository.dart'
    as _i3;
import 'package:discord_replicate/domain/repository/channel_repository.dart'
    as _i42;
import 'package:discord_replicate/domain/repository/server_repository.dart'
    as _i30;
import 'package:discord_replicate/domain/repository/user_group_repository.dart'
    as _i34;
import 'package:discord_replicate/domain/repository/user_repository.dart'
    as _i38;
import 'package:discord_replicate/domain/usecase/auth/sign_in_usecase.dart'
    as _i10;
import 'package:discord_replicate/domain/usecase/channel/get_all_channel_member_usecase.dart'
    as _i71;
import 'package:discord_replicate/domain/usecase/channel/get_channel_by_id_usecase.dart'
    as _i44;
import 'package:discord_replicate/domain/usecase/channel/get_channel_member_by_id_usecase.dart'
    as _i46;
import 'package:discord_replicate/domain/usecase/channel/get_channel_messages_usecase.dart'
    as _i48;
import 'package:discord_replicate/domain/usecase/channel/send_channel_message_usecase.dart'
    as _i62;
import 'package:discord_replicate/domain/usecase/channel/subscribe_channel_message_usecase.dart'
    as _i65;
import 'package:discord_replicate/domain/usecase/server/get_server_by_id_usecase.dart'
    as _i52;
import 'package:discord_replicate/domain/usecase/server/join_server_usecase.dart'
    as _i56;
import 'package:discord_replicate/domain/usecase/server/leave_server_usecase.dart'
    as _i58;
import 'package:discord_replicate/domain/usecase/user/get_current_user_usecase.dart'
    as _i50;
import 'package:discord_replicate/domain/usecase/user/get_user_by_id_usecase.dart'
    as _i54;
import 'package:discord_replicate/domain/usecase/user/observe_user_changes_usecase.dart'
    as _i60;
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart'
    as _i8;
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart'
    as _i69;
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart'
    as _i70;
import 'package:discord_replicate/presentation/bloc/message/message_bloc.dart'
    as _i73;
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart'
    as _i7;
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart'
    as _i64;
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart'
    as _i67;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i26;
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
  gh.singleton<_i3.AuthRepository>(_i4.FirebaseAuthRepositoryImpl(),
      registerFor: {_prod, _dev});
  gh.factory<_i5.MemberMapper>(() => _i5.MemberMapper());
  gh.factory<_i6.MessageMapper>(() => _i6.MessageMapper());
  gh.factoryParam<_i7.NavigationCubit, _i8.AuthBloc,
          _i9.GlobalKey<_i9.NavigatorState>>(
      (_authBloc, _navigator) => _i7.NavigationCubit(_authBloc, _navigator));
  gh.factory<_i10.SignInUseCase>(() => _i11.SignInUseCaseImpl(),
      registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i13.User>>(() => _i14.InMemoryUserStore(),
      instanceName: 'CACHE_USER', registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i13.User>>(() => _i15.HiveUserStore(),
      instanceName: 'DB_USER', registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i16.UserGroup>>(() => _i17.HiveUserGroupStore(),
      instanceName: 'DB_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i18.Server>>(() => _i19.InMemoryServerStore(),
      instanceName: 'CACHE_SERVER', registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i18.Server>>(() => _i20.HiveServerStore(),
      instanceName: 'DB_SERVER', registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i21.Channel>>(() => _i22.InMemoryChannelStore(),
      instanceName: 'CACHE_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i21.Channel>>(() => _i23.HiveChannelStore(),
      instanceName: 'DB_CHANNEL', registerFor: {_prod, _dev});
  gh.factory<_i12.Store<_i16.UserGroup>>(() => _i24.InMemoryUserGroupStore(),
      instanceName: 'CACHE_USERGROUP', registerFor: {_prod, _dev});
  gh.factory<String>(() => apiModule.baseUrl, instanceName: 'BASE_URL');
  gh.factory<String>(() => apiModule.wsUrl, instanceName: 'WS_URL');
  gh.lazySingleton<_i8.AuthBloc>(() => _i8.AuthBloc(get<_i3.AuthRepository>()));
  gh.factory<_i25.ChannelMapper>(() =>
      _i25.ChannelMapper(get<_i6.MessageMapper>(), get<_i5.MemberMapper>()));
  gh.factory<_i26.Link>(
      () => apiModule.link(get<String>(instanceName: 'BASE_URL'),
          get<String>(instanceName: 'WS_URL'), get<_i3.AuthRepository>()),
      instanceName: 'API_LINK');
  gh.lazySingleton<_i26.GraphQLClient>(
      () => apiModule.client(get<_i26.Link>(instanceName: 'API_LINK')));
  gh.singleton<_i27.GraphQLClientHelper>(
      _i27.GraphQLClientHelper(get<_i26.GraphQLClient>()));
  gh.lazySingleton<_i28.ServerRemoteApi>(
      () => _i29.GraphQLServerRemoteApiImpl(get<_i27.GraphQLClientHelper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i30.ServerRepository>(
      _i31.ServerRepositoryImpl(
          get<_i28.ServerRemoteApi>(),
          get<_i12.Store<_i18.Server>>(instanceName: 'DB_SERVER'),
          get<_i12.Store<_i18.Server>>(instanceName: 'CACHE_SERVER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i32.UserGroupRemoteApi>(
      () => _i33.GraphQLUserGroupRemoteApiImpl(get<_i27.GraphQLClientHelper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i34.UserGroupRepository>(
      _i35.UserGroupRepositoryImpl(
          get<_i32.UserGroupRemoteApi>(),
          get<_i12.Store<_i16.UserGroup>>(instanceName: 'DB_USERGROUP'),
          get<_i12.Store<_i16.UserGroup>>(instanceName: 'CACHE_USERGROUP')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i36.UserRemoteApi>(
      () => _i37.GraphQLUserRemoteApiImpl(get<_i27.GraphQLClientHelper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i38.UserRepository>(
      _i39.UserRepositoryImpl(
          get<_i36.UserRemoteApi>(),
          get<_i12.Store<_i13.User>>(instanceName: 'DB_USER'),
          get<_i12.Store<_i13.User>>(instanceName: 'CACHE_USER')),
      registerFor: {_prod, _dev});
  gh.lazySingleton<_i40.ChannelRemoteApi>(
      () => _i41.GraphQLChannelRemoteApiImpl(get<_i27.GraphQLClientHelper>(),
          get<_i6.MessageMapper>(), get<_i25.ChannelMapper>()),
      registerFor: {_prod, _dev});
  gh.singleton<_i42.ChannelRepository>(
      _i43.ChannelRepositoryImpl(
          get<_i40.ChannelRemoteApi>(),
          get<_i12.Store<_i21.Channel>>(instanceName: 'DB_CHANNEL'),
          get<_i12.Store<_i21.Channel>>(instanceName: 'CACHE_CHANNEL')),
      registerFor: {_prod, _dev});
  gh.factory<_i44.GetChannelByIdUseCase>(
      () => _i45.GetChannelByIdUseCaseImpl(get<_i42.ChannelRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i46.GetChannelMemberByIdUseCase>(
      () => _i47.GetChannelMemberByIdUseCaseImpl(
          get<_i44.GetChannelByIdUseCase>(), get<_i34.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i48.GetChannelMessagesUseCase>(
      () => _i49.GetChannelMessageUseCaseImpl(get<_i42.ChannelRepository>(),
          get<_i46.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factory<_i50.GetCurrentUserUseCase>(
      () => _i51.GetCurrentUserUseCaseImpl(
          get<_i3.AuthRepository>(), get<_i38.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i52.GetServerByIdUseCase>(
      () => _i53.GetServerByIdUseCaseImpl(get<_i30.ServerRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i54.GetUserByIdUseCase>(
      () => _i55.GetUserByIdUseCaseImpl(get<_i38.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i56.JoinServerUseCase>(
      () => _i57.JoinServerUseCaseImpl(
          get<_i50.GetCurrentUserUseCase>(),
          get<_i38.UserRepository>(),
          get<_i30.ServerRepository>(),
          get<_i42.ChannelRepository>(),
          get<_i34.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i58.LeaveServerUseCase>(
      () => _i59.LeaveServerUseCaseImpl(
          get<_i50.GetCurrentUserUseCase>(),
          get<_i30.ServerRepository>(),
          get<_i42.ChannelRepository>(),
          get<_i38.UserRepository>(),
          get<_i34.UserGroupRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i60.ObserveUserChangesUseCase>(
      () => _i61.ObserveUserChangesUseCaseImpl(get<_i38.UserRepository>()),
      registerFor: {_prod, _dev});
  gh.factory<_i62.SendChannelMessageUseCase>(
      () => _i63.SendChannelMessageUseCaseImpl(get<_i42.ChannelRepository>(),
          get<_i46.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factory<_i64.ServerBloc>(() => _i64.ServerBloc(
      get<_i52.GetServerByIdUseCase>(),
      get<_i56.JoinServerUseCase>(),
      get<_i58.LeaveServerUseCase>()));
  gh.factory<_i65.SubscribeChannelMessageUseCase>(
      () => _i66.SubscribeChannelMessageUseCaseImpl(
          get<_i42.ChannelRepository>(),
          get<_i46.GetChannelMemberByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i67.UserBloc, _i68.Stream<_i8.AuthState>, dynamic>(
      (authStateStream, _) => _i67.UserBloc(
          authStateStream,
          get<_i50.GetCurrentUserUseCase>(),
          get<_i60.ObserveUserChangesUseCase>()));
  gh.factoryParam<_i69.ChannelBloc, _i64.ServerBloc, _i70.DirectMessageBloc>(
      (_serverBloc, _dmBloc) => _i69.ChannelBloc(
          _serverBloc, _dmBloc, get<_i44.GetChannelByIdUseCase>()));
  gh.factoryParam<_i70.DirectMessageBloc, _i68.Stream<_i67.UserState>, dynamic>(
      (userStateStream, _) => _i70.DirectMessageBloc(
          userStateStream, get<_i50.GetCurrentUserUseCase>()));
  gh.factory<_i71.GetAllChannelMemberUseCase>(
      () => _i72.GetAllChannelMemberUseCaseImpl(
          get<_i34.UserGroupRepository>(), get<_i44.GetChannelByIdUseCase>()),
      registerFor: {_prod, _dev});
  gh.factoryParam<_i73.MessageBloc, _i21.Channel,
          _i68.Stream<_i69.ChannelState>>(
      (channel, channelStateStream) => _i73.MessageBloc(
          channel,
          channelStateStream,
          get<_i50.GetCurrentUserUseCase>(),
          get<_i65.SubscribeChannelMessageUseCase>(),
          get<_i48.GetChannelMessagesUseCase>(),
          get<_i46.GetChannelMemberByIdUseCase>(),
          get<_i62.SendChannelMessageUseCase>()));
  return get;
}

class _$ApiModule extends _i74.ApiModule {}