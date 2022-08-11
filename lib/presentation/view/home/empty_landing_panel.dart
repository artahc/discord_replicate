import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyLandingPanel extends StatefulWidget {
  const EmptyLandingPanel({Key? key}) : super(key: key);

  @override
  State<EmptyLandingPanel> createState() => _EmptyLandingPanelState();
}

class _EmptyLandingPanelState extends State<EmptyLandingPanel> {
  late final ServerBloc _serverBloc = BlocProvider.of(context);
  late final AuthBloc _authBloc = BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text("You are not a member of any server."),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    AppButton(
                      margin: const EdgeInsets.all(8),
                      child: const Text("Join Testing Server"),
                      onPressed: () {
                        _serverBloc.add(const ServerEvent.joinServer("XE4yhAIsvuZvxwOFrSyq"));
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AppButton(
                      margin: const EdgeInsets.all(8),
                      child: const Text("Log Out"),
                      color: Colors.red,
                      onPressed: () {
                        _authBloc.add(const AuthEvent.signOut());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
