import 'dart:async';

import 'package:discord_replicate/presentation/bloc/authentication/auth_bloc.dart';
import 'package:discord_replicate/presentation/bloc/routes/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'navigation_state.dart';

@Injectable()
class NavigationCubit extends Cubit<NavigationState> {
  final AuthBloc _authBloc;
  final GlobalKey<NavigatorState> _navigator;

  late StreamSubscription _authStateSubscription;

  NavigationCubit(
    @factoryParam this._authBloc,
    @factoryParam this._navigator,
  ) : super(const NavigationState.initialState()) {
    _authStateSubscription = _authBloc.stream.listen((event) {
      event.whenOrNull(
        unauthenticated: () {
          _navigator.currentState?.pushNamed(Routes.welcome);
        },
      );
    });
  }

  @override
  Future<void> close() async {
    _authStateSubscription.cancel();
    super.close();
  }

  push(BuildContext context, Route<dynamic> route, bool useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).push(route).whenComplete(() {});
  }

  pushNamed(BuildContext context, String route, bool useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).pushNamed(route).whenComplete(() {});
  }

  pushNamedAndRemoveUntil(context, route, predicate, useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).pushNamedAndRemoveUntil(route, predicate).whenComplete(() {});
  }

  pop(context, useRoot) async {
    Navigator.of(context, rootNavigator: useRoot).pop();
  }
}
