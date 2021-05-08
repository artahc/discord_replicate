import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/model/server_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ServerItem extends StatefulWidget {
  final SingleServerData data;

  const ServerItem({Key key, this.data}) : super(key: key);

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
    Widget avatar = Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: const Color(0xff7289da),
      ),
    );

    Widget placeholder = Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: const Color(0xff363940),
      ),
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialButton(
          padding: EdgeInsets.all(0),
          minWidth: 0,
          splashColor: Colors.transparent,
          // highlightColor: Colors.transparent,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            print(widget.data.name);
          },
          child: LongPressDraggable(
            feedback: avatar,
            childWhenDragging: placeholder,
            child: AnimatedContainer(
              width: 45,
              height: 45,
              duration: Duration(milliseconds: 150),
              curve: Curves.easeInOutSine,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(0xff7289da),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: const ServerItemIndicator(),
        )
      ],
    );
  }
}

class ServerItemIndicator extends StatelessWidget {
  const ServerItemIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 5,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.horizontal(right: Radius.circular(16))),
    );
  }
}
