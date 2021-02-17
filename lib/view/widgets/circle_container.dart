import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget child;

  CircleContainer(this.height, this.width, {this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: this.color ?? Colors.white,
        child: SizedBox(
          height: this.height,
          width: this.width,
          child: Container(
            alignment: Alignment.center,
            child: this.child ?? Container(),
          ),
        ),
      ),
    );
  }
}
