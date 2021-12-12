import 'package:discord_replicate/bloc/navigation/navigation_bloc.dart';
import 'package:discord_replicate/repository/server_repository.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  runApp(Main());
}

class Main extends StatelessWidget {
  // Constant
  final String url = "https://23e7-182-253-132-151.ngrok.io";

  // Service
  late AuthService authService = FirebaseAuthService();

  // Helper Class
  late GraphQLClientHelper graphqlClient = GraphQLClientHelper(url: url, tokenProvider: () => authService.getCurrentUserCredential());

  // Repository
  late UserRepository userRepository = UserRepository(graphqlClient: graphqlClient);
  late ServerRepository serverRepository = ServerRepository(graphQLClient: graphqlClient);

  // Bloc
  late ServerBloc serverBloc = ServerBloc(serverRepository: serverRepository);
  late DirectMessageBloc directMessageBloc = DirectMessageBloc();
  late AuthBloc authBloc = AuthBloc(authService: authService, userRepository: userRepository);
  late NavigationBloc navBloc = NavigationBloc();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox.expand(
            child: Container(color: AppTheme.darkThemeData.backgroundColor),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ServerBloc>(create: (c) => serverBloc),
              BlocProvider<DirectMessageBloc>(create: (c) => directMessageBloc),
              BlocProvider<AuthBloc>(create: (c) => authBloc),
              BlocProvider<NavigationBloc>(create: (c) => navBloc),
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
