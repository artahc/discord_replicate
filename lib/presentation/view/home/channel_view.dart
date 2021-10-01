import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/view/app_view.dart';
import 'package:discord_replicate/presentation/view/home/bottom_navigation_bar.dart';
import 'package:discord_replicate/presentation/view/home/channel_info_panel.dart';
import 'package:discord_replicate/presentation/view/home/channel_message_panel.dart';
import 'package:discord_replicate/presentation/view/home/friends_panel.dart';
import 'package:discord_replicate/presentation/widgets/overlap_swipeable_stack.dart';
import 'package:discord_replicate/presentation/widgets/overlap_swipeable_stack_controller.dart';
import 'package:discord_replicate/presentation/view/home/direct_message_panel.dart';
import 'package:discord_replicate/presentation/view/home/server_list_panel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class LocalChannelRoutes {
  static const main = "/";
  static const friends = "/friends";
  static const profile = "/profile";
}

class ChannelView extends StatefulWidget {
  const ChannelView({Key? key}) : super(key: key);

  @override
  ChannelViewState createState() => ChannelViewState();
}

class ChannelViewState extends State<ChannelView> with TickerProviderStateMixin {
  final _localNavKey = GlobalKey<NavigatorState>();
  String _currentRoute = LocalChannelRoutes.main;
  late OverlapSwipeableStackController channelViewController = OverlapSwipeableStackController(vsync: this);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    channelViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: WillPopScope(
        onWillPop: () {
          dev.log("LocalNavigation can pop: ${_localNavKey.currentState?.canPop().toString()}", name: this.runtimeType.toString());
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
                initialRoute: LocalChannelRoutes.main,
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case LocalChannelRoutes.main:
                      return PageRouteBuilder(
                        maintainState: true,
                        pageBuilder: (_, anim, secondAnim) {
                          return OverlapSwipeableStack(
                            channelViewController: channelViewController,
                            frontPage: ChannelMessagePanel(),
                            leftPage: Row(
                              children: [
                                ServerListPanel(),
                                DirectMessageListPanel(),
                              ],
                            ),
                            rightPage: ChannelInfoPanel(),
                          );
                        },
                      );
                    case LocalChannelRoutes.friends:
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
                    case LocalChannelRoutes.profile:
                      return MaterialPageRoute(
                        maintainState: true,
                        fullscreenDialog: true,
                        builder: (_) => Container(color: Colors.green),
                      );
                  }
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SlideTransition(
                  child: HomeNavigationBar(
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            if (_currentRoute != LocalChannelRoutes.main) {
                              _localNavKey.currentState?.popUntil((route) => route.isFirst);
                              setState(() {
                                _currentRoute = LocalChannelRoutes.main;
                              });
                            }
                          },
                          iconSize: 24,
                          visualDensity: VisualDensity.compact,
                          icon: ImageIcon(AssetImage(AppIcon.discord_icon)),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            if (_currentRoute != LocalChannelRoutes.friends) {
                              _localNavKey.currentState?.pushNamed(LocalChannelRoutes.friends);
                              setState(() {
                                _currentRoute = LocalChannelRoutes.friends;
                              });
                            }
                          },
                          iconSize: 19,
                          visualDensity: VisualDensity.compact,
                          icon: ImageIcon(AssetImage(AppIcon.friend_icon)),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 18,
                          visualDensity: VisualDensity.compact,
                          icon: ImageIcon(AssetImage(AppIcon.search_icon)),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          iconSize: 21,
                          visualDensity: VisualDensity.compact,
                          icon: ImageIcon(AssetImage(AppIcon.mention_icon)),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            if (_currentRoute != LocalChannelRoutes.profile) {
                              _localNavKey.currentState?.pushNamed(LocalChannelRoutes.profile);
                              setState(() {
                                _currentRoute = LocalChannelRoutes.profile;
                              });
                            }
                          },
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
                  position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(channelViewController.navBarAnimController),
                  // TODO: Extract this navbar controller, so that page controller only control stacked swipeable panel
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
