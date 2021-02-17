import 'package:discord_ui_practice/view/home/chat_body.dart';
import 'package:discord_ui_practice/view/home/chat_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'chat_input.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Color(0xff2c2f33),
          child: Column(
            children: [
              ChatHeader(),
              Expanded(
                child: ChatBody(),
              ),
              ChatInput(),
            ],
          ),
        ),
      ),
    );
  }
}



