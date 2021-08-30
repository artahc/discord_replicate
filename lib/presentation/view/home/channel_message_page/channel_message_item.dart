import 'package:discord_ui_practice/data/model/message_data.dart';
import 'package:discord_ui_practice/external/app_theme.dart';
import 'package:discord_ui_practice/presentation/view/widgets/circle_container.dart';
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
          CircleContainer(40, 40, child: null,),
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
                      Text(
                        data.userName,
                        style: Theme.of(context).textTheme.headline6
                      ),
                      Text(
                        DateFormat.yMEd().add_jms().format(data.createdAt),
                        style: Theme.of(context).accentTextTheme.subtitle2
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      this.data.message,
                      style: Theme.of(context).textTheme.bodyText1
                    ),
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
