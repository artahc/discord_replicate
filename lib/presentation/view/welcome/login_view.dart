import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/navigation/navigation_cubit.dart';
import 'package:discord_replicate/presentation/bloc/routes/route_generator.dart';
import 'package:discord_replicate/presentation/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _identityCtrl = TextEditingController();
  late final TextEditingController _passwordCtrl = TextEditingController();

  late final AuthBloc _authBloc = BlocProvider.of<AuthBloc>(context);
  late final NavigationCubit _navBloc = BlocProvider.of<NavigationCubit>(context);

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
    _authBloc.add(AuthEvent.signIn(id: id, password: password));
  }

  void _onAuthenticated() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _navBloc.pushNamedAndRemoveUntil(context, Routes.landing, (route) => false, true);
    });
  }

  void _signOut() {
    _navBloc.pop(context, true);
    _authBloc.add(const AuthEvent.signOut());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (_, state) {
        state.whenOrNull(
          error: (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text("$e"),
              ),
            );
          },
          authenticated: (credential) {
            _onAuthenticated();
          },
        );
      },
      builder: (_, state) {
        return state.maybeWhen(
          authenticating: () {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          },
          orElse: () {
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
                    icon: const Icon(Icons.arrow_back),
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
                    SizedBox(
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
                        obscureText: true,
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
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
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
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(letterSpacing: -0.2, color: Colors.lightBlue),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    AppButton(
                      margin: const EdgeInsets.only(top: 15),
                      onPressed: _signIn,
                      child: const Text("Login"),
                    ),
                    DropdownButton(
                      dropdownColor: Colors.deepOrange,
                      underline: Container(),
                      isExpanded: true,
                      value: _identityCtrl.text,
                      hint: const Text("Select account"),
                      items: <Tuple2<String, String>>[
                        const Tuple2("artahc@gmail.com", "artahc123"),
                        const Tuple2("artahace@gmail.com", "artahc123123"),
                        const Tuple2("test@test.t", "test123"),
                        const Tuple2("test2@gmail.com", "password"),
                        const Tuple2("test17@gmail.com", "password"),
                      ].map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          child: Text(e.item1),
                          value: e.item1,
                          onTap: () {
                            setState(() {
                              _identityCtrl.text = e.item1;
                              _passwordCtrl.text = e.item2;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (value) {
                        print("$value");
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
