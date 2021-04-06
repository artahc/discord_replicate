import 'package:discord_ui_practice/bloc/channel_bloc.dart';
import 'package:discord_ui_practice/networking_channel.dart';
import 'package:discord_ui_practice/view/home/channel_info_page/channel_info_page.dart';
import 'package:discord_ui_practice/view/home/channel_page/channel_page.dart';
import 'package:discord_ui_practice/view/home/home_page.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/side_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  final NetworkingMethodChannel networkApi = NetworkingMethodChannel("networking_discord_practice");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          Provider<NetworkingMethodChannel>.value(value: networkApi)
        ],
        child: HomePage(),
      ),
    );
  }
}
