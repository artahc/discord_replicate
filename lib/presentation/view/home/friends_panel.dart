import 'package:flutter/material.dart';

class FriendsPanel extends StatelessWidget {
  const FriendsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              child: Text("Friends"),
            )
          ],
        ),
      ),
    );
  }
}
