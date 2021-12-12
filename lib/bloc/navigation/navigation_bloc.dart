import 'dart:developer';
import 'package:discord_replicate/bloc/navigation/navigation_event.dart';
import 'package:discord_replicate/bloc/navigation/navigation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initialState());

  Stream<NavigationState> _initial() async* {}

  Stream<NavigationState> _push(BuildContext context, Route<dynamic> route, bool useRoot) async* {
    Navigator.of(context, rootNavigator: useRoot).push(route).whenComplete(() {
      log("Push complete at ${route.toString()}", name: this.runtimeType.toString());
    });
  }

  Stream<NavigationState> _pushNamed(BuildContext context, String route, bool useRoot) async* {
    Navigator.of(context, rootNavigator: useRoot).pushNamed(route).whenComplete(() {
      log("Push named complete at route $route", name: this.runtimeType.toString());
    });
  }

  Stream<NavigationState> _pushNamedAndRemoveUntil(context, route, predicate, useRoot) async* {
    Navigator.of(context, rootNavigator: useRoot).pushNamedAndRemoveUntil(route, predicate).whenComplete(() {
      log("Push named  and remove until complete at route $route", name: this.runtimeType.toString());
    });
  }

  Stream<NavigationState> _pop(context, useRoot) async* {
    Navigator.of(context, rootNavigator: useRoot).pop();
    log("Pop complete at route.", name: this.runtimeType.toString());
  }

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    yield* event.when(
      initialEvent: _initial,
      push: _push,
      pushNamed: _pushNamed,
      pushNamedAndRemoveUntil: _pushNamedAndRemoveUntil,
      pop: _pop,
    );
  }
}
