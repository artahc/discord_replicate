import 'package:discord_replicate/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/model/message.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatefulWidget {
  final Message message;

  MessageTile({required this.message});

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  late User user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Theme.of(context).colorScheme.primary,
        onLongPress: () => print(widget.message.contentHash),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                          Builder(
                            builder: (_) {
                              return Text(widget.message.senderRef, style: Theme.of(context).textTheme.bodyText1);
                            },
                          ),
                          Text(DateFormat.yMMMd().add_jm().format(widget.message.date),
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  )),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        child: Builder(builder: (_) {
                          return Text(widget.message.message, style: Theme.of(_).textTheme.bodyText2);
                        }),
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
