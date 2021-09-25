import 'package:discord_replicate/data/model/message_data.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class MessageItem extends StatelessWidget {
  final MessageData data;

  MessageItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleContainer(
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
                      Text(data.userName, style: Theme.of(context).textTheme.bodyText1),
                      Text(DateFormat.yMMMd().add_jm().format(data.createdAt),
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Theme.of(context).colorScheme.onSecondary,
                              )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(this.data.message, style: Theme.of(context).textTheme.bodyText2),
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
