import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class FriendsPanel extends StatelessWidget {
  const FriendsPanel({Key? key}) : super(key: key);

  List<User> _fetchUsers() {
    return List.generate(25, (index) => RemoteUser.dummy());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(bottom: 60),
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
                          AssetImage(AppIcons.direct_message_icon),
                          size: 16,
                        ),
                        ImageIcon(
                          AssetImage(AppIcons.add_user_icon),
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Builder(
              builder: (context) {
                var users = _fetchUsers();
                return Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    child: GroupListView<User, User>(
                      elements: users,
                      groupBy: (e) => e,
                      beforeListWidget: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                          child: AppMaterialButton(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            onPressed: () {},
                            size: Size(double.infinity, 60),
                            color: Theme.of(context).colorScheme.primary,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CircleContainer(size: Size(40, 40), color: Colors.white),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Wrap(
                                      direction: Axis.vertical,
                                      spacing: 3,
                                      children: [
                                        Text(
                                          "Find your friends",
                                          style: Theme.of(context).textTheme.subtitle2,
                                        ),
                                        Text(
                                          "Sync your contacts and start chatting",
                                          style: Theme.of(context).textTheme.caption?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                      groupHeaderBuilder: (context, group, index) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          color: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            "asd",
                            // "${group.value().toUpperCase()} \u2014 ${users.where((e) => e.status == group).length}",
                            style: Theme.of(context).textTheme.caption?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                          ),
                        );
                      },
                      itemBuilder: (context, element, index) {
                        return Container(
                          height: 75,
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              CircleContainer(
                                size: Size(40, 40),
                                color: Colors.white,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Wrap(
                                    direction: Axis.vertical,
                                    spacing: 5,
                                    children: [
                                      // Text("${element.credential.email}"),
                                      // Text(
                                      //   "${element.status.value()}",
                                      //   style: Theme.of(context).textTheme.caption?.copyWith(
                                      //         color: Theme.of(context).colorScheme.onPrimary,
                                      //       ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 10,
                                  children: [
                                    CircleContainer(
                                      size: Size(35, 35),
                                      child: IconButton(
                                        iconSize: 1,
                                        icon: ImageIcon(
                                          AssetImage(AppIcons.phone_icon),
                                          size: 13,
                                        ),
                                        onPressed: () {},
                                      ),
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                    CircleContainer(
                                      size: Size(35, 35),
                                      child: IconButton(
                                        iconSize: 1,
                                        icon: ImageIcon(
                                          AssetImage(AppIcons.direct_message_icon),
                                          size: 13,
                                        ),
                                        onPressed: () {},
                                      ),
                                      color: Theme.of(context).colorScheme.primary,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
