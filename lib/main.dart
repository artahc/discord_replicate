import 'package:discord_ui_practice/networking_channel.dart';
import 'package:discord_ui_practice/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'networking_channel.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  final NetworkingMethodChannel networkApi = NetworkingMethodChannel("networking_discord_practice");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NetworkingMethodChannel>(create: (context) => networkApi),
        ],
        child: HomePage(),
      ),
    );
  }
}
