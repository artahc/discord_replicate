import 'package:discord_replicate/domain/model/user.dart';
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'channel_info_panel.dart';
import 'channel_list_panel.dart';
import 'direct_message_panel.dart';
import 'message_panel.dart';
import 'navigation_bar.dart';
import 'server_list_panel.dart';

class LandingPanel extends StatefulWidget {
  final User user;

  const LandingPanel({Key? key, required this.user}) : super(key: key);

  @override
  State<LandingPanel> createState() => _LandingPanelState();
}

class _LandingPanelState extends State<LandingPanel> with TickerProviderStateMixin {
  late OverlapSwipeableStackController _pageController = OverlapSwipeableStackController(vsync: this);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var serverBloc = BlocProvider.of<ServerBloc>(context);
    var dmBloc = BlocProvider.of<DirectMessageBloc>(context);

    return SafeArea(
      child: Stack(
        children: [
          OverlapSwipeableStack(
            channelViewController: _pageController,
            leftPage: Row(
              children: [
                ServerListPanel(),
                StreamBuilder(
                  stream: MergeStream([
                    serverBloc.eventStream.whereType<ServerEventLoadServer>(),
                    dmBloc.eventStream.whereType<DirectMessageLoadRecent>(),
                  ]),
                  builder: (_, snapshot) {
                    if (snapshot.data is ServerEvent) {
                      return BlocBuilder<ServerBloc, ServerState>(
                        builder: (_, serverState) {
                          return serverState.maybeWhen(
                            orElse: () {
                              return Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(right: (MediaQuery.of(context).size.width * 0.125) + 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              );
                            },
                            loaded: (server, recentChannel) {
                              return ServerChannelListPanel();
                            },
                          );
                        },
                      );
                    } else {
                      return DirectMessageListPanel();
                    }
                  },
                ),
              ],
            ),
            frontPage: BlocBuilder<ChannelBloc, ChannelState>(
              builder: (_, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  },
                  loaded: (channel) {
                    return MessagePanel(
                      key: UniqueKey(),
                      channel: channel,
                      pageController: _pageController,
                    );
                  },
                  error: (e, st) {
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
                  error: (e, st) {
                    return Container(
                      child: Center(
                        child: Text("Something's wrong when retrieving channel data."),
                      ),
                    );
                  },
                  empty: () {
                    return Container(
                      child: Center(
                        child: Text("Channel empty."),
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
              position:
                  Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(_pageController.navBarAnimController),
            ),
          ),
        ],
      ),
    );
  }
}
