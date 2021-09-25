import 'package:discord_replicate/domain/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/domain/bloc/server/server_bloc.dart';
import 'package:discord_replicate/domain/cubit/theme/theme_cubit.dart';
import 'package:discord_replicate/domain/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
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

class BlocDependency extends StatelessWidget {
  final Widget child;

  const BlocDependency({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (c) => ThemeCubit()),
        BlocProvider<ServerBloc>(create: (c) => ServerBloc()),
        BlocProvider<DirectMessageBloc>(create: (c) => DirectMessageBloc()),
      ],
      child: child,
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (c) => ThemeCubit()),
        BlocProvider<ServerBloc>(create: (c) => ServerBloc()),
        BlocProvider<DirectMessageBloc>(create: (c) => DirectMessageBloc()),
      ],
      child: MaterialApp(
        theme: AppTheme.darkThemeData,
        onGenerateRoute: RouteGenerator.generateRoutes,
        initialRoute: Routes.WelcomeRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
