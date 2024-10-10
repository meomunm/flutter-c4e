part of 'login_bloc.dart';

abstract class LoginEvent {}

class RequestLoginEvent extends LoginEvent {
  final Function() onFinish;

  RequestLoginEvent({
    required this.onFinish,
  });
}