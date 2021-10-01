import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class FriendsPanel extends StatelessWidget {
  const FriendsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      child: SafeArea(
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 60),
                child: Builder(builder: (context) {
                  var discoverButton = AppMaterialButton(
                    size: const Size(double.infinity, 65),
                    color: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: IconTheme.of(context).color,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              runAlignment: WrapAlignment.center,
                              direction: Axis.vertical,
                              spacing: 3,
                              children: [
                                Text(
                                  "Find your friends",
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                  "Sync your contacts and start chatting.",
                                  style: Theme.of(context).textTheme.caption?.copyWith(
                                        color: Theme.of(context).colorScheme.onPrimary,
                                        fontSize: 12,
                                        letterSpacing: .2,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: IconTheme.of(context).color,
                        )
                      ],
                    ),
                    onPressed: () {},
                  );

                  List<Widget> children = List<Widget>.generate(
                    25,
                    (index) {
                      return Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "$index",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    },
                    growable: true,
                  ).toList()
                    ..insert(0, discoverButton);

                  return Column(
                    children: children,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
