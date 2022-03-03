import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyLandingPanel extends StatefulWidget {
  const EmptyLandingPanel({Key? key}) : super(key: key);

  @override
  State<EmptyLandingPanel> createState() => _EmptyLandingPanelState();
}

class _EmptyLandingPanelState extends State<EmptyLandingPanel> {
  late ServerBloc _serverBloc = BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("Nothing's interesting in your account."),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                child: Text("Join Testing Server"),
                onPressed: () {
                  _serverBloc.add(ServerEvent.joinServer(""));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
