import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    dev.log("Init splash screen", name: this.runtimeType.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is AuthStateSignedIn) {
          // Navigator.of(context).pushReplacementNamed(Routes.LandingRoute);
        } else if (state is AuthStateSignedOut) {
          // Navigator.of(context).pushReplacementNamed(Routes.WelcomeRoute);
        }
      },
      child: SizedBox.expand(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxHeight: 200, maxWidth: 200),
              child: ImageIcon(
                AssetImage(AppIcons.discord_icon),
                size: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
