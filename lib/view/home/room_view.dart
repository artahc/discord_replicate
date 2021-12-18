import 'dart:developer';

import 'package:discord_replicate/bloc/navigation/navigation_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_event.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/route_transition/app_transition.dart';
import 'package:discord_replicate/view/home/room_info_panel.dart';
import 'package:discord_replicate/view/home/room_message_panel.dart';
import 'package:discord_replicate/view/home/friends_panel.dart';
import 'package:discord_replicate/view/home/search_panel.dart';
import 'package:discord_replicate/view/home/user_setting_panel.dart';
import 'package:discord_replicate/widgets/overlap_swipeable_stack.dart';
import 'package:discord_replicate/view/home/direct_message_panel.dart';
import 'package:discord_replicate/view/home/server_list_panel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LocalRoutes {
  static const main = "/";
  static const friends = "friends";
  static const search = "search";
  static const mentions = "mentions";
  static const profile = "profile";
}

class RoomView extends StatefulWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  RoomViewState createState() => RoomViewState();
}

class RoomViewState extends State<RoomView> with TickerProviderStateMixin {
  // private
  String _currentRoute = LocalRoutes.main;
  final _localNavKey = GlobalKey<NavigatorState>();

  late OverlapSwipeableStackController _channelViewController = OverlapSwipeableStackController(vsync: this);

  late NavigationBloc _navBloc = BlocProvider.of<NavigationBloc>(context);
  late ServerBloc _serverBloc = BlocProvider.of<ServerBloc>(context);

  // public
  OverlapSwipeableStackController get controller => _channelViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _channelViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: WillPopScope(
        onWillPop: () {
          if (_localNavKey.currentState?.canPop() == true) {
            _localNavKey.currentState?.popUntil((route) => route.isFirst);
            return Future.value(false);
          }
          return Future.value(true);
        },
        child: SafeArea(
          child: Stack(
            children: [
              Navigator(
                key: _localNavKey,
                initialRoute: LocalRoutes.main,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case LocalRoutes.main:
                      return PageRouteBuilder(
                        maintainState: true,
                        pageBuilder: (_, anim, secondAnim) {
                          return OverlapSwipeableStack(
                            channelViewController: _channelViewController,
                            frontPage: RoomMessagePanel(),
                            leftPage: Row(
                              children: [
                                ServerListPanel(),
                                DirectMessageListPanel(),
                              ],
                            ),
                            rightPage: RoomInfoPanel(),
                          );
                        },
                      );
                    case LocalRoutes.search:
                      return MaterialPageRoute(builder: (_) => SearchPanel(), fullscreenDialog: true);
                    case LocalRoutes.friends:
                      return PageRouteBuilder(
                        maintainState: true,
                        fullscreenDialog: true,
                        transitionDuration: Duration(milliseconds: 400),
                        transitionsBuilder: (_, anim, __, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0, 1),
                              end: Offset(0, 0),
                            ).chain(CurveTween(curve: Curves.easeInOutCubic)).animate(anim),
                            child: child,
                          );
                        },
                        pageBuilder: (_, __, ___) => FriendsPanel(),
                      );
                    case LocalRoutes.profile:
                      return MaterialPageRoute(
                        maintainState: true,
                        fullscreenDialog: true,
                        builder: (_) => UserSettingPanel(),
                      );
                  }
                },
              ),
              AppNavigationBar(
                controller: _channelViewController.navBarAnimController,
                onHomePressed: () {
                  if (_currentRoute != LocalRoutes.main) {
                    _localNavKey.currentState?.popUntil((route) => route.isFirst);
                    setState(() {
                      _currentRoute = LocalRoutes.main;
                    });
                  }
                },
                onFriendPressed: () {
                  if (_currentRoute != LocalRoutes.friends) {
                    _localNavKey.currentState?.pushNamed(LocalRoutes.friends);
                    setState(() {
                      _currentRoute = LocalRoutes.friends;
                    });
                  }
                },
                onSearchPressed: () {
                  _navBloc.add(NavigationEvent.push(context, SlideUpTransition(nextPage: SearchPanel()), true));
                },
                onMentionPressed: () {},
                onProfilePressed: () {
                  if (_currentRoute != LocalRoutes.profile) {
                    _localNavKey.currentState?.pushNamed(LocalRoutes.profile);
                    setState(() {
                      _currentRoute = LocalRoutes.profile;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppNavigationBar extends StatelessWidget {
  final AnimationController controller;
  final Function() onHomePressed;
  final Function() onFriendPressed;
  final Function() onSearchPressed;
  final Function() onMentionPressed;
  final Function() onProfilePressed;

  AppNavigationBar({
    Key? key,
    required this.controller,
    required this.onHomePressed,
    required this.onFriendPressed,
    required this.onSearchPressed,
    required this.onMentionPressed,
    required this.onProfilePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SlideTransition(
        child: Container(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: onHomePressed,
                  iconSize: 24,
                  visualDensity: VisualDensity.compact,
                  icon: ImageIcon(AssetImage(AppIcons.discord_icon)),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: onFriendPressed,
                  iconSize: 19,
                  visualDensity: VisualDensity.compact,
                  icon: ImageIcon(AssetImage(AppIcons.friend_icon)),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: onSearchPressed,
                  iconSize: 18,
                  visualDensity: VisualDensity.compact,
                  icon: ImageIcon(AssetImage(AppIcons.search_icon)),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: onMentionPressed,
                  iconSize: 21,
                  visualDensity: VisualDensity.compact,
                  icon: ImageIcon(AssetImage(AppIcons.mention_icon)),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onProfilePressed,
                  child: Center(
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(controller),
      ),
    );
  }
}
