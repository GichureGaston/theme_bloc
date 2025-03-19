part of 'login_bloc.dart';

enum LoginStatus { success, failure, loading, submitted, login }

class LoginState extends Equatable {
  const LoginState({
    required this.message,
    required this.email,
    required this.password,
    this.status = LoginStatus.loading,
  });

  final String message;
  final String email;

  final String password;

  final LoginStatus status;

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
        message: message ?? this.message,
        email: message ?? this.email,
        password: password ?? this.password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [message, status, email, password];
}
