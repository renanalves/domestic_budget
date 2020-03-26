import 'package:domestic_budget_app/app/modules/initial/initial_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => InitialRepository()),
      ];

  @override
  List<Router> get routers => [];

  static Inject get to => Inject<InitialModule>.of();
}
