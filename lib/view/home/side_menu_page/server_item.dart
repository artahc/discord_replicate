import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/model/server_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ServerItem extends StatefulWidget {
  final ServerData data;
  final EdgeInsets margin;

  const ServerItem({Key key, this.data, this.margin}) : super(key: key);

  @override
  _ServerItemState createState() => _ServerItemState();
}

class _ServerItemState extends State<ServerItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable(
      data: this.widget,
      feedback: this.widget,
      axis: Axis.vertical,
      childWhenDragging: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: Color(0xff363940),
            borderRadius: BorderRadius.circular(26)
        ),
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        minWidth: 0,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
        onPressed: () {},
        child: AnimatedContainer(
          width: 45,
          height: 45,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOutSine,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Color(0xff7289da),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/direct-message.png",
              height: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
