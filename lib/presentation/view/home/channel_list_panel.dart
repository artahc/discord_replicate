import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/domain/model/channel.dart';
import 'package:discord_replicate/domain/model/server.dart';
import 'package:discord_replicate/presentation/bloc/channel/channel_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:discord_replicate/presentation/widgets/custom_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServerChannelListPanel extends StatelessWidget {
  const ServerChannelListPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChannelBloc channelBloc = BlocProvider.of(context);
    final ServerBloc serverBloc = BlocProvider.of(context);

    return Flexible(
      child: Container(
        margin: EdgeInsets.only(right: (MediaQuery.of(context).size.width * 0.125) + 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: BlocBuilder<ServerBloc, ServerState>(
            bloc: serverBloc,
            builder: (_, state) {
              return state.maybeWhen(orElse: () {
                log.w("Received server state >>> $state");
                return Text("TBD");
              }, loaded: (server, recentChannel) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              server.name,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: CustomListView<Channel>(
                          elements: server.channels,
                          builder: (_, channel, __) {
                            return ServerChannelTile(channel: channel);
                          },
                          before: [
                            AppButton(
                              margin: const EdgeInsets.all(20),
                              color: Theme.of(context).buttonTheme.colorScheme?.onSecondary,
                              size: const Size(double.infinity, 35),
                              child: Text(
                                "Invite Members",
                                style: Theme.of(context).textTheme.button,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              });
            }),
      ),
    );
  }
}

class ServerChannelTile extends StatelessWidget {
  final Channel channel;

  const ServerChannelTile({Key? key, required this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Icon(Icons.grid_3x3_rounded),
          ),
          Text(
            channel.name,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
