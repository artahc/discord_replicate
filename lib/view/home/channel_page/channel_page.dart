import 'package:discord_ui_practice/view/home/channel_page/channel_chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  final Widget chatHeaderWidget = Container(
    decoration: BoxDecoration(
      color: Color(0xff303136),
    ),
    padding: EdgeInsets.all(10),
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Image(
              image: AssetImage("assets/menu-button.png"),
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
                  "@ hace",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5),
                  child: ClipOval(
                    child: Material(
                      color: Color(0xff47b380),
                      child: SizedBox(
                        width: 12,
                        height: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 24,
          children: [
            Image(
              width: 18,
              image: AssetImage("assets/phone-call.png"),
              color: Color(0xffb9bbbe),
            ),
            Image(
              width: 24,
              image: AssetImage("assets/video-camera.png"),
              color: Color(0xffb9bbbe),
            ),
            Image(
              width: 20,
              image: AssetImage("assets/group.png"),
              color: Color(0xffb9bbbe),
            ),
          ],
        ),
      ],
    ),
  );

  final Widget chatBodyWidget = Container(
    child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 12),
      scrollDirection: Axis.vertical,
      children: [
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
        ChatItem(),
      ],
    ),
  );

  final Widget chatInputWidget = Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(),
    child: Row(
      children: [
        Wrap(
          spacing: 5,
          children: [
            ClipOval(
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                color: Color(0xff303136),
                child: Image.asset(
                  "assets/insert-picture-icon.png",
                  width: 20,
                  color: Color(0xffb9bbbe),
                ),
              ),
            ),
            ClipOval(
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                color: Color(0xff303136),
                child: Image.asset(
                  "assets/giftbox.png",
                  width: 20,
                  color: Color(0xffb9bbbe),
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
                color: Color(0xff303136),
              ),
              child: Row(
                children: [
                  Flexible(
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
                          horizontal: 10,
                        ),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Message #general",
                        hintStyle: TextStyle(
                          color: Color(0xffb9bbbe),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Image.asset(
                      "assets/emoji.png",
                      height: 20,
                      color: Colors.white70,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: Color(0xff363940),
          child: Column(
            children: [
              chatHeaderWidget,
              Expanded(

                child: chatBodyWidget,
              ),
              chatInputWidget,
            ],
          ),
        ),
      ),
    );
  }
}
