import 'package:discord_ui_practice/view/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelMemberItem extends StatelessWidget {
  final String name;

  ChannelMemberItem(this.name);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      children: [
        CircleContainer(
          35,
          35,
          color: Colors.white,
          child: SizedBox(),
        ),
        Text(
          this.name,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
