import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';
import 'package:discord_replicate/presentation/constants/icon_constants.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/presentation/bloc/direct_message/direct_message_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/widgets/custom_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'server_tile.dart';

class ServerListPanel extends StatefulWidget {
  const ServerListPanel({Key? key}) : super(key: key);

  @override
  State<ServerListPanel> createState() => _ServerListPanelState();
}

class _ServerListPanelState extends State<ServerListPanel> {
  Server? _selectedServer;

  @override
  Widget build(BuildContext context) {
    final ServerBloc serverBloc = BlocProvider.of(context);
    final DirectMessageBloc dmBloc = BlocProvider.of(context);

    return Container(
      width: 70,
      alignment: Alignment.topCenter,
      child: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
        final servers = state.maybeWhen(
          orElse: () => <Server>[],
          loaded: (user) => user.servers,
        );

        return CustomListView<Server>(
          elements: servers,
          before: [
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: _selectedServer != null ? BorderRadius.circular(28) : BorderRadius.circular(16),
                  color:
                      _selectedServer != null ? Color(0xff363940) : Theme.of(context).buttonTheme.colorScheme!.primary,
                ),
                width: 45,
                height: 45,
                child: MaterialButton(
                  padding: EdgeInsets.all(0),
                  minWidth: 0,
                  splashColor: Colors.transparent,
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    setState(() {
                      this._selectedServer = null;
                      dmBloc.add(DirectMessageEvent.loadRecent());
                    });
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
                setState(() {
                  this._selectedServer = server;
                  print(server);
                  serverBloc.add(ServerEvent.loadServer(server.id));
                });
              },
              selected: this._selectedServer?.id == server.id,
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
        );
      }),
    );
  }
}
