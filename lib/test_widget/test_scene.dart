import 'package:flutter/material.dart';

class TestMain extends StatefulWidget {
  @override
  _TestMainState createState() => _TestMainState();
}

class _TestMainState extends State<TestMain> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ReorderableListView(
          buildDefaultDragHandles: false,
          shrinkWrap: true,
          children: [
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 0),
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 1),
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 2),
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 3),
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 4),
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 5),
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 6),
            ReorderableDragStartListener(key: UniqueKey(), child: Item(), index: 7),
          ],
          onReorder: (oldIndex, newIndex) {
            print("$oldIndex --> $newIndex");
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}

class ReorderableGrouppableListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: const Color(0xff363940),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 15),
        shrinkWrap: true,
        children: [
          Draggable(
            feedback: Container(width: 45, height: 45, color: Colors.blueAccent),
            child: Container(
              color: Colors.white10,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 35,
                      width: 5,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.horizontal(right: Radius.circular(16))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Item(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff7289da),
      ),
      child: Container(
        width: 45,
        height: 45,
      ),
    );
  }
}
