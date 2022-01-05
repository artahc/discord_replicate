import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/bloc/user/user_bloc.dart';
import 'package:discord_replicate/bloc/user/user_state.dart';
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
    return BlocListener<UserBloc, UserState>(
      listener: (_, state) async {
        state.maybeWhen(
          loadUserSuccess: (user) {
            _navBloc.pushNamedAndRemoveUntil(context, Routes.landing, (route) => false, true);
          },
          orElse: () {
            // _navBloc.pushNamedAndRemoveUntil(context, Routes.welcome, (route) => false, true);
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
