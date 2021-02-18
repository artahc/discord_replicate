import 'package:discord_ui_practice/view/home/channel_info_page/channel_member_per_role_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChannelMemberBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var dummyRoles = ["Janitor", "Waiter", "Sepuh", "Kang Ide", "Prohemmer"];
    var dummyName = ["Lonely user", "Happy user", "Crazy user"];

    var members = Map<String, List<String>>();
    members[dummyRoles[0]] = dummyName;
    members[dummyRoles[1]] = dummyName;
    members[dummyRoles[2]] = dummyName;
    members[dummyRoles[3]] = dummyName;
    members[dummyRoles[4]] = dummyName;

    var roles = members.keys.toList();


    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ChannelMemberListPerRole(roles[index], members[roles[index]]),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 10,
          );
        },
        itemCount: roles.length,
      ),
    );
  }
}
