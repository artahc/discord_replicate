import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_event.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:discord_replicate/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _identityCtrl = TextEditingController();
  late TextEditingController _passwordCtrl = TextEditingController();
  late AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
  late NavigationBloc _navBloc = BlocProvider.of<NavigationBloc>(context);

  @override
  void initState() {
    super.initState();
    _identityCtrl.text = "artahc@gmail.com";
    _passwordCtrl.text = "artahc123";
  }

  @override
  void dispose() {
    _identityCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _signIn() {
    var id = _identityCtrl.text;
    var password = _passwordCtrl.text;
    _authBloc.add(AuthEvent.signInEvent(id: id, password: password));
  }

  void _signOut() {
    _navBloc.add(NavigationEvent.pop(context, true));
    _authBloc.add(AuthEvent.signOutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: _authBloc,
        listener: (_, state) {
          if (state is AuthStateSignedIn) {
            SchedulerBinding.instance?.addPostFrameCallback((_) {
              _navBloc.add(NavigationEvent.pushNamedAndRemoveUntil(context, Routes.landing, (route) => false, true));
            });
          }
        },
        builder: (_, state) {
          if (state is AuthStateSigningIn)
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          else
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: SizedBox(
                  width: 45,
                  height: 45,
                  child: IconButton(
                    splashRadius: 20,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      _signOut();
                    },
                  ),
                ),
              ),
              body: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Welcome back!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "We're so excited to see you again!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              letterSpacing: 0.5,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AppInputField(
                        controller: _identityCtrl,
                        margin: const EdgeInsets.only(top: 28),
                        labelText: "Email or Phone Number",
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AppInputField(
                        controller: _passwordCtrl,
                        margin: const EdgeInsets.only(top: 12),
                        labelText: "Password",
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Align(
                        child: Text(
                          "Forgot your password?",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.caption!.copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        child: Text(
                          "Use a password manager?",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.caption!.copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    AppMaterialButton(
                      margin: const EdgeInsets.only(top: 15),
                      onPressed: _signIn,
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            );
        });
  }
}
