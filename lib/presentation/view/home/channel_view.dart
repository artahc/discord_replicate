import 'package:discord_replicate/external/app_icon.dart';
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

class ChannelView extends StatefulWidget {
  const ChannelView({Key? key}) : super(key: key);

  @override
  ChannelViewState createState() => ChannelViewState();
}

class ChannelViewState extends State<ChannelView> with TickerProviderStateMixin {
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

  final key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: WillPopScope(
        onWillPop: () {
          dev.log("Will pop", name: this.runtimeType.toString());
          return Future.value(false);
        },
        child: SafeArea(
          child: Stack(
            children: [
              Navigator(
                key: key,
                initialRoute: "/",
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case "/":
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
                    case "/friends":
                      return MaterialPageRoute(
                        maintainState: true,
                        fullscreenDialog: true,
                        builder: (_) => FriendsPanel(),
                      );
                    case "/profile":
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
                            key.currentState?.popUntil((route) => route.isFirst);
                          },
                          iconSize: 24,
                          visualDensity: VisualDensity.compact,
                          icon: ImageIcon(AssetImage(AppIcon.discord_icon)),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            key.currentState?.pushNamed("/friends");
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
                            key.currentState?.pushNamed("/profile");
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
