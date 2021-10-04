import 'package:discord_replicate/data/model/user_data.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:collection/collection.dart';

class FriendsPanel extends StatelessWidget {
  const FriendsPanel({Key? key}) : super(key: key);

  List<UserData> _fetchUsers() {
    return List.generate(30, (index) => UserData(name: "$index", status: UserStatus.values[index % 5]));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "Friends",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Wrap(
                      spacing: 30,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage(AppIcon.direct_message_icon),
                          size: 16,
                        ),
                        ImageIcon(
                          AssetImage(AppIcon.add_user_icon),
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                child: GroupedListView<UserData, UserStatus>(
                  padding: const EdgeInsets.only(bottom: 60),
                  elements: _fetchUsers(),
                  groupBy: (e) {
                    var status = e.status;
                    return status;
                  },
                  groupComparator: (a, b) {
                    return a.index.compareTo(b.index);
                  },
                  groupSeparatorBuilder: (e) => Text("${e}"),
                  itemBuilder: (_, e) => Text("${e.name}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

