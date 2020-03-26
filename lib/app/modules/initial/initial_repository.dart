import 'package:domestic_budget_app/app/modules/initial/initial_module.dart';
import 'package:domestic_budget_app/app/shared/models/user_model.dart';
import 'package:domestic_budget_app/app/shared/services/local_storage_service.dart';
import 'package:domestic_budget_app/app/shared/util/http_api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class InitialRepository extends Disposable {
  factory InitialRepository.getInstance() =>
      InitialModule.to.get<InitialRepository>();

  InitialRepository();

  Future<UserModel> login(String identifier, String password) async {
    LocalStorageService localStorageService = LocalStorageService.getInstance();
    HttpApi httpApi = GetIt.I.get<HttpApi>();
    Dio dio = httpApi.getDioInstance();
    Response resp = await dio.post('/auth/local',
        data: {'identifier': identifier, 'password': password});
    localStorageService.setString('jwt', resp.data['jwt']);
    return UserModel.fromJson(resp.data['user']);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
