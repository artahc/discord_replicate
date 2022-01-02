import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatelessWidget {
  final Message message;

  MessageTile({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleContainer(
            color: Theme.of(context).buttonTheme.colorScheme?.primary,
            size: Size(40, 40),
            child: null,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(message.senderId, style: Theme.of(context).textTheme.bodyText1),
                      Text(DateFormat.yMMMd().add_jm().format(message.date),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary,
                              )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Builder(builder: (_) {
                      if (message is TextMessage) {
                        var content = message as TextMessage;
                        return Text(content.message, style: Theme.of(_).textTheme.bodyText2);
                      } else {
                        return Container();
                      }
                    }),
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
