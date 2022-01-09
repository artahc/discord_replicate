import 'package:discord_replicate/bloc/room/room_bloc.dart';
import 'package:discord_replicate/bloc/room/room_state.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/view/home/message_tile.dart';
import 'package:discord_replicate/view/home/landing_view.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomMessagePanel extends StatefulWidget {
  final Channel room;

  const RoomMessagePanel({Key? key, required this.room}) : super(key: key);

  @override
  _RoomMessagePanelState createState() => _RoomMessagePanelState();
}

class _RoomMessagePanelState extends State<RoomMessagePanel> {
  @override
  Widget build(BuildContext context) {
    var pageController = context.findAncestorStateOfType<LandingViewState>()?.controller;

    return Container(
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: Container(
          child: Column(
            children: [
              // Header
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                padding: EdgeInsets.only(right: 15, left: 10),
                height: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {
                          if (pageController?.currentPageState == PageState.OnCenter)
                            pageController?.animateTo(PageState.OnRight);
                          else
                            pageController?.animateTo(PageState.OnCenter);
                        },
                        iconSize: 18,
                        icon: ImageIcon(
                          AssetImage(AppIcons.menu_icon),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Text(
                              widget.room.name,
                              style: Theme.of(context).textTheme.headline6?.copyWith(overflow: TextOverflow.clip),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        IconButton(
                          iconSize: 18,
                          visualDensity: VisualDensity.compact,
                          onPressed: () {},
                          icon: ImageIcon(
                            AssetImage(AppIcons.phone_icon),
                          ),
                        ),
                        IconButton(
                          iconSize: 18,
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          icon: ImageIcon(
                            AssetImage(AppIcons.video_icon),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (pageController?.currentPageState == PageState.OnCenter)
                              pageController?.animateTo(PageState.OnLeft);
                            else
                              pageController?.animateTo(PageState.OnCenter);
                          },
                          visualDensity: VisualDensity.compact,
                          iconSize: 20,
                          icon: ImageIcon(
                            AssetImage(AppIcons.group_icon),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Body
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: ListView.builder(
                    itemCount: widget.room.messages.length,
                    itemBuilder: (_, index) {
                      return MessageTile(message: widget.room.messages[index]);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),

              // Input
              Container(
                height: 60,
                color: Theme.of(context).colorScheme.secondary,
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Wrap(
                      spacing: 5,
                      children: [
                        ClipOval(
                          child: Container(
                            color: Theme.of(context).backgroundColor,
                            child: IconButton(
                              onPressed: () {},
                              visualDensity: VisualDensity.compact,
                              iconSize: 20,
                              icon: ImageIcon(
                                AssetImage(AppIcons.picture_icon),
                              ),
                            ),
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color: Theme.of(context).backgroundColor,
                            child: IconButton(
                              onPressed: () {},
                              visualDensity: VisualDensity.compact,
                              iconSize: 20,
                              icon: ImageIcon(
                                AssetImage(AppIcons.gift_icon),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Align(
                        child: AppInputField(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                          margin: const EdgeInsets.only(right: 5, left: 5),
                          height: 40,
                          backgroundColor: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(50),
                          hintText: "Message #channel",
                          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                                color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
                                height: 1.2,
                              ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: ImageIcon(
                              AssetImage(AppIcons.emoji_icon),
                              size: 20,
                              color: IconTheme.of(context).color,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
