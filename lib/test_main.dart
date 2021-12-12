import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/model/credential.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/repository/user_repository.dart';
import 'package:discord_replicate/service/auth_service.dart';
import 'package:discord_replicate/util/graphql_client_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'dart:developer';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // statu
  ));
  runApp(MainTestWidget());
}

class MainTestWidget extends StatelessWidget {
  MainTestWidget({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initializeFirebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext _) {
    return MaterialApp(
      theme: AppTheme.darkThemeData,
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: _initializeFirebase,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              } else if (snapshot.connectionState == ConnectionState.done) {
                return SinglePageButton();
              } else {
                return Container(
                  child: Text("Something wrong!"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class SinglePageButton extends StatelessWidget {
  final String url = "https://7298-182-253-132-151.ngrok.io";

  late AuthService _authService = FirebaseAuthService();
  late GraphQLClientHelper _client = GraphQLClientHelper(
    url: url,
    tokenProvider: () => _authService.getCurrentUserCredential(),
  );
  late GraphQLClientHelper _insecureClient = GraphQLClientHelper(
    url: url,
    tokenProvider: () => Future.value(Credential(uid: "", email: "", token: "")),
  );

  late UserRepository _userRepo = UserRepository(graphqlClient: _client);

  void _login() async {
    await _authService.signOut();
    await _authService.signIn("artahc@gmail.com", "artahc123");
  }

  void _doQuery(GraphQLClientHelper client) async {
    var user = await _userRepo.loadUser("FMYbWPwFWgTvRemhbbz1dLL9HkC2");
    log("Loaded user ${user.id} ${user.username} ${user.serverRefs}", name: this.runtimeType.toString());
  }

  SinglePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.green,
            child: Text("Login"),
            onPressed: () async {
              _login();
            },
          ),
          MaterialButton(
            color: Colors.blue,
            child: Text("Request"),
            onPressed: () async {
              _doQuery(_client);
            },
          ),
          MaterialButton(
            color: Colors.red,
            child: Text("Request without header"),
            onPressed: () async {
              _doQuery(_insecureClient);
            },
          ),
        ],
      ),
    );
  }
}
