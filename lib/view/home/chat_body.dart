import 'package:discord_ui_practice/view/home/chat_item.dart';
import 'package:flutter/widgets.dart';

class ChatBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
  }
}