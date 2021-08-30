import 'package:discord_ui_practice/data/model/server_data.dart';
import 'package:discord_ui_practice/domain/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/domain/bloc/server/server_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerItem extends StatelessWidget {
  final Key key;
  final ServerData serverData;
  final bool selected;
  final Function? onPressed;

  ServerItem({required this.key, required this.serverData, this.onPressed, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          MaterialButton(
            padding: EdgeInsets.all(0),
            minWidth: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            visualDensity: VisualDensity.compact,
            onPressed: () {
              this.onPressed?.call();
            },
            child: AnimatedContainer(
              width: 45,
              height: 45,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeInOutSine,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(selected ? 16 : 28),
                color: Color(0xff7289da),
              ),
            ),
          ),
          /*Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              height: selected ? 35 : 10,
              width: 5,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.horizontal(right: Radius.circular(16))),
            ),
          )*/
        ],
      ),
    );
  }
}
