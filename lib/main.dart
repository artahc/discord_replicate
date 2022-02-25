import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';

import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/app_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  await Firebase.initializeApp();
  await AppConfiguration.initServiceLocator();
  await AppConfiguration.initHive();

  runApp(Main());
}

class Main extends StatelessWidget {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final authBloc = sl.get<AuthBloc>();
    final navBloc = sl.get<NavigationCubit>(param1: rootNavigatorKey);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (c) => authBloc),
        BlocProvider<NavigationCubit>(create: (c) => navBloc),
      ],
      child: MaterialApp(
        navigatorKey: rootNavigatorKey,
        theme: AppTheme.darkThemeData,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: Routes.initial,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
