import 'dart:developer';

import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/view/home/channel_list_panel.dart';
import 'package:discord_replicate/view/home/direct_message_panel.dart';
import 'package:discord_replicate/view/home/navigation_bar.dart';
import 'package:discord_replicate/view/home/channel_info_panel.dart';
import 'package:discord_replicate/view/home/message_panel.dart';
import 'package:discord_replicate/widgets/overlap_swipeable_stack.dart';
import 'package:discord_replicate/view/home/server_list_panel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  LandingViewState createState() => LandingViewState();
}

class LandingViewState extends State<LandingView> with TickerProviderStateMixin {
  late OverlapSwipeableStackController _pageController = OverlapSwipeableStackController(vsync: this);
  final Logger log = Logger();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listener: (_, state) {
          state.whenOrNull(
            error: (e) {
              log.e("There's something wrong with internal state.", e);
            },
          );
        },
        builder: (_, state) {
          return state.maybeWhen(
            orElse: () {
              return Center(
                child: Text("There's something wrong with internal state."),
              );
            },
            error: (e) {
              return Center(
                child: Text("Error when loading user."),
              );
            },
            loading: () {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            },
            loaded: (user) {
              var serverBloc = GetIt.I.get<ServerBloc>();
              var dmBloc = GetIt.I.get<DirectMessageBloc>(param1: userBloc);
              var channelBloc = GetIt.I.get<ChannelBloc>(param1: serverBloc, param2: dmBloc);

              return MultiBlocProvider(
                providers: [
                  BlocProvider<ServerBloc>(create: (_) => serverBloc),
                  BlocProvider<ChannelBloc>(create: (_) => channelBloc),
                  BlocProvider<DirectMessageBloc>(create: (_) => dmBloc),
                ],
                child: SafeArea(
                  child: Stack(
                    children: [
                      OverlapSwipeableStack(
                        channelViewController: _pageController,
                        leftPage: Row(
                          children: [
                            // Server list
                            ServerListPanel(servers: user.servers),

                            // Direct Message Panel or Channel List Panel
                            StreamBuilder(
                              stream: MergeStream([
                                serverBloc.eventStream.whereType<ServerEventLoadServer>(),
                                dmBloc.eventStream.whereType<DirectMessageLoadRecent>(),
                              ]),
                              builder: (_, snapshot) {
                                if (snapshot.data is ServerEvent) {
                                  return BlocBuilder<ServerBloc, ServerState>(
                                    builder: (_, serverState) {
                                      return serverState.when(
                                        error: (e) {
                                          return Center(
                                            child: Text("Something's wrong when retrieving server data."),
                                          );
                                        },
                                        loading: () {
                                          return Center(
                                            child: Container(
                                              child: CircularProgressIndicator(color: Colors.white),
                                            ),
                                          );
                                        },
                                        loaded: (server, recentChannel) {
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
                            return state.when(
                              loading: () {
                                return Center(
                                  child: Text("Loading message panel."),
                                );
                              },
                              loaded: (channel) {
                                return MessagePanel(
                                  key: UniqueKey(),
                                  pageController: _pageController,
                                  channel: channel,
                                );
                              },
                              error: (e) {
                                return Container(
                                  child: Center(
                                    child: Text("Something's wrong when retrieving channel data."),
                                  ),
                                );
                              },
                            );
                          },
                        ),

                        // Room Info Panel
                        rightPage: BlocBuilder<ChannelBloc, ChannelState>(
                          builder: (_, state) {
                            return state.when(
                              loading: () {
                                return Center(
                                  child: Container(
                                    child: CircularProgressIndicator(color: Colors.white),
                                  ),
                                );
                              },
                              loaded: (channel) {
                                return ChannelInfoPanel(channel: channel);
                              },
                              error: (e) {
                                return Container(
                                  child: Center(
                                    child: Text("Something's wrong when retrieving channel data."),
                                  ),
                                );
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
                          position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(_pageController.navBarAnimController),
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
