import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/features/home/view/home_screen.dart';
import 'package:atik/model/user.dart';
import 'package:atik/service/login_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final _secureStorage = getIt<SecureStorage>();
  final LoginService _loginService = LoginService();

  Future<void> onLogin(
      {required BuildContext context,
      required String user,
      required String password}) async {
    emit(const LoginState(loginStateStatus: LoginStateStatus.loading));
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final _user =
          await _loginService.loginUser(user: user, password: password);
      if (_user.status == "success") {
        if (_user.message == "Login Failed") {
          final snackBar = SnackBar(
            content: const Text('Hatalı Giriş'),
            action: SnackBarAction(
              label: 'Tamam',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          if (_user.data.auth == "4" || _user.data.auth == "5") {
            if (_user.data.active == "1") {
              await Future.wait([
                _secureStorage.storeKey(key: 'userId', value: _user.data.id),
                _secureStorage.storeKey(
                  key: 'municipalityId',
                  value: _user.data.municipalityId,
                ),
                _secureStorage.storeKey(
                  key: 'companyId',
                  value: _user.data.companyId,
                ),
                _secureStorage.storeKey(
                    key: 'location', value: _user.data.location),
              ]);
              emit(LoginState(
                  loginStateStatus: LoginStateStatus.success,
                  user: _user.data));

              Future.delayed(const Duration(milliseconds: 200), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  // ignore: inference_failure_on_instance_creation
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                  (Route<dynamic> route) => false,
                );
              });
            } else if (_user.data.active == "0") {
              final snackBar = SnackBar(
                content: const Text('Hesabınız pasif hale gelmiştir.'),
                action: SnackBarAction(
                  label: 'Tamam',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        }
      } else if (_user.status == "error") {
        final snackBar = SnackBar(
          content: const Text('Hesabınız pasif hale gelmiştir.'),
          action: SnackBarAction(
            label: 'Tamam',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      emit(
        const LoginState(
          loginStateStatus: LoginStateStatus.error,
        ),
      );
    }
  }
}
