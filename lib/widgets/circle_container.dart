import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircleContainer extends StatelessWidget {
  final Size size;
  final Color? color;
  final Widget? child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  CircleContainer({this.size = const Size.square(40), this.color = Colors.transparent, this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: ClipOval(
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
      ),
    );
  }
}
