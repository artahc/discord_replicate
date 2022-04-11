import 'package:discord_replicate/application/config/hive.config.dart';
import 'package:discord_replicate/application/config/injection.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/bloc/routes/route_generator.dart';
import 'package:discord_replicate/presentation/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  await Firebase.initializeApp();
  await initHive();
  configureDependencies(sl, Env.DEV);

  runApp(Application());
}

class Application extends StatelessWidget {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

  Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = sl.get<AuthBloc>();
    final navBloc = sl.get<NavigationCubit>(param1: authBloc, param2: rootNavigatorKey);

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
