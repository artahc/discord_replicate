import 'package:flutter/material.dart';

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