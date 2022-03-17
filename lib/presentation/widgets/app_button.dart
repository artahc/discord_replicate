import 'package:flutter/material.dart';

class Test {}

class AppButton extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Size size;
  final Widget? child;
  final Function() onPressed;
  final Color? color;
  final Color? highlightColor;
  final Color? splashColor;
  final BorderRadius? borderRadius;
  final Alignment childAlignment;

  const AppButton(
      {Key? key,
      required this.onPressed,
      this.child,
      this.color,
      this.highlightColor,
      this.splashColor,
      this.size = const Size(double.infinity, 45),
      this.margin,
      this.padding,
      this.borderRadius,
      this.childAlignment = Alignment.center})
      : super(key: key);

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
          animationDuration: Duration.zero,
          hoverElevation: 0,
          highlightColor: highlightColor ?? Theme.of(context).backgroundColor,
          highlightElevation: 0,
          splashColor: splashColor ?? Theme.of(context).splashColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
          ),
          child: child,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
