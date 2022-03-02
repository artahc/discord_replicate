import 'package:discord_replicate/presentation/bloc/user/user_bloc.dart';
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
  late UserBloc _userBloc = BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Nothing to do in your account."),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  child: Text("Join Testing Server"),
                  onPressed: () {
                    _userBloc.add(UserEvent.joinServer(serverId: "serverId"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}