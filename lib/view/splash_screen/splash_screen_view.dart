import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/external/app_icon.dart';
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
        if (state is AuthStateSignedIn) {
          _navBloc.pushNamed(context, Routes.landing, true);
        } else if (state is AuthStateSignedOut) _navBloc.pushNamedAndRemoveUntil(context, Routes.welcome, (route) => false, true);
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
