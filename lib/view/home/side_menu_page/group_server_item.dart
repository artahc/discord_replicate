import 'package:discord_ui_practice/view/home/side_menu_page/server_item.dart';
import 'package:flutter/material.dart';

class GroupServerItem extends StatefulWidget {
  final List<ServerItem> children;

  GroupServerItem({this.children});

  @override
  _GroupServerItemState createState() => _GroupServerItemState();
}

class _GroupServerItemState extends State<GroupServerItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController _groupAnimController;
  Tween<Offset> _groupTween = Tween<Offset>(begin: Offset.zero, end: Offset(0, -1));
  List<ServerItem> children;

  @override
  void initState() {
    children = widget.children.toList();
    super.initState();
    _groupAnimController = AnimationController(duration: Duration(milliseconds: 350), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<ServerItem>(
      builder: (c, data, rejected) {
        return MaterialButton(
          padding: EdgeInsets.all(0),
          minWidth: 0,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          visualDensity: VisualDensity.compact,
          onPressed: () {
            if (_isExpanded) {
              _groupAnimController.animateTo(1, curve: Curves.easeInOutSine, duration: Duration(milliseconds: 150));
            } else {
              _groupAnimController.animateTo(0, curve: Curves.easeOutBack, duration: Duration(milliseconds: 600));
            }
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16), bottom: Radius.circular(16)),
              color: const Color(0xff363940),
            ),
            child: Builder(
              builder: (_) {
                if (widget.children.length == 1) {
                  print("anjay 1");
                  return children.first;
                } else {
                  print("anjay");
                  return GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    children: children.take(4).toList(),
                  );
                }
              },
            ),
          ),
        );
      },
      onAccept: (data) {
        children.add(data);
        setState(() {
        });
      },
    );
  }
}

//Column(
//           children: [
//             SlideTransition(
//               position: _groupTween.animate(_groupAnimController),
//               child: Container(
//                 height: 45,
//                 width: 45,
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.only(top: 8, bottom: 8),
//                 child: Image.asset(
//                   "assets/folder.png",
//                   height: 24,
//                   color: Color(0xff7289da),
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: _isExpanded,
//               maintainState: true,
//               child: Column(
//                 children: List.generate(2, (index) => Container(margin: EdgeInsets.only(top: 8), child: ServerItem(key: UniqueKey()))),
//               ),
//             ),
//           ],
//         ),
