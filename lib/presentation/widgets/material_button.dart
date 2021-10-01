import 'package:flutter/material.dart';

class AppMaterialButton extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Size size;
  final Widget? child;
  final Function() onPressed;
  final Color? color;

  const AppMaterialButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.size = const Size(double.infinity, 45),
    this.color,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: MaterialButton(
          elevation: 0,
          padding: padding ?? const EdgeInsets.all(0),
          color: color ?? Theme.of(context).buttonTheme.colorScheme!.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: child,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
