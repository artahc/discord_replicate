import 'dart:async';

import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/application/extensions/extensions.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'empty_landing_panel.dart';
import 'landing_panel.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of(context);
    final UserBloc userBloc = sl.get(param1: authBloc.stream.withInitialValue(authBloc.state));
    final ServerBloc serverBloc = sl.get();
    final DirectMessageBloc dmBloc = sl.get(param1: userBloc.stream.withInitialValue(userBloc.state));
    final ChannelBloc channelBloc = sl.get(param1: serverBloc, param2: dmBloc);

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
            state.whenOrNull(
              error: (e) async {
                log.e("Error state received from UserBloc", e);
                authBloc.add(AuthEvent.signOut());
              },
            );
          },
          builder: (_, state) {
            return state.maybeWhen(
              orElse: () {
                return Center(
                  child: Text("Loading user."),
                );
              },
              loaded: (user) {
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
