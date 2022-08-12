
import 'package:atik/constants/locator.dart';
import 'package:atik/models/user.dart';
import 'package:dio/dio.dart';

class LoginService {
  final _dio = getIt<Dio>();

  Future<User> loginUser({
    required String user,
    required String password,
  }) async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await _dio.post(
        '/login',
        data: {
          'user': user,
          'password': password,
        },
      );
      final _user = User.fromJson(response.data as Map<String, dynamic>);
      return _user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
