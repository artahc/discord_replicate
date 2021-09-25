import 'package:discord_ui_practice/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserStatus {
  String emoji;
  String statusText;

  UserStatus(this.emoji, this.statusText);

  static UserStatus empty() {
    return UserStatus("", "");
  }
}

class DirectMessageItem extends StatelessWidget {
  final String id;
  final String title;
  final bool isGroup;
  final UserStatus? status;

  DirectMessageItem({required this.id, required this.title, this.status, this.isGroup = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          CircleContainer(
            size: Size(40, 40),
            child: SizedBox(),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Center(
              child: Wrap(
                spacing: 2,
                direction: Axis.vertical,
                children: [
                  Text(title, style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
