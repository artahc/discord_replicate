import 'package:discord_replicate/application/config/icon_constants.dart';
import 'package:discord_replicate/application/logger/app_logger.dart';
import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/bloc/routes/route_generator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  late NavigationCubit _navBloc = BlocProvider.of<NavigationCubit>(context);
  late AuthBloc _authBloc = BlocProvider.of(context);

  @override
  void initState() {
    _authBloc.add(AuthEvent.initialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) async {
        state.whenOrNull(
          unauthenticated: () {
            _navBloc.pushNamedAndRemoveUntil(context, Routes.welcome, (route) => false, true);
          },
          authenticated: (user) {
            _navBloc.pushNamedAndRemoveUntil(context, Routes.landing, (route) => false, true);
          },
          error: (e) {
            log.e("Error loading user in splash screen", e);
            _navBloc.pushNamedAndRemoveUntil(context, Routes.welcome, (route) => false, true);
          },
        );
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
