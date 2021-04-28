import 'package:discord_ui_practice/model/server_data.dart';
import 'package:flutter/material.dart';

class ServerItem extends StatefulWidget {
  final Key key;
  final ServerData data;
  final bool isSelected;
  final Function(Key) onSelected;
  final EdgeInsets margin;

  ServerItem({this.key, this.data, this.isSelected = false, this.onSelected, this.margin});

  @override
  _ServerItemState createState() => _ServerItemState();
}

class _ServerItemState extends State<ServerItem> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      minWidth: 0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      onPressed: () {
        widget.onSelected?.call(widget.key);
      },
      child: AnimatedContainer(
        width: 45,
        height: 45,
        margin: widget.margin,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOutSine,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.isSelected ? 16 : 28),
          color: Color(0xff7289da),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/direct-message.png",
            height: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GroupServerItem extends StatefulWidget {
  final List<ServerItem> children;
  final bool isExpanded;

  GroupServerItem({this.children, this.isExpanded = false});

  @override
  _GroupServerItemState createState() => _GroupServerItemState();
}

class _GroupServerItemState extends State<GroupServerItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  AnimationController _groupAnimController;
  Tween<Offset> _groupTween = Tween<Offset>(begin: Offset.zero, end: Offset(0, -1));

  @override
  void initState() {
    super.initState();
    _groupAnimController = AnimationController(duration: Duration(milliseconds: 350), vsync: this);
    print(_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      minWidth: 0,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      onPressed: () {
        if (_isExpanded) {
          _groupAnimController.animateTo(1, curve: Curves.easeInOutSine, duration: Duration(milliseconds: 250));
        } else {
          _groupAnimController.animateTo(0, curve: Curves.easeOutBack, duration: Duration(milliseconds: 600));
        }

        setState(() {
          _isExpanded = !_isExpanded;
          print(_isExpanded);
        });
      },
      child: Builder(
        builder: (c) {
          if (_isExpanded)
            return ClipRect(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16), bottom: Radius.circular(28)),
                  color: Color(0xff363940),
                ),
                child: Column(
                  children: [
                    SlideTransition(
                      position: _groupTween.animate(_groupAnimController),
                      child: Container(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Image.asset(
                          "assets/folder.png",
                          height: 24,
                          color: Color(0xff7289da),
                        ),
                      ),
                    ),
                    Column(
                      children: List.generate(3, (index) => Container(margin: EdgeInsets.only(top: 8), child: ServerItem(key: UniqueKey()))),
                    ),
                  ],
                ),
              ),
            );
          else
            return AnimatedContainer(
              width: 45,
              height: 45,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOutSine,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff7289da),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/direct-message.png",
                  height: 20,
                  color: Colors.white,
                ),
              ),
            );
        },
      ),
    );
  }
}
