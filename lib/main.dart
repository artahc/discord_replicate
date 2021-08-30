import 'package:discord_ui_practice/domain/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/domain/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/domain/cubit/theme/theme_cubit.dart';
import 'package:discord_ui_practice/presentation/view/home/home_page.dart';
import 'package:discord_ui_practice/test_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff202226), // navigation bar color
    statusBarColor: Color(0xff202226), // status bar color
  ));
  runApp(
    BlocDependency(
      child: Main(),
    ),
  );
}

class BlocDependency extends StatelessWidget {
  const BlocDependency({Key? key, required Widget child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (c) => ThemeCubit()),
        BlocProvider<ServerBloc>(create: (c) => ServerBloc()),
        BlocProvider<DirectMessageBloc>(create: (c) => DirectMessageBloc()),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
        bloc: BlocProvider.of<ThemeCubit>(context, listen: true),
        builder: (context, theme) {
          return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}
