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
  List<ServerItem> children;

  @override
  void initState() {
    super.initState();
    children = widget.children.toList();
    _folderAnimController = AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    _folderAnimController.value = _isExpanded ? 0 : 1;
    // _gridAnimController = AnimationController(duration: Duration(milliseconds: 350), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedSize(
          vsync: this,
          duration: Duration(milliseconds: 150),
          alignment: Alignment.topCenter,
          child: Container(
            // width: 45,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16), bottom: Radius.circular(_isExpanded ? 26 : 16)),
              color: const Color(0xff363940),
            ),
            child: Column(
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
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: children.length,
                      itemBuilder: (c, index){
                        return children[index];
                      },
                      separatorBuilder: (c, index){
                        return Divider(height: Style.serverItemSpacing/2,);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        MaterialButton(
          padding: EdgeInsets.all(0),
          minWidth: 0,
          // splashColor: Colors.transparent,
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
      ],
    );
  }
}
