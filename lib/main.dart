import 'package:discord_ui_practice/view/home/chat_page.dart';
import 'package:discord_ui_practice/view/home_left_menu/side-menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: 'Typo-Grotesk'),
      home: Scaffold(
        backgroundColor: Color(0xff202225),
        // body: ChatPage(),
        body: SideMenu(),
      ),
    );
  }
}
