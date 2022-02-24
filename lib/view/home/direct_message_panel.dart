import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/model/channel/channel.dart';
import 'package:discord_replicate/view/home/direct_message_tile.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/view/home/search_panel.dart';
import 'package:discord_replicate/widgets/route_transition/app_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DirectMessageListPanel extends StatefulWidget {
  final List<Channel> channels;

  const DirectMessageListPanel({Key? key, this.channels = const <Channel>[]}) : super(key: key);

  @override
  _DirectMessageListState createState() => _DirectMessageListState();
}

class _DirectMessageListState extends State<DirectMessageListPanel> {
  late NavigationCubit _navBloc = BlocProvider.of<NavigationCubit>(context);
  late ChannelBloc _channelBloc = BlocProvider.of<ChannelBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (_, state) {
      return state.maybeWhen(
        orElse: () {
          return Container();
        },
        loaded: (user) {
          return Flexible(
            child: Container(
              margin: EdgeInsets.only(right: (MediaQuery.of(context).size.width * 0.125) + 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 20, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Direct Message",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        ImageIcon(
                          AssetImage(AppIcons.direct_message_icon),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      var route = SlideUpTransition(nextPage: SearchPanel(), fullscreenDialog: true);
                      _navBloc.push(context, route, true);
                    },
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Find or start a conversation",
                            style: Theme.of(context).textTheme.caption?.copyWith(
                                  color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
                                ),
                          ),
                          ImageIcon(AssetImage(AppIcons.search_icon)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 60),
                      child: ScrollConfiguration(
                        behavior: ClampingScrollBehavior(),
                        child: ListView.builder(
                          clipBehavior: Clip.antiAlias,
                          itemCount: user.privateChannels.length,
                          itemBuilder: (_, index) {
                            return DirectMessageTile(
                              channel: user.privateChannels[index],
                              onPressed: () {
                                _channelBloc.add(ChannelEvent.load(user.privateChannels[index].id));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

class ClampingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => ClampingScrollPhysics();

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
