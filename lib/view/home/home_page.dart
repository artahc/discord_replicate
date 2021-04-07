import 'package:discord_ui_practice/bloc/channel_bloc.dart';
import 'package:discord_ui_practice/networking_channel.dart';
import 'package:discord_ui_practice/view/home/channel_info_page/channel_info_page.dart';
import 'package:discord_ui_practice/view/home/channel_message_page/channel_message_page.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/side_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print("Home page");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChannelBloc>(
          create: (context) => ChannelBloc(context.read<NetworkingMethodChannel>()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Color(0xff202226),
        body: Stack(
          children: [
            SideMenuPage(),
            ChannelInfoPage(),
            ChannelMessagePage(),
          ],
        ),
      ),
    );
  }
}
