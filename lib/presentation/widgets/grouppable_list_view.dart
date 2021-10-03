import 'package:discord_replicate/data/model/user_data.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

/// E = Element of list. ex. List<UserData> = List<E> = E - > UserData
///
class MyGroupList<E, K> extends StatefulWidget {
  final List<E> elements;
  final K Function(E) groupBy;
  const MyGroupList({Key? key, required this.elements, required this.groupBy}) : super(key: key);

  @override
  _MyGroupListState createState() => _MyGroupListState();
}

class _MyGroupListState<E, K> extends State<MyGroupList> {
  Map<dynamic, List<dynamic>> _groupElement() {
    return widget.elements.groupListsBy((e) => e.status);
  }

  @override
  Widget build(BuildContext context) {
    var grouppedElement = _groupElement();

    return ListView.builder(
      itemCount: widget.elements.length + grouppedElement.keys.length,
      itemBuilder: (_, index) {
        return Text("User#$index");
      },
    );
  }
}
