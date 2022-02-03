import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/view/home/empty_landing_panel.dart';
import 'package:discord_replicate/view/home/landing_panel.dart';
import 'package:discord_replicate/widgets/overlap_swipeable_stack.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final Logger log = Logger();

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          state.whenOrNull(
            unauthenticated: () {
              log.e("User is not authenticated. Redirect back to login page");
            },
            error: (e) {
              log.e("There's something wrong with internal state.", e);
            },
          );
        },
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () {
              log.e(state);
              return Center(
                child: Text("Wrong internal state."),
              );
            },
            authenticating: () {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            },
            authenticated: (user) {
              var serverBloc = GetIt.I.get<ServerBloc>();
              var dmBloc = GetIt.I.get<DirectMessageBloc>(param1: BlocProvider.of<UserBloc>(context));
              var channelBloc = GetIt.I.get<ChannelBloc>(param1: serverBloc, param2: dmBloc);

              return MultiBlocProvider(
                providers: [
                  BlocProvider<ServerBloc>(create: (_) => serverBloc),
                  BlocProvider<ChannelBloc>(create: (_) => channelBloc),
                  BlocProvider<DirectMessageBloc>(create: (_) => dmBloc),
                ],
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (_, state) {},
                  builder: (_, state) {
                    return state.maybeWhen(
                      orElse: () {
                        log.w(state);
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
                        log.d("User loaded, $user");
                        if (user.privateChannels.isEmpty && user.servers.isEmpty) {
                          return EmptyLandingPanel();
                        } else {
                          return LandingPanel(user: user);
                        }
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
