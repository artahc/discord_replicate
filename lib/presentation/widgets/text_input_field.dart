import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String? labelText;
  final String? hintText;
  final BoxConstraints? prefixIconConstraint;
  final Widget? prefixIcon;

  const AppInputField({Key? key, this.margin, this.padding, this.labelText, this.hintText, this.prefixIcon, this.prefixIconConstraint, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 55,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        cursorWidth: 3,
        cursorRadius: Radius.circular(15),
        maxLines: 1,
        style: TextStyle(
          height: 1,
        ),
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
        ),
      ),
    );
  }
}
