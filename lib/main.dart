import 'package:discord_ui_practice/bloc/channel/channel_bloc.dart';
import 'package:discord_ui_practice/method_channel/networking_channel.dart';
import 'package:discord_ui_practice/repository/channel_repository.dart';
import 'package:discord_ui_practice/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Main());
}

class Main extends StatelessWidget {
  final NetworkingMethodChannel _networkApi = NetworkingMethodChannel("networking_discord_practice");
  final ChannelRepository _channelRepository = ChannelRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NetworkingMethodChannel>(create: (context) => _networkApi),
          RepositoryProvider<ChannelRepository>(create: (context) => _channelRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ChannelBloc>(
              create: (context) => ChannelBloc(_channelRepository, _networkApi),
            ),
          ],
          child: HomePage(),
        ),
      ),
    );
  }
}
