import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/view/home/empty_landing_panel.dart';
import 'package:discord_replicate/view/home/landing_panel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final Logger log = Logger();

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  late var userBloc = GetIt.I.get<UserBloc>(param1: BlocProvider.of<AuthBloc>(context));
  late var serverBloc = GetIt.I.get<ServerBloc>();
  late var dmBloc = GetIt.I.get<DirectMessageBloc>(param1: userBloc);
  late var channelBloc = GetIt.I.get<ChannelBloc>(param1: serverBloc, param2: dmBloc);

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
