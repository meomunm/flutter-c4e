import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<RequestLoginEvent>(_onRequestLoginEvent);
  }

  FutureOr<void> _onRequestLoginEvent(RequestLoginEvent event, Emitter<LoginState> emitter) async {
    print("On change new state");
    emitter(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 3));
    event.onFinish.call();
  }
}