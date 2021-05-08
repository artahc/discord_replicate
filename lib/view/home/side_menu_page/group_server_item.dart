import 'package:discord_ui_practice/static/style.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/server_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupServerItem extends StatefulWidget {
  final List<ServerItem> children;

  const GroupServerItem({Key key, this.children}) : super(key: key);

  @override
  _GroupServerItemState createState() => _GroupServerItemState();
}

class _GroupServerItemState extends State<GroupServerItem> with TickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController _folderAnimController;
  AnimationController _gridAnimController;
  Tween<Offset> _folderTween = Tween<Offset>(begin: Offset.zero, end: Offset(0, -1));
  Tween<Offset> _gridTween = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero);
  List<ServerItem> _children;
  GlobalKey _groupChildrenKey = GlobalKey();
  Widget _groupChildren;

  @override
  void initState() {
    super.initState();
    _children = widget.children.toList();
    _folderAnimController = AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    _folderAnimController.value = _isExpanded ? 0 : 1;
    // _gridAnimController = AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    _groupChildren = _GroupChildren(key: _groupChildrenKey, children: _children);
  }

  double _getGroupChildrenHeight() {
    return _groupChildrenKey.currentContext.findRenderObject().semanticBounds.height + 45;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 45,
          height: _isExpanded ? _getGroupChildrenHeight() : 45,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(16), bottom: Radius.circular(_isExpanded ? 28 : 16)),
            color: const Color(0xff363940),
          ),
        ),
        Column(
          children: [
            Container(
              width: 45,
              height: 45,
              child: ClipRect(
                child: Stack(
                  children: [
                    SlideTransition(
                      position: _folderTween.animate(_folderAnimController),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Image.asset(
                          "assets/folder.png",
                          height: 24,
                          color: Color(0xff7289da),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _gridTween.animate(_folderAnimController),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(5),
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2,
                        children: widget.children.take(4).map((e) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              color: Color(0xff7289da),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _isExpanded,
              maintainState: true,
              child: _groupChildren,
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            MaterialButton(
              padding: EdgeInsets.all(0),
              minWidth: 0,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              visualDensity: VisualDensity.compact,
              onPressed: () {
                if (_isExpanded) {
                  _folderAnimController
                      .animateTo(1, curve: Curves.easeIn, duration: Duration(milliseconds: 150))
                      .whenComplete(() {
                    // _gridAnimController.animateTo(0, curve: Curves.easeOut, duration: Duration(milliseconds: 300));
                    Future.delayed(Duration(milliseconds: 150)).then((value) {
                      // _gridAnimController.value = 0;
                    });
                  });
                } else {
                  _folderAnimController.animateTo(0, curve: Curves.easeOut, duration: Duration(milliseconds: 300));
                  // _gridAnimController.animateTo(1, curve: Curves.easeIn, duration: Duration(milliseconds: 150));
                }
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: SizedBox(
                width: 45,
                height: 45,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: !_isExpanded,
                child: ServerItemIndicator(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GroupChildren extends StatelessWidget {
  final List<Widget> children;

  const _GroupChildren({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: children.length,
      itemBuilder: (c, index) {
        return children[index];
      },
      separatorBuilder: (c, index) {
        return SizedBox(height: Style.serverItemSpacing);
      },
    );
  }
}
