import 'dart:async';

import 'package:discord_replicate/common/app_config.dart';
import 'package:discord_replicate/common/app_logger.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'empty_landing_panel.dart';
import 'landing_panel.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  late UserBloc userBloc = sl.get(param1: BlocProvider.of<AuthBloc>(context).stream);
  late ServerBloc serverBloc = sl.get();
  late DirectMessageBloc dmBloc = sl.get(param1: userBloc);
  late ChannelBloc channelBloc = sl.get(param1: serverBloc, param2: dmBloc);
  late AuthBloc authBloc = sl.get();

  @override
  void initState() {
    userBloc.add(UserEvent.loadUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(create: (_) => userBloc),
          BlocProvider<ServerBloc>(create: (_) => serverBloc),
          BlocProvider<ChannelBloc>(create: (_) => channelBloc),
          BlocProvider<DirectMessageBloc>(create: (_) => dmBloc),
        ],
        child: BlocConsumer<UserBloc, UserState>(
          listener: (_, state) {
            log.w(state);
            state.whenOrNull(
              error: (e) async {
                log.e("Error state received from UserBloc", e);
                authBloc.add(AuthEvent.signOutEvent());
              },
            );
          },
          builder: (_, state) {
            print("Received user state $state");

            return state.maybeWhen(
              orElse: () {
                return Center(
                  child: Text("There is something wrong with user internal state."),
                );
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              },
              loaded: (user) {
                // return EmptyLandingPanel();
                if (user.privateChannels.isEmpty && user.servers.isEmpty) {
                  return EmptyLandingPanel();
                } else {
                  return LandingPanel(user: user);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
