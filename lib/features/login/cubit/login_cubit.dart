import 'package:atik/constants/locator.dart';
import 'package:atik/constants/secure_storage.dart';
import 'package:atik/features/home/view/home_screen.dart';
import 'package:atik/models/user.dart';
import 'package:atik/service/login_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final _secureStorage = getIt<SecureStorage>();
  final LoginService _loginService = LoginService();

  Future<void> onLogin({
    required BuildContext context,
    required String user,
    required String password
  }) async{
      emit(const LoginState(loginStateStatus: LoginStateStatus.loading));
      try{
        final _user = await _loginService.loginUser(user: user, password: password);
        if(_user.data.auth == "0")
        {
          emit(
          const LoginState(
            loginStateStatus: LoginStateStatus.error,
          ),
        );
        }else {
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
          _secureStorage.storeKey(key: 'location', value: _user.data.location),
          ]);
          emit(LoginState(loginStateStatus: LoginStateStatus.success,user: _user.data));

          Future.delayed(const Duration(milliseconds: 200 ),(){
Navigator.pushAndRemoveUntil(
            context,
            // ignore: inference_failure_on_instance_creation
            MaterialPageRoute(builder: (context) =>  HomeScreen()),
            (Route<dynamic> route) => false,
          );
          });
        }
      }catch (e) {
      emit(
        const LoginState(
          loginStateStatus: LoginStateStatus.error,
        ),
      );
    }
  }
}