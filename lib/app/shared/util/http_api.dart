import 'package:dio/dio.dart';
import 'package:domestic_budget_app/app/shared/services/local_storage_service.dart';
import 'package:domestic_budget_app/build_type.dart';

class HttpApi {
  String baseUrl;
  BuildType buildType;
  HttpApi(BuildType buildType) {
    this.buildType = buildType;
    baseUrl = buildType == BuildType.DEVELOPMENT
        ? "http://192.168.0.3:1337"
        : "https://domestic-budget.herokuapp.com/";
  }

  getDioInstance() {
    LocalStorageService localStorageService = LocalStorageService.getInstance();
    String jwt = localStorageService.getThing('jwt');
    BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      headers: {'Authorization': 'Bearer $jwt'},
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

  /// Get User logged
  ///
  /// type: get
  String get usersMe => '/users/me';
}
