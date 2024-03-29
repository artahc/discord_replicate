import 'package:discord_ui_practice/view/widgets/circle_container.dart';
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
  final UserStatus status;

  DirectMessageItem(this.id, this.title, this.status, {this.isGroup = false});

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
            35,
            35,
            color: Colors.white70,
            child: SizedBox(),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Center(
              child: Wrap(
                spacing: 2,
                direction: Axis.vertical,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  status.statusText.isEmpty
                      ? Container()
                      : Text(
                          status.statusText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
