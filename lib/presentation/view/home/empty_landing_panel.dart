import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/server/server_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SvgPicture.asset("assets/icons/waiting-illustration.svg"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25),
              child: Text(
                "You are not a member of any server.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IntrinsicHeight(
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).buttonTheme.colorScheme!.primary,
                      ),
                      child: const Center(
                        child: Text(
                          "Join Testing Server",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      _serverBloc.add(const ServerEvent.joinServer("XE4yhAIsvuZvxwOFrSyq"));
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      _authBloc.add(const AuthEvent.signOut());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
