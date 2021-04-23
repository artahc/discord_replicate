import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ConnectivityEvent {}

class ConnectivityInitiate extends ConnectivityEvent {}

class ConnectivityCheck extends ConnectivityEvent {}

abstract class ConnectivityState {}

class ConnectivityInitialState extends ConnectivityState {}

class ConnectivityConnected extends ConnectivityState {
  final bool a;
  ConnectivityConnected(this.a);
}

class ConnectivityNotAvailable extends ConnectivityState {}

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription<ConnectivityResult> _connectivityStream;

  ConnectivityBloc() : super(ConnectivityInitialState());

  Future<void> _handleConnectivityResult(ConnectivityResult event) async {
    if (event == ConnectivityResult.none) {
      emit(ConnectivityNotAvailable());
    } else if (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi) {
      emit(ConnectivityConnected(event == ConnectivityResult.none));
    }
  }

  @override
  Stream<ConnectivityState> mapEventToState(ConnectivityEvent event) async* {
    if (event is ConnectivityInitiate) {
      await Connectivity().checkConnectivity().then(_handleConnectivityResult);
      _connectivityStream = Connectivity().onConnectivityChanged.listen(_handleConnectivityResult);
    }
  }
}
