import 'package:discord_ui_practice/model/server_data.dart';
import 'package:flutter/material.dart';

class ServerItem extends StatefulWidget {
  final Key key;
  final ServerData data;
  final bool isSelected;
  final Function(Key) onSelected;

  ServerItem({this.key, this.data, this.isSelected = false, this.onSelected});

  @override
  _ServerItemState createState() => _ServerItemState();
}

class _ServerItemState extends State<ServerItem> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      minWidth: 0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      onPressed: () {
        // print ("Server ${widget.data.toString()}");
        widget.onSelected?.call(widget.key);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
        key: ValueKey("direct-message"),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.isSelected ? 16 : 28),
          color: Color(0xff7289da),
        ),
        width: 45,
        height: 45,
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/direct-message.png",
            height: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
