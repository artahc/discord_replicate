import 'package:discord_ui_practice/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_event.dart';
import 'package:discord_ui_practice/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/bloc/server/server_state.dart';
import 'package:discord_ui_practice/bloc/user/user_bloc.dart';
import 'package:discord_ui_practice/model/server_data.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/direct_message_item.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/server_item.dart';
import 'package:discord_ui_practice/view/widgets/circle_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class SideMenuPage extends StatefulWidget {
  @override
  _SideMenuPageState createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ServerList(),
        _DirectMessageList(),
        SizedBox(width: 55),
      ],
    );
  }
}

class _ServerList extends StatefulWidget {
  @override
  _ServerListState createState() => _ServerListState();
}

class _ServerListState extends State<_ServerList> {
  Key _selectedKey;
  Key _directMessageKey = ValueKey("direct-message");


  List<ServerData> _serverList;

  @override
  void initState() {
    _selectedKey = _directMessageKey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 10, bottom: 65),
        children: [
          MaterialButton(
            key: _directMessageKey,
            padding: EdgeInsets.all(0),
            minWidth: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            visualDensity: VisualDensity.compact,
            onPressed: () {
              print("Direct Message Pressed");
              if (_selectedKey != _directMessageKey)
                setState(() {
                  _selectedKey = _directMessageKey;
                });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: _selectedKey == _directMessageKey ? BorderRadius.circular(16) : BorderRadius.circular(28),
                color: _selectedKey == _directMessageKey ? Color(0xff7289da) : Color(0xff363940),
              ),
              width: 45,
              height: 45,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/direct-message.png",
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Divider(
            height: 22,
            color: Colors.white38,
            indent: 22,
            endIndent: 22,
          ),
          Column(
            children: List.generate(3, (index) => ServerData("id$index", "name$index", List.empty())).map((serverData) {
              var serverKey = ValueKey(serverData.id);
              var serverItem = ServerItem(
                key: serverKey,
                data: serverData,
                isSelected: _selectedKey == serverKey,
                onSelected: (key) {
                  if (key != _selectedKey)
                    setState(() {
                      _selectedKey = key;
                    });
                },
              );

              return LongPressDraggable<ServerData>(
                data: serverData,
                feedback: serverItem,
                childWhenDragging: Container(),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: serverItem,
                ),
              );
            }).toList(),
          ),
          MaterialButton(
            key: _directMessageKey,
            padding: EdgeInsets.all(0),
            minWidth: 0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            visualDensity: VisualDensity.compact,
            onPressed: () {
              print("Add Pressed");
              if (this._selectedKey != _directMessageKey)
                setState(() {
                  this._selectedKey = _directMessageKey;
                });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(0xff363940),
              ),
              width: 45,
              height: 45,
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/search.png",
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DirectMessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Color(0xff2c2f33),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Direct Message",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Image(height: 18, image: AssetImage("assets/direct-message.png"))
                ],
              ),
            ),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: Color(0xff202225), borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      minLines: 1,
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 10,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Find or start a conversation",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/search.png",
                    height: 15,
                  )
                ],
              ),
            ),
            Flexible(
              child: BlocBuilder(
                  bloc: context.read<DirectMessageBloc>(),
                  builder: (c, state) {
                    if (state is DirectMessageLoadAllSuccess)
                      return Container(
                        margin: EdgeInsets.only(top: 15),
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Divider(height: 5);
                            },
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return DirectMessageItem("randomId", "Random User", UserStatus("emoji", "Working on stuff~2qqqqqqq"));
                            }),
                      );
                    else
                      return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
