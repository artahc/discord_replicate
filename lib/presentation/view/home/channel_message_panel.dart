import 'package:discord_replicate/data/model/message_data.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/view/app_view.dart';
import 'package:discord_replicate/presentation/view/home/channel_message_tile.dart';
import 'package:discord_replicate/presentation/widgets/overlap_swipeable_stack_controller.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelMessagePanel extends StatefulWidget {
  const ChannelMessagePanel({Key? key}) : super(key: key);

  @override
  _ChannelMessagePanelState createState() => _ChannelMessagePanelState();
}

class _ChannelMessagePanelState extends State<ChannelMessagePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: Container(
          child: Column(
            children: [
              _ChatHeader(),
              _ChatBody(),
              _ChatInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatHeader extends StatelessWidget {
  const _ChatHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = context.findAncestorStateOfType<ChannelViewState>()?.channelViewController;

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
                  controller?.setState(PageState.OnRight);
                else
                  controller?.setState(PageState.OnCenter);
              },
              iconSize: 18,
              icon: ImageIcon(
                AssetImage(AppIcon.menu_icon),
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
                  AssetImage(AppIcon.phone_icon),
                ),
              ),
              IconButton(
                iconSize: 18,
                onPressed: () {
                  print("Video camera pressed");
                },
                visualDensity: VisualDensity.compact,
                icon: ImageIcon(
                  AssetImage(AppIcon.video_icon),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller?.currentPageState == PageState.OnCenter)
                    controller?.setState(PageState.OnLeft);
                  else
                    controller?.setState(PageState.OnCenter);
                  print("Channel Info pressed");
                },
                visualDensity: VisualDensity.compact,
                iconSize: 20,
                icon: ImageIcon(
                  AssetImage(AppIcon.group_icon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return MessageTile(MessageData.createDummy());
          },
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}

class _ChatInput extends StatelessWidget {
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
                      AssetImage(AppIcon.picture_icon),
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
                      AssetImage(AppIcon.gift_icon),
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
                    AssetImage(AppIcon.emoji_icon),
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
