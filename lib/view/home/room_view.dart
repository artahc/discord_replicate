import 'dart:developer';

import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/room/room_bloc.dart';
import 'package:discord_replicate/bloc/room/room_event.dart';
import 'package:discord_replicate/bloc/room/room_state.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
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

class RoomView extends StatefulWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  RoomViewState createState() => RoomViewState();
}

class RoomViewState extends State<RoomView> with TickerProviderStateMixin {
  late OverlapSwipeableStackController _roomViewController = OverlapSwipeableStackController(vsync: this);

  OverlapSwipeableStackController get controller => _roomViewController;

  @override
  void initState() {
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
              var servers = user.servers;
              var privateRooms = user.privateRooms;
              var recentRoom = user.privateRooms.first;
              var recentServer = user.servers.first;
              var showServer = false;

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
                            ServerListPanel(servers: servers),
                            Visibility(
                              visible: showServer,
                              child: ChannelListPanel(server: recentServer),
                            ),
                            Visibility(
                              visible: !showServer,
                              child: DirectMessageListPanel(privateRooms: privateRooms),
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
