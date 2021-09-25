import 'package:discord_replicate/domain/route_generator.dart';
import 'package:discord_replicate/external/app_icon.dart';
import 'package:discord_replicate/presentation/view/welcome/login_view.dart';
import 'package:discord_replicate/presentation/view/welcome/register_view.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(AppIcon.discord_text_icon),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "Welcome to Discord",
                style: Theme.of(context).textTheme.headline5!.copyWith(
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
              AppMaterialButton(
                child: Text("Register"),
                onPressed: () {
                  print("Register");
                  Navigator.of(context).push(CustomSlideTransition(currentPage: this, nextPage: const RegisterView()));
                },
              ),
              SizedBox(
                height: 10,
              ),
              AppMaterialButton(
                color: Theme.of(context).buttonTheme.colorScheme!.secondary,
                child: Text("Login"),
                onPressed: () {
                  print("Login");
                  Navigator.of(context).push(CustomSlideTransition(currentPage: this, nextPage: const LoginView()));
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
