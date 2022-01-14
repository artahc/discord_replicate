import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class DirectMessageTile extends StatelessWidget {
  final Channel channel;
  final Function() onPressed;

  DirectMessageTile({required this.channel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        highlightColor: Theme.of(context).backgroundColor,
        child: Container(
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              CircleContainer(
                color: Theme.of(context).buttonTheme.colorScheme?.primary,
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
                      Text(
                        channel.name,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
