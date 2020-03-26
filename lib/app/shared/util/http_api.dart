import 'package:dio/dio.dart';
import 'package:domestic_budget_app/app/build_type.dart';

class HttpApi {
  HttpApi(BuildType buildType);

  getDioInstance() {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://192.168.0.3:1337",
      connectTimeout: 5000,
    );
    return Dio(options);
  }

  /// Forgot password
  ///
  /// type: post
  ///
  /// @param {identifier: 'foo@foo.com', password}
  /// 
  /// @return Json user
  String get loginPath => '/auth/local';

  /// Create user
  ///
  /// type post
  ///
  /// body { "username": "string", "email": "string", "provider": "string", "password": "string", "resetPasswordToken": "string", "confirmed": false, "blocked": false,
  String get createUserPath => '/auth/local/register';

  /// Forgot password
  ///
  /// type: post
  ///
  /// @param {'email': 'foo@foo.com'}
  String get forgotPasswordPath => '/auth/forgot-password';
}
