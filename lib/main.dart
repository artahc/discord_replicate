import 'package:discord_ui_practice/bloc/channel/channel_bloc.dart';
import 'package:discord_ui_practice/bloc/connectivity/connectivity_bloc.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/bloc/message/conversation_bloc.dart';
import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/bloc/user/user_bloc.dart';
import 'package:discord_ui_practice/method_channel/networking_channel.dart';
import 'package:discord_ui_practice/repository/channel_repository.dart';
import 'package:discord_ui_practice/repository/server_repository.dart';
import 'package:discord_ui_practice/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff202226), // navigation bar color
    statusBarColor: Color(0xff202226), // status bar color
  ));
  runApp(Main());
}

class Main extends StatelessWidget {
  final NetworkingMethodChannel _networkApi = NetworkingMethodChannel("networking_discord_practice");
  final ChannelRepository _channelRepository = ChannelRepository();
  final ServerRepository _serverRepository = ServerRepository();

  @override
  Widget build(BuildContext context) {
    final _channelBloc = ChannelBloc(_channelRepository, _networkApi);
    final _serverBloc = ServerBloc(_serverRepository, _networkApi);
    final _directMessageBloc = DirectMessageBloc(_networkApi);
    final _conversationBloc = ConversationBloc(_networkApi);
    final _connectivityBloc = ConnectivityBloc();
    final _userBloc = UserBloc();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NetworkingMethodChannel>(create: (context) => _networkApi),
          RepositoryProvider<ChannelRepository>(create: (context) => _channelRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ChannelBloc>(
              create: (context) => _channelBloc,
            ),
            BlocProvider<ServerBloc>(
              create: (context) => _serverBloc,
            ),
            BlocProvider<DirectMessageBloc>(
              create: (context) => _directMessageBloc,
            ),
            BlocProvider<ConversationBloc>(
              create: (context) => _conversationBloc,
            ),
            BlocProvider<ConnectivityBloc>(
              create: (context) => _connectivityBloc,
            ),
            BlocProvider<UserBloc>(
              create: (context) => _userBloc,
            ),
          ],
          child: HomePage(),
        ),
      ),
    );
  }
}
