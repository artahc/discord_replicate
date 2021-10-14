import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomListView<T> extends StatefulWidget {
  final List<T> elements;
  final List<Widget> beforeListWidget;
  final List<Widget> afterListWidget;
  final ItemBuilder<T> itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;

  const CustomListView({
    Key? key,
    required this.elements,
    required this.beforeListWidget,
    required this.afterListWidget,
    required this.itemBuilder,
    required this.separatorBuilder,
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
            (context, index) => widget.beforeListWidget[index],
            childCount: widget.beforeListWidget.length,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final int itemIndex = index ~/ 2;
              if (index.isEven) {
                return widget.itemBuilder(context, widget.elements[itemIndex]);
              }
              return widget.separatorBuilder(context, itemIndex);
            },
            childCount: math.max(0, widget.elements.length * 2 - 1),
            semanticIndexCallback: (context, index) {
              return index.isEven ? index ~/ 2 : null;
            },
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => widget.afterListWidget[index],
            childCount: widget.afterListWidget.length,
          ),
        ),
      ],
    );
  }
}
