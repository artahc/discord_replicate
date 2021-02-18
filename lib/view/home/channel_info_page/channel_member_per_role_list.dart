import 'package:discord_ui_practice/view/home/channel_info_page/channel_member_item.dart';
import 'package:flutter/widgets.dart';

class ChannelMemberListPerRole extends StatelessWidget {
  final String role;
  final List<String> memberList;

  ChannelMemberListPerRole(this.role, this.memberList);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          "$role - ${memberList.length}".toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xffb9bbbe),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: new List<Widget>.generate(this.memberList.length, (index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ChannelMemberItem(memberList[index]),
          );
        }),
      ),
    ]);
  }
}
