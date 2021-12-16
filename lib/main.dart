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
import 'package:discord_replicate/view/splash_screen/splash_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
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
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  // Constant
  final String url = "https://5a10-182-253-132-151.ngrok.io";

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServerBloc>(create: (c) => serverBloc),
        BlocProvider<DirectMessageBloc>(create: (c) => directMessageBloc),
        BlocProvider<AuthBloc>(create: (c) => authBloc),
        BlocProvider<NavigationBloc>(create: (c) => navBloc),
      ],
      child: MaterialApp(
        theme: AppTheme.darkThemeData,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: Routes.initial,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
