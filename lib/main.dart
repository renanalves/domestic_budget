import 'package:domestic_budget_app/app/shared/util/http_api.dart';
import 'package:domestic_budget_app/build_type.dart';
import 'package:flutter/material.dart';
import 'package:domestic_budget_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HttpApi>(HttpApi(BuildType.DEVELOPMENT));
  runApp(ModularApp(module: AppModule()));
}
