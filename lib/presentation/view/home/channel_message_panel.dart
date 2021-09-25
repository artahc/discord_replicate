import 'package:discord_ui_practice/data/model/message_data.dart';
import 'package:discord_ui_practice/external/app_icon.dart';
import 'package:discord_ui_practice/presentation/view/home/channel_message_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelMessagePanel extends StatefulWidget {
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
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
              iconSize: 18,
              icon: ImageIcon(
                AssetImage(AppIcon.menu_icon),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    "# Direct Message",
                    style: Theme.of(context).textTheme.headline6,
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
            return MessageItem(MessageData.createDummy());
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
                  color: Theme.of(context).colorScheme.primary,
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
                  color: Theme.of(context).colorScheme.primary,
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
          Expanded(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 40),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: 100,
                margin: EdgeInsets.only(left: 5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  // color: Color(0xff303136),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0,
                            horizontal: 15,
                          ),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: "Message #general",
                          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: MaterialButton(
                        minWidth: 40,
                        height: 40,
                        splashColor: Colors.transparent,
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        child: ImageIcon(
                          AssetImage(AppIcon.emoji_icon),
                          color: IconTheme.of(context).color,
                          size: 20,
                        ),
                        onPressed: () {
                          print("emoji pressed");
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
