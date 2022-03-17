import 'package:discord_replicate/application/config/configuration.dart';
import 'package:discord_replicate/presentation/theme/app_theme.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/bloc/routes/route_generator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_test.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator("localhost", 5000);
  await Configuration.initServiceLocator();
  await Configuration.initHive();

  runApp(
    ProviderScope(child: TestApplication()),
  );
}

class Application extends StatelessWidget {
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
