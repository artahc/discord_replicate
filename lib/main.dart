import 'package:discord_ui_practice/view/home/channel_info_page/channel_info_page.dart';
import 'package:discord_ui_practice/view/home/channel_page/channel_page.dart';
import 'package:discord_ui_practice/view/home/home_page.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/side_menu_page.dart';
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
        backgroundColor: Color(0xff202226),
        body: HomePage(),
      ),
    );
  }
}
