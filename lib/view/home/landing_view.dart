import 'dart:developer';

import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/room/room_bloc.dart';
import 'package:discord_replicate/bloc/room/room_event.dart';
import 'package:discord_replicate/bloc/room/room_state.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/view/home/channel_list_panel.dart';
import 'package:discord_replicate/view/home/direct_message_panel.dart';
import 'package:discord_replicate/view/home/navigation_bar.dart';
import 'package:discord_replicate/view/home/room_info_panel.dart';
import 'package:discord_replicate/view/home/message_panel.dart';
import 'package:discord_replicate/widgets/overlap_swipeable_stack.dart';
import 'package:discord_replicate/view/home/server_list_panel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  LandingViewState createState() => LandingViewState();
}

class LandingViewState extends State<LandingView> with TickerProviderStateMixin {
  late OverlapSwipeableStackController _roomViewController = OverlapSwipeableStackController(vsync: this);

  late ServerBloc _serverBloc;
  late DirectMessageBloc _dmBloc;

  OverlapSwipeableStackController get controller => _roomViewController;

  @override
  void initState() {
    _serverBloc = BlocProvider.of<ServerBloc>(context);
    _dmBloc = BlocProvider.of<DirectMessageBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    _roomViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            },
            loadUserSuccess: (user) {
              return WillPopScope(
                onWillPop: () async {
                  return Future.value(true);
                },
                child: SafeArea(
                  child: Stack(
                    children: [
                      OverlapSwipeableStack(
                        channelViewController: _roomViewController,
                        frontPage: RoomMessagePanel(),
                        leftPage: Row(
                          children: [
                            ServerListPanel(servers: user.servers),
                            StreamBuilder(
                              initialData: DirectMessageEvent.load(user.privateRooms.first.id),
                              stream: MergeStream([_dmBloc.eventStream, _serverBloc.eventStream]),
                              builder: (_, snapshot) {
                                if (snapshot.data is ServerEvent) {
                                  return BlocBuilder<ServerBloc, ServerState>(
                                    builder: (_, serverState) {
                                      return serverState.maybeWhen(
                                        orElse: () {
                                          return Center(
                                            child: Container(
                                              child: CircularProgressIndicator(color: Colors.white),
                                            ),
                                          );
                                        },
                                        loadServerSuccess: (server, recentChannel) {
                                          return ChannelListPanel(server: server);
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  return DirectMessageListPanel(privateRooms: user.privateRooms);
                                }
                              },
                            ),
                          ],
                        ),
                        rightPage: RoomInfoPanel(),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SlideTransition(
                          child: AppNavigationBar(),
                          position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(_roomViewController.navBarAnimController),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
