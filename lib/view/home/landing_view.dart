import 'dart:developer';

import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/view/home/channel_list_panel.dart';
import 'package:discord_replicate/view/home/direct_message_panel.dart';
import 'package:discord_replicate/view/home/navigation_bar.dart';
import 'package:discord_replicate/view/home/channel_info_panel.dart';
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
  late ChannelBloc _channelBloc;

  OverlapSwipeableStackController get controller => _roomViewController;

  @override
  void initState() {
    _serverBloc = BlocProvider.of<ServerBloc>(context);
    _channelBloc = BlocProvider.of<ChannelBloc>(context);
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Haha cannot exit app."),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  return Future.value(false);
                },
                child: SafeArea(
                  child: Stack(
                    children: [
                      OverlapSwipeableStack(
                        channelViewController: _roomViewController,

                        // Server List, Direct Message Panel, and Channel List Panel.
                        leftPage: Row(
                          children: [
                            ServerListPanel(servers: user.servers),
                            StreamBuilder(
                              stream: MergeStream(
                                  [_serverBloc.eventStream, _channelBloc.eventStream.where((event) => event is ChannelEventLoadRecentPrivate)]),
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
                                  return DirectMessageListPanel(channels: user.privateChannels);
                                }
                              },
                            ),
                          ],
                        ),

                        // Message Panel
                        frontPage: BlocBuilder<ChannelBloc, ChannelState>(
                          builder: (_, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return ClipRRect(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                  child: Container(
                                    color: Theme.of(context).colorScheme.primary,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              loadSuccess: (channel) {
                                return ChannelMessagePanel(key: UniqueKey(), channel: channel, pageController: controller);
                              },
                            );
                          },
                        ),

                        // Room or Channel Info Panel
                        rightPage: BlocBuilder<ChannelBloc, ChannelState>(
                          builder: (_, state) {
                            return state.maybeWhen(
                              orElse: () {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              },
                              loadSuccess: (channel) {
                                return ChannelInfoPanel(channel: channel);
                              },
                            );
                          },
                        ),
                      ),

                      // Navigation Bar
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
