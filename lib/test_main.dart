import 'package:discord_replicate/model/user_data.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/repository/graphql_client_repository.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:discord_replicate/widgets/group_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // statu
  ));
  runApp(MainTestWidget());
}

class MainTestWidget extends StatelessWidget {
  const MainTestWidget({Key? key}) : super(key: key);

  List<UserData> _fetchUsers() {
    return List.generate(170, (index) => UserData(name: "$index", status: UserStatus.values[index % 5]));
  }

  @override
  Widget build(BuildContext _) {
    return MaterialApp(
      theme: AppTheme.darkThemeData,
      home: Scaffold(
        body: SafeArea(child: SinglePageButton()),
      ),
    );
  }
}

class SinglePageButton extends StatelessWidget {
  late GraphQLClientRepository _client = GraphQLClientRepository(url: 'https://discord-replicate-backend-1029.herokuapp.com/graphql');
  void _doQuery() async {
    final String query = r'''
      query GetAllServers {
        servers {
          id
          name
          channels {
            id
            name
          }
        }
      }
    ''';

    var result = await _client.query(query);
    print(result);
  }

  SinglePageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        color: Colors.blue,
        child: Text("Request"),
        onPressed: () async {
          _doQuery();
        },
      ),
    );
  }
}
