import 'dart:async';
import 'package:discord_replicate/domain/bloc/server/server_bloc.dart';
import 'package:discord_replicate/domain/bloc/server/server_event.dart';
import 'package:discord_replicate/domain/bloc/server/server_state.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/view/home/server_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerListPanel extends StatefulWidget {
  @override
  _ServerListPanelState createState() => _ServerListPanelState();
}

class _ServerListPanelState extends State<ServerListPanel> {
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
                        AppIcon.direct_message_icon,
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
                    icon: ImageIcon(AssetImage(AppIcon.search_icon)),
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
