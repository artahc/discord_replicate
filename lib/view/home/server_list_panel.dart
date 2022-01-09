import 'dart:async';
import 'dart:developer';
import 'dart:math';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/bloc/room/room_bloc.dart';
import 'package:discord_replicate/bloc/room/room_event.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/model/channel.dart';
import 'package:discord_replicate/model/server.dart';
import 'package:discord_replicate/bloc/server/server_bloc.dart';
import 'package:discord_replicate/bloc/server/server_event.dart';
import 'package:discord_replicate/bloc/server/server_state.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/model/user.dart';
import 'package:discord_replicate/view/home/server_tile.dart';
import 'package:discord_replicate/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerListPanel extends StatefulWidget {
  final List<Server> servers;

  const ServerListPanel({Key? key, this.servers = const <Server>[]}) : super(key: key);

  @override
  _ServerListPanelState createState() => _ServerListPanelState();
}

class _ServerListPanelState extends State<ServerListPanel> {
  Server? _selectedServer;

  late ServerBloc _serverBloc;
  late DirectMessageBloc _dmBloc;

  @override
  void initState() {
    super.initState();

    _serverBloc = BlocProvider.of<ServerBloc>(context);
    _dmBloc = BlocProvider.of<DirectMessageBloc>(context);
  }

  void _select(Server? server) {
    if (server != null)
      _serverBloc.add(ServerEvent.loadServer(server.id));
    else
      _dmBloc.add(DirectMessageEvent.load("someid"));

    setState(() {
      this._selectedServer = server;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      alignment: Alignment.topCenter,
      child: CustomListView<Server>(
        elements: widget.servers,
        before: [
          Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: _selectedServer == null ? BorderRadius.circular(16) : BorderRadius.circular(28),
                color: _selectedServer == null ? Theme.of(context).buttonTheme.colorScheme!.primary : Color(0xff363940),
              ),
              width: 45,
              height: 45,
              child: MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                splashColor: Colors.transparent,
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  _select(null);
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
        builder: (_, server, index) {
          return ServerTile(
            key: ValueKey(server.id),
            data: server,
            onPressed: () {
              _select(server);
            },
            selected: _selectedServer != null && _selectedServer!.id == server.id,
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 5,
        ),
        after: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xff363940),
              ),
              width: 45,
              height: 45,
              child: IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage(AppIcons.search_icon)),
                visualDensity: VisualDensity.compact,
                iconSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
