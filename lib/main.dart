import 'package:discord_replicate/domain/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/domain/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/domain/bloc/server/server_bloc.dart';
import 'package:discord_replicate/domain/cubit/theme/theme_cubit.dart';
import 'package:discord_replicate/domain/routes/route_generator.dart';
import 'package:discord_replicate/domain/services/firebase_auth_service.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/presentation/view/splash_screen/splash_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff202226), // navigation bar color
    statusBarColor: Color(0xff202226), // status bar color
  ));
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final Future<FirebaseApp> _initializeFirebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase,
      builder: (context, snapshot) {
        dev.log("Initializing FirebaseApp. ConnectionState: ${snapshot.connectionState}",
            name: this.runtimeType.toString());
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox.expand(
            child: Container(color: AppTheme.darkThemeData.backgroundColor),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ThemeCubit>(create: (c) => ThemeCubit()),
              BlocProvider<ServerBloc>(create: (c) => ServerBloc()),
              BlocProvider<DirectMessageBloc>(create: (c) => DirectMessageBloc()),
              BlocProvider<AuthBloc>(create: (c) => AuthBloc(FirebaseAuthService())),
            ],
            child: MaterialApp(
              theme: AppTheme.darkThemeData,
              onGenerateRoute: RouteGenerator.generateRoutes,
              initialRoute: Routes.WelcomeRoute,
              debugShowCheckedModeBanner: false,
            ),
          );
        } else {
          return Center(
            child: Text("Error initializing firebase app."),
          );
        }
      },
    );
  }
}
