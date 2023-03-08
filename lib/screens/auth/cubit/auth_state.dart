// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

enum AuthStatus {
  success,
  failure,
  loading,
}

class AuthState extends Equatable {
  final String message;
  final AuthStatus status;
  final String email;
  const AuthState(
    this.message,
    this.status,
    this.email,
  );

  @override
  List<Object> get props => [message, status, email];
}
