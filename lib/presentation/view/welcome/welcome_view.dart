import 'package:discord_replicate/common/app_icon.dart';

import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:discord_replicate/presentation/route_transition/app_transition.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_view.dart';
import 'register_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navBloc = BlocProvider.of<NavigationCubit>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                width: 220,
                child: Center(
                  child: Image.asset(AppIcons.discord_text_icon),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "Welcome to Discord",
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
              ),
              Text(
                "Join over 100 million people who use Discord to talk with communities and friends.",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      height: 2,
                    ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              AppButton(
                child: Text("Register"),
                onPressed: () {
                  var route = CustomSlideTransition(currentPage: this, nextPage: const RegisterView());
                  navBloc.push(context, route, true);
                },
              ),
              SizedBox(
                height: 10,
              ),
              AppButton(
                color: Theme.of(context).buttonTheme.colorScheme!.secondary,
                child: Text("Login"),
                onPressed: () {
                  var route = CustomSlideTransition(currentPage: this, nextPage: const LoginView());
                  navBloc.push(context, route, true);
                },
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}