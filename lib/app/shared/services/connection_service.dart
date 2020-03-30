import 'package:dio/dio.dart';
import 'package:domestic_budget_app/app/shared/util/http_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

class ConnectionService extends Disposable {
  Future<bool> userIsIdentified(String identifier, String password) async {
    HttpApi httpApi = GetIt.I.get<HttpApi>();
    Dio dio = httpApi.getDioInstance();
    Response resp = await dio.get(httpApi.usersMe);
    if (resp.data['user'] != null) {
      return true;
    }
    return false;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
