part of 'login_cubit.dart';

enum LoginStateStatus { initial, loading, success, error }

class LoginState extends Equatable {
  const LoginState({
    this.loginStateStatus = LoginStateStatus.initial,
    this.user,
  });

  final LoginStateStatus loginStateStatus;
  final BaseUser? user;

  LoginState copyWith({
    LoginStateStatus? loginStateStatus,
    BaseUser? user,
  }) {
    return LoginState(
      loginStateStatus: loginStateStatus ?? this.loginStateStatus,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [loginStateStatus, user];
}
