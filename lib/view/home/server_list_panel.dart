import 'dart:async';
import 'package:discord_replicate/model/server_data.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/view/home/server_tile.dart';
import 'package:discord_replicate/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerListPanel extends StatefulWidget {
  @override
  _ServerListPanelState createState() => _ServerListPanelState();
}

class _ServerListPanelState extends State<ServerListPanel> {
  final String _directMessageId = "direct-message";
  late ServerBloc _serverBloc = BlocProvider.of<ServerBloc>(context);
  StreamController<String> _activeItemController = StreamController();

  @override
  void initState() {
    _serverBloc.add(ServerEvent.loadServerList());
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
      child: StreamBuilder<String>(
        stream: _activeItemController.stream,
        initialData: _directMessageId,
        builder: (context, snapshot) {
          return BlocBuilder<ServerBloc, ServerState>(builder: (context, state) {
            var serverList = const <ServerData>[];
            if (state is ServerStateLoadListSuccess) {
              serverList = state.serverList;
            }
            return CustomListView<ServerData>(
              elements: serverList,
              itemBuilder: (_, serverData, index) {
                return ServerTile(
                  key: ValueKey(serverData.id),
                  serverData: serverData,
                  onPressed: () {
                    _activeItemController.sink.add(serverData.id);
                    _serverBloc.add(ServerLoadSelectedEvent(serverData));
                  },
                  selected: snapshot.data == serverData.id,
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
              beforeListWidget: [
                Center(
                  child: AnimatedContainer(
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
                          AppIcons.direct_message_icon,
                          height: 20,
                          color: Colors.white,
                        ),
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
              ],
              afterListWidget: [
                Center(
                  child: Container(
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
                      icon: ImageIcon(AssetImage(AppIcons.search_icon)),
                      visualDensity: VisualDensity.compact,
                      iconSize: 20,
                    ),
                  ),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}
