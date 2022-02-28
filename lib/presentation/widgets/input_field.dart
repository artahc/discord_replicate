import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String? labelText;
  final String? hintText;
  final BoxConstraints? prefixIconConstraint;
  final Widget? prefixIcon;
  final double height;
  final TextStyle? hintStyle;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final bool obscureText;

  const AppInputField({
    Key? key,
    this.controller,
    this.margin,
    this.padding,
    this.height = 55,
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.prefixIconConstraint,
    this.suffixIcon,
    this.backgroundColor,
    this.borderRadius,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: margin,
      height: height,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        cursorWidth: 3,
        cursorRadius: Radius.circular(15),
        obscureText: obscureText,
        maxLines: 1,
        style: TextStyle(
          height: 1,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: hintStyle ?? theme.inputDecorationTheme.hintStyle,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
          contentPadding: padding ?? theme.inputDecorationTheme.contentPadding,
        ),
      ),
    );
  }
}
