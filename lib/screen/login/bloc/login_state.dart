part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final bool isLoading;

  const LoginState({
    required this.email,
    required this.password,
    required this.isLoading,
  });

  const LoginState.initial({
    this.email = "",
    this.password = "",
    this.isLoading = false,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
