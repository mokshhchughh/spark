part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthLoggedInEvent extends AuthEvent {
  const AuthLoggedInEvent(this.user);

  final User user;
}
