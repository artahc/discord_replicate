import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/view/home/message_tile.dart';
import 'package:discord_replicate/view/home/room_view.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class RoomMessagePanel extends StatefulWidget {
  const RoomMessagePanel({Key? key}) : super(key: key);

  @override
  _RoomMessagePanelState createState() => _RoomMessagePanelState();
}

class _RoomMessagePanelState extends State<RoomMessagePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: Container(
          child: Column(
            children: [
              _RoomHeader(),
              _RoomBody(),
              _RoomInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoomHeader extends StatelessWidget {
  const _RoomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = context.findAncestorStateOfType<RoomViewState>()?.controller;

    return Container(
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
                if (controller?.currentPageState == PageState.OnCenter)
                  controller?.setPageState(PageState.OnRight);
                else
                  controller?.setPageState(PageState.OnCenter);
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
                    "# Direct Message",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          overflow: TextOverflow.clip,
                        ),
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
                onPressed: () {
                  print("Call pressed");
                },
                icon: ImageIcon(
                  AssetImage(AppIcons.phone_icon),
                ),
              ),
              IconButton(
                iconSize: 18,
                onPressed: () {
                  print("Video camera pressed");
                },
                visualDensity: VisualDensity.compact,
                icon: ImageIcon(
                  AssetImage(AppIcons.video_icon),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller?.currentPageState == PageState.OnCenter)
                    controller?.setPageState(PageState.OnLeft);
                  else
                    controller?.setPageState(PageState.OnCenter);
                  print("Channel Info pressed");
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
    );
  }
}

class _RoomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return MessageTile(TextMessage.dummy());
          },
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}

class _RoomInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onPressed: () {
                      print("Channel Info pressed");
                    },
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
                    onPressed: () {
                      print("Channel Info pressed");
                    },
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
    );
  }
}
