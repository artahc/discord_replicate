import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class ChannelListPanel extends StatefulWidget {
  const ChannelListPanel({Key? key}) : super(key: key);

  @override
  _ChannelListPanelState createState() => _ChannelListPanelState();
}

class _ChannelListPanelState extends State<ChannelListPanel> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(right: (MediaQuery.of(context).size.width * 0.125) + 5),
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  child: Placeholder(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Server Name",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            AppMaterialButton(
              margin: const EdgeInsets.all(15),
              color: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
              size: const Size(double.infinity, 40),
              child: Text("Invite Members"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
