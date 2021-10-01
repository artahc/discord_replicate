import 'package:discord_replicate/domain/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/domain/bloc/direct_message/direct_message_state.dart';
import 'package:discord_replicate/presentation/route_transition/app_transition.dart';
import 'package:discord_replicate/presentation/view/home/direct_message_tile.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/view/home/search_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DirectMessageListPanel extends StatefulWidget {
  @override
  _DirectMessageListState createState() => _DirectMessageListState();
}

class _DirectMessageListState extends State<DirectMessageListPanel> {
  late DirectMessageBloc _directMessageBloc;

  @override
  void initState() {
    _directMessageBloc = BlocProvider.of<DirectMessageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(right: (MediaQuery.of(context).size.width * 0.125) + 5),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Direct Message",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  ImageIcon(
                    AssetImage(AppIcon.direct_message_icon),
                    size: 18,
                  ),
                ],
              ),
            ),
            Flexible(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(SlideUpTransition(nextPage: SearchPanel()));
                },
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
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
                      ImageIcon(AssetImage(AppIcon.search_icon)),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: BlocBuilder<DirectMessageBloc, DirectMessageState>(
                    bloc: _directMessageBloc,
                    builder: (context, state) {
                      return Column(
                        children: [
                          DirectMessageTile(
                            id: "randomId",
                            title: "Random User",
                            status: UserStatus("emoji", "Working on stuff~2qqqqqqq"),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
