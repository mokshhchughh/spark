import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitialState(null)) {
    on<AuthEvent>((event, emit) {});

    on<AuthLoggedInEvent>((event, emit) {
      emit(AuthLoggedInState(event.user));
    });
  }
}
