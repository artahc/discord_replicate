import 'package:discord_ui_practice/view/home/side_menu_page/direct_message_item.dart';
import 'package:discord_ui_practice/view/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMenuPage extends StatelessWidget {
  final Widget serverWidget = IntrinsicWidth(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleContainer(
            50,
            50,
            color: Color(0xff36393f),
            child: Image.asset(
              "assets/direct-message.png",
              height: 22,
              color: Colors.white70,
            ),
          ),
          Divider(
            height: 20,
            color: Colors.white70,
            indent: 10,
            endIndent: 10,
          ),
          CircleContainer(
            50,
            50,
            color: Color(0xff36393f),
            child: Container(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    ),
  );

  final Widget directMessageWidget = Flexible(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xff36393f),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Direct Message",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                Image(
                    height: 18, image: AssetImage("assets/direct-message.png"))
              ],
            ),
          ),
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Color(0xff202225),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: TextField(
                    minLines: 1,
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 10,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Find or start a conversation",
                      hintStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/search.png",
                  height: 15,
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(height: 5);
                  },
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DirectMessageItem();
                  }),
            ),
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          serverWidget,
          directMessageWidget,
          SizedBox(
            width: 70,
          )
        ],
      ),
    );
  }
}
