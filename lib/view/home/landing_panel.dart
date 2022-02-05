import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/model/user/user.dart';
import 'package:discord_replicate/view/home/channel_info_panel.dart';
import 'package:discord_replicate/view/home/channel_list_panel.dart';
import 'package:discord_replicate/view/home/direct_message_panel.dart';
import 'package:discord_replicate/view/home/message_panel.dart';
import 'package:discord_replicate/view/home/navigation_bar.dart';
import 'package:discord_replicate/view/home/server_list_panel.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

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
                // Server list
                ServerListPanel(key: UniqueKey(), servers: widget.user.servers),

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
                              return ChannelListPanel(key: UniqueKey(), server: server);
                            },
                          );
                        },
                      );
                    } else {
                      return DirectMessageListPanel(key: UniqueKey(), channels: widget.user.privateChannels);
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
                      channel: channel,
                      pageController: _pageController,
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
    );
  }
}
