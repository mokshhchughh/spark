part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState(this.user);

  final User? user;

  @override
  List<Object> get props => [];
}

final class AuthInitialState extends AuthState {
  const AuthInitialState(super.user);

  @override
  List<Object> get props => [user!];
}

final class AuthLoggedInState extends AuthState {
  const AuthLoggedInState(super.user);

  @override
  List<Object> get props => [user!];
}
