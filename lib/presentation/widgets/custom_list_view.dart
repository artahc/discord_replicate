import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'app_widget.dart';

class CustomListView<T> extends StatefulWidget {
  final List<T> elements;
  final ItemBuilder<T> builder;
  final List<Widget> before;
  final List<Widget> after;
  final IndexedWidgetBuilder? separatorBuilder;

  const CustomListView({
    Key? key,
    required this.elements,
    required this.builder,
    this.separatorBuilder,
    this.before = const <Widget>[],
    this.after = const <Widget>[],
  }) : super(key: key);

  @override
  State<CustomListView<T>> createState() => _CustomListViewState<T>();
}

class _CustomListViewState<T> extends State<CustomListView<T>> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: widget.elements.length,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => widget.before[index],
            childCount: widget.before.length,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final int itemIndex = index ~/ 2;
              if (index.isEven) {
                return widget.builder(context, widget.elements[itemIndex], itemIndex);
              }
              return widget.separatorBuilder != null ? widget.separatorBuilder!(context, index) : Container();
            },
            childCount: math.max(0, widget.elements.length * 2 - 1),
            semanticIndexCallback: (context, index) {
              return index.isEven ? index ~/ 2 : null;
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => widget.after[index],
            childCount: widget.after.length,
          ),
        ),
      ],
    );
  }
}
