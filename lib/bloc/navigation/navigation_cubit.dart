import 'dart:async';
import 'dart:developer';
import 'package:discord_replicate/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/bloc/navigation/navigation_state.dart';
import 'package:discord_replicate/routes/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  AuthBloc _authBloc;
  late StreamSubscription _authStateSubscription;

  NavigationCubit({required GlobalKey<NavigatorState> navigator, required AuthBloc authBloc})
      : _authBloc = authBloc,
        super(NavigationState.initialState()) {
    _authStateSubscription = _authBloc.stream.listen((event) {
      event.whenOrNull(
        signedOut: () {
          navigator.currentState?.pushNamed(Routes.welcome);
        },
      );
    });
  }

  push(BuildContext context, Route<dynamic> route, bool useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).push(route).whenComplete(() {
      log("Push complete at ${route.toString()}", name: this.runtimeType.toString());
    });
  }

  pushNamed(BuildContext context, String route, bool useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).pushNamed(route).whenComplete(() {
      log("Push named complete at route $route", name: this.runtimeType.toString());
    });
  }

  pushNamedAndRemoveUntil(context, route, predicate, useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).pushNamedAndRemoveUntil(route, predicate).whenComplete(() {
      log("Push named  and remove until complete at route $route", name: this.runtimeType.toString());
    });
  }

  pop(context, useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).pop();
    log("Pop complete at route.", name: this.runtimeType.toString());
  }
}
