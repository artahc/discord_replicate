import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  final List<Widget> children;
  
  HomeNavigationBar({Key? key, this.children = const<Widget>[]}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children
      ),
    );
  }
}
