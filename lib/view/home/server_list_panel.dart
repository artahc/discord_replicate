import 'dart:async';
import 'dart:developer';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/bloc/user/user_event.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
import 'package:discord_replicate/model/server.dart';
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
  List<Server> _serverList = const <Server>[];
  Server? _selectedServer;

  void _select(Server? value) {
    setState(() {
      this._selectedServer = value;
    });
  }

  void _setServers(List<Server> servers) {
    setState(() {
      this._serverList = servers;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(
          listener: (_, state) {
            state.whenOrNull(
              loadLocalUserSuccess: (user) {
                _setServers(user.servers);
              },
            );
          },
        ),
      ],
      child: Container(
        width: 70,
        alignment: Alignment.topCenter,
        child: CustomListView<Server>(
          elements: _serverList,
          itemBuilder: (_, server, index) {
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
          beforeListWidget: [
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150),
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
        ),
      ),
    );
  }
}
