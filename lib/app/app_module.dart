import 'package:domestic_budget_app/app/modules/home/home_module.dart';
import 'package:domestic_budget_app/app/modules/initial/initial_module.dart';
import 'package:domestic_budget_app/app/shared/services/connection_service.dart';
import 'package:domestic_budget_app/app/shared/services/local_storage_service.dart';
import 'package:domestic_budget_app/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:domestic_budget_app/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ConnectionService()),
        Bind((i) => LocalStorageService()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: InitialModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
