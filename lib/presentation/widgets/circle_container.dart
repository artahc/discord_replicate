import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleContainer extends StatelessWidget {
  final Size size;
  final Color? color;
  final Widget? child;

  CircleContainer({this.size = const Size.square(40), this.color = Colors.transparent, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: color,
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Container(
            alignment: Alignment.center,
            child: this.child ?? Container(),
          ),
        ),
      ),
    );
  }
}
