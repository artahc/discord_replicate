import 'package:collection/collection.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class GroupListView<T, G> extends StatefulWidget {
  final List<T> elements;
  final List<Widget> beforeListWidget;
  final List<Widget> afterListWidget;
  final G Function(T) groupBy;
  final ItemBuilder<G> groupHeaderBuilder;
  final ItemBuilder<T> itemBuilder;

  const GroupListView({
    Key? key,
    required this.elements,
    required this.groupBy,
    required this.groupHeaderBuilder,
    required this.itemBuilder,
    this.beforeListWidget = const <Widget>[],
    this.afterListWidget = const <Widget>[],
  }) : super(key: key);

  @override
  _GroupListViewState<T, G> createState() => _GroupListViewState<T, G>();
}

class _GroupListViewState<T, G> extends State<GroupListView<T, G>> {
  late var _scrollController = ScrollController();
  late List<dynamic> _flattenedElements = _flattenElements();

  List<dynamic> _flattenElements() {
    var grouppedElement = widget.elements.groupListsBy((e) => widget.groupBy(e));
    List<dynamic> result = List.empty(growable: true);
    var keys = grouppedElement.keys.toList();
    for (int i = 0; i < grouppedElement.keys.length; i++) {
      result.add(keys[i]);
      var items = grouppedElement[keys[i]]!;
      for (int j = 0; j < items.length; j++) {
        result.add(items[j]);
      }
    }
    return result;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
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
              if (_flattenedElements[index] is T) {
                return widget.itemBuilder(context, _flattenedElements[index]);
              } else {
                return widget.groupHeaderBuilder(context, _flattenedElements[index]);
              }
            },
            childCount: _flattenedElements.length,
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

class _PersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _PersistentHeaderDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_PersistentHeaderDelegate oldDelegate) {
    return minHeight != oldDelegate.minExtent || maxHeight != oldDelegate.maxExtent || child != oldDelegate.child;
  }
}
