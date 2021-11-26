import 'package:discord_replicate/data/repository/firebase_auth_repository.dart';
import 'package:discord_replicate/domain/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/domain/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/domain/bloc/server/server_bloc.dart';
import 'package:discord_replicate/domain/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Color(0xff202226), // navigation bar color
    // statusBarColor: Color(0xff202226), // status bar color
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // statu
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox.expand(
            child: Container(color: AppTheme.darkThemeData.backgroundColor),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ServerBloc>(create: (c) => ServerBloc()),
              BlocProvider<DirectMessageBloc>(create: (c) => DirectMessageBloc()),
              BlocProvider<AuthBloc>(create: (c) => AuthBloc(FirebaseAuthRepository())),
            ],
            child: MaterialApp(
              theme: AppTheme.darkThemeData,
              onGenerateRoute: RouteGenerator.generateRoutes,
              initialRoute: Routes.InitialRoute,
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
