import 'package:discord_replicate/data/model/user_data.dart';
import 'package:discord_replicate/external/app_theme.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:discord_replicate/presentation/widgets/group_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

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
        body: SafeArea(child: SemanticIndex()),
      ),
    );
  }
}

class SemanticIndex extends StatelessWidget {
  final List<int> values = List.generate(15, (index) => index + 1);
  final _scrollController = ScrollController();
  SemanticIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      semanticChildCount: values.length,
      slivers: [
        SliverToBoxAdapter(
          child: AppMaterialButton(
            size: Size(double.infinity, 55),
            onPressed: () async {
              // await _scrollController.animateTo(0, duration: Duration(milliseconds: 100), curve: Curves.bounceOut);
              _scrollController.position
                  .animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final int itemIndex = index ~/ 2;
              if (index.isEven) {
                return InkWell(
                  onTap: () {
                    print(_scrollController);
                  },
                  child: Container(
                    height: 55,
                    color: Colors.white10,
                    child: Center(child: Text("Index:$index, ItemIndex: $itemIndex, value: ${values[itemIndex]}")),
                  ),
                );
              }
              return Text("------");
            },
            childCount: math.max(0, values.length * 2 - 1),
            semanticIndexCallback: (_, index) {
              return index.isEven ? index ~/ 2 : null;
            },
          ),
        ),
      ],
    );
  }
}
