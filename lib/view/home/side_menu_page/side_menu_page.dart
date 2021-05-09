import 'package:discord_ui_practice/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/bloc/direct_message/direct_message_event.dart';
import 'package:discord_ui_practice/model/server_data.dart';
import 'package:discord_ui_practice/static/style.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/direct_message_item.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/group_server_item.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/group_server_item.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/grouppable_container.dart';
import 'package:discord_ui_practice/view/home/side_menu_page/server_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
    _selectedKey = _directMessageKey;
  }

  @override
  Widget build(BuildContext context) {
    List<ServerData> _data = [
      SingleServerData("id1", "single1", List.empty()),
      SingleServerData("id2", "single2", List.empty()),
      GroupServerData([
        SingleServerData("id3", "group3", List.empty()),
        SingleServerData("id4", "group4", List.empty()),
        // SingleServerData("id5", "group5", List.empty()),
        // SingleServerData("id6", "group6", List.empty()),
        // SingleServerData("id7", "group7", List.empty()),
        // SingleServerData("id8", "group8", List.empty()),
        // SingleServerData("id9", "group9", List.empty()),
        // SingleServerData("id10", "group10", List.empty()),
        // SingleServerData("id11", "group11", List.empty()),
      ]),
    ];

    return Container(
      width: 70,
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10, bottom: 65),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 150),
              decoration: BoxDecoration(
                borderRadius: _selectedKey == _directMessageKey ? BorderRadius.circular(16) : BorderRadius.circular(28),
                color: _selectedKey == _directMessageKey ? Color(0xff7289da) : Color(0xff363940),
              ),
              width: 45,
              height: 45,
              child: MaterialButton(
                key: _directMessageKey,
                padding: EdgeInsets.all(0),
                minWidth: 0,
                splashColor: Colors.transparent,
                // highlightColor: Colors.transparent,
                visualDensity: VisualDensity.compact,
                onPressed: () {},
                child: Container(
                  child: Image.asset(
                    "assets/direct-message.png",
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Divider(
              key: ValueKey("dm-divider"),
              color: Colors.white38,
              height: 22,
              indent: 22,
              endIndent: 22,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: _data.length,
              separatorBuilder: (_, index) => SizedBox(height: Style.serverItemSpacing),
              itemBuilder: (_, index) {
                if (_data[index] is SingleServerData) {
                  var serverItem = ServerItem(data: _data[index]);
                  return GroupableContainer(
                    initialServerItem: ServerItem(data: _data[index]),
                    avatarWhenGroupPreview: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xff7289da),
                          borderRadius: BorderRadius.circular(26)
                      ),
                    ),
                  );
                } else {
                  return GroupServerItem(
                    children: (_data[index] as GroupServerData).serverData.map((e) => ServerItem(data: (e))).toList(),
                  );
                }
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Color(0xff363940),
              ),
              width: 45,
              height: 45,
              child: MaterialButton(
                minWidth: 0,
                splashColor: Colors.transparent,
                // highlightColor: Colors.transparent,
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  print("Add Pressed");
                },
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
                              return DirectMessageItem(
                                  "randomId", "Random User", UserStatus("emoji", "Working on stuff~2qqqqqqq"));
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
