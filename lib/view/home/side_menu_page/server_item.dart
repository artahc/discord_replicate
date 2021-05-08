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
  bool _isFocused = false;
  Widget _serverIndicator;

  @override
  void initState() {
    super.initState();
    _serverIndicator = ServerItemIndicator(isFocused: _isFocused);
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
            setState(() {
              _isFocused = !_isFocused;
            });
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
                borderRadius: BorderRadius.circular(_isFocused ? 16 : 28),
                color: Color(0xff7289da),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ServerItemIndicator(isFocused: _isFocused),
        )
      ],
    );
  }
}

class ServerItemIndicator extends StatefulWidget {
  final bool isFocused;

  const ServerItemIndicator({Key key, this.isFocused = false}) : super(key: key);

  @override
  _ServerItemIndicatorState createState() => _ServerItemIndicatorState();
}

class _ServerItemIndicatorState extends State<ServerItemIndicator> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: widget.isFocused ? 35 : 10,
      width: 5,
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.horizontal(right: Radius.circular(16))),
    );
  }
}
