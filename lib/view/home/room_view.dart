import 'dart:developer';

import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/room/room_bloc.dart';
import 'package:discord_replicate/bloc/room/room_event.dart';
import 'package:discord_replicate/bloc/room/room_state.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/route_transition/app_transition.dart';
import 'package:discord_replicate/view/home/channel_list_panel.dart';
import 'package:discord_replicate/view/home/direct_message_panel.dart';
import 'package:discord_replicate/view/home/navigation_bar.dart';
import 'package:discord_replicate/view/home/room_info_panel.dart';
import 'package:discord_replicate/view/home/message_panel.dart';
import 'package:discord_replicate/view/home/friends_panel.dart';
import 'package:discord_replicate/view/home/search_panel.dart';
import 'package:discord_replicate/view/home/user_setting_panel.dart';
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

  late UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
  late ServerBloc _serverBloc = BlocProvider.of<ServerBloc>(context);
  late RoomBloc _roomBloc = BlocProvider.of<RoomBloc>(context);
  late NavigationCubit _navBloc = BlocProvider.of<NavigationCubit>(context);

  Server? _currentServer;

  OverlapSwipeableStackController get controller => _roomViewController;

  @override
  void initState() {
    _userBloc.add(UserEvent.loadLocalUser());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _roomViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // BlocListener<UserBloc, UserState>(
        //   bloc: _userBloc,
        //   listener: (_, state) {
        //     state.whenOrNull(
        //       loadLocalUserSuccess: (user, recentServer, recentRoom) {
        //         setState(() {
        //           _currentServer = recentServer;
        //         });
        //       },
        //       loadRecentPrivateRoomSuccess: (rooms, recentRoom) {
        //         setState(() {
        //           _currentServer = null;
        //         });
        //       },
        //     );
        //   },
        // ),
        BlocListener<ServerBloc, ServerState>(
          bloc: _serverBloc,
          listener: (_, state) {
            state.whenOrNull(
              loadServerSuccess: (server, recentChannel) {
                setState(() {
                  _currentServer = server;
                });
              },
            );
          },
        )
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).backgroundColor,
        body: WillPopScope(
          onWillPop: () async {
            return Future.value(true);
            // if (_localNavKey.currentState?.canPop() == true) {
            //   _localNavKey.currentState?.popUntil((route) => route.isFirst);
            //   return Future.value(false);
            // }
            // return Future.value(true);
          },
          child: SafeArea(
            child: Stack(
              children: [
                OverlapSwipeableStack(
                  channelViewController: _roomViewController,
                  frontPage: RoomMessagePanel(),
                  leftPage: Row(
                    children: [
                      ServerListPanel(),
                      Visibility(
                        visible: _currentServer != null,
                        child: ChannelListPanel(),
                      ),
                      Visibility(
                        visible: _currentServer == null,
                        child: DirectMessageListPanel(),
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
        ),
      ),
    );
  }
}
