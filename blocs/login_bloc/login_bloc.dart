import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required AuthService authService})
      : authService = authService,
        super(const LoginState(
            message: message, email: email, password: password)) {
    on<LoginEmailChangedEvent>();
    on<LoginButtonPressedEvent>();
    on<LoginPasswordChangedEvent>();
    final AuthService authService;

    Future<void> _handleLoginEmailChangedEvent(
      LoginEmailChangedEvent event,
      Emitter<LoginState> emit,
    ) async {
      emit(state.copyWith(password: event.email));
      emit(state.copyWith(message: 'Loading', status: LoginStatus.loading));
    }

    Future<void> _handleLoginPasswordChangedEvent(
        LoginPasswordChangedEvent event, Emitter<LoginState> emit) async {
      emit(state.copyWith(password: event.password));
      emit(state.copyWith(message: 'Loading', status: LoginStatus.loading));
    }

    ;
    Future<void> _handleLoginWithEmailAndPasswordEvent(
        LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
      try {
        emit(state.copyWith(message: 'Success', status: LoginStatus.submitted));
        var credentialState = await authService.signInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        if (credentialState?.code == "OK") {
          emit(state.copyWith(message: 'Success'));
        } else if (credentialState?.code == "Unauthorized") {
          emit(state.copyWith(
              message: "Wrong Credentials", status: LoginStatus.failure));
        } else {
          emit(state.copyWith(
              message: "Wrong Credentials", status: LoginStatus.failure));
        }
      } catch (e) {
        emit(
            state.copyWith(message: e.toString(), status: LoginStatus.failure));
      }
    }
  }
}
