import 'dart:async';

import 'package:discord_ui_practice/data/model/server_data.dart';
import 'package:discord_ui_practice/domain/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_ui_practice/domain/bloc/direct_message/direct_message_event.dart';
import 'package:discord_ui_practice/domain/bloc/direct_message/direct_message_state.dart';
import 'package:discord_ui_practice/domain/bloc/server/server_bloc.dart';
import 'package:discord_ui_practice/domain/bloc/server/server_event.dart';
import 'package:discord_ui_practice/domain/bloc/server/server_state.dart';
import 'package:discord_ui_practice/external/app_theme.dart';
import 'package:discord_ui_practice/presentation/view/home/side_menu_page/direct_message_item.dart';
import 'package:discord_ui_practice/presentation/view/home/side_menu_page/server_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        // SizedBox(width: MediaQuery.of(context).size.width * 0.130),
      ],
    );
  }
}

class _ServerList extends StatefulWidget {
  @override
  _ServerListState createState() => _ServerListState();
}

class _ServerListState extends State<_ServerList> {
  final String _directMessageId = "direct-message";
  late ServerBloc _serverBloc;
  StreamController<String> _activeItemController = StreamController();

  @override
  void initState() {
    _serverBloc = BlocProvider.of<ServerBloc>(context)..add(ServerListLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    _activeItemController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(top: 10, bottom: 65),
        scrollDirection: Axis.vertical,
        child: StreamBuilder<String>(
          stream: _activeItemController.stream,
          initialData: _directMessageId,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                    borderRadius: snapshot.data == _directMessageId ? BorderRadius.circular(16) : BorderRadius.circular(28),
                    color: snapshot.data == _directMessageId ? Color(0xff7289da) : Color(0xff363940),
                  ),
                  width: 45,
                  height: 45,
                  child: MaterialButton(
                    padding: EdgeInsets.all(0),
                    minWidth: 0,
                    splashColor: Colors.transparent,
                    // highlightColor: Colors.transparent,
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      _activeItemController.sink.add(_directMessageId);
                    },
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
                  color: Colors.white38,
                  height: 22,
                  indent: 22,
                  endIndent: 22,
                ),
                BlocBuilder<ServerBloc, ServerState>(
                  bloc: _serverBloc,
                  builder: (c, state) {
                    if (state is ServerListInitial)
                      return Container();
                    else if (state is ServerListLoaded)
                      return Wrap(
                        children: state.serverData.map((data) {
                          return ServerItem(
                            key: ValueKey(data.id),
                            serverData: data,
                            onPressed: () {
                              _activeItemController.sink.add(data.id);
                              _serverBloc.add(ServerLoadSelectedEvent(data));
                            },
                            selected: snapshot.data == data.id,
                          );
                        }).toList(),
                        direction: Axis.vertical,
                        spacing: 10,
                      );
                    else
                      return Container();
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xff363940),
                  ),
                  width: 45,
                  height: 45,
                  child: IconButton(
                    onPressed: () {
                      print("Add Pressed");
                    },
                    icon: ImageIcon(AssetImage("assets/search.png")),
                    visualDensity: VisualDensity.compact,
                    iconSize: 20,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _DirectMessageList extends StatefulWidget {
  @override
  _DirectMessageListState createState() => _DirectMessageListState();
}

class _DirectMessageListState extends State<_DirectMessageList> {
  late DirectMessageBloc _directMessageBloc;

  @override
  void initState() {
    _directMessageBloc = BlocProvider.of<DirectMessageBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(right: (MediaQuery.of(context).size.width * 0.125) + 5),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
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
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ImageIcon(
                    AssetImage("assets/direct-message.png"),
                    size: 18,
                  ),
                  // Image(height: 18, image: AssetImage("assets/direct-message.png"))
                ],
              ),
            ),
            Container(
              height: 30,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      minLines: 1,
                      style: Theme.of(context).textTheme.subtitle1,
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Find or start a conversation",
                        hintStyle: Theme.of(context).accentTextTheme.subtitle1,
                      ),
                    ),
                  ),
                  ImageIcon(AssetImage("assets/search.png")),
                ],
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: BlocBuilder<DirectMessageBloc, DirectMessageState>(
                    bloc: _directMessageBloc,
                    builder: (context, state) {
                      return Column(
                        children: [
                          DirectMessageItem(
                            id: "randomId",
                            title: "Random User",
                            status: UserStatus("emoji", "Working on stuff~2qqqqqqq"),
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
