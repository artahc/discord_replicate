import 'package:discord_replicate/data/model/user_data.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/presentation/widgets/grouppable_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // systemNavigationBarColor: Color(0xff202226), // navigation bar color
    // statusBarColor: Color(0xff202226), // status bar color
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // statu
  ));
  runApp(MainTestWidget());
}

class MainTestWidget extends StatelessWidget {
  const MainTestWidget({Key? key}) : super(key: key);

  List<UserData> _fetchUsers() {
    return List.generate(15, (index) => UserData(name: "$index", status: UserStatus.values[index % 5]));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkThemeData,
      home: Scaffold(
        body: MyGroupList<UserData, UserStatus>(
          elements: _fetchUsers(),
          groupBy: (e) => e.status,
        ),
      ),
    );
  }
}
