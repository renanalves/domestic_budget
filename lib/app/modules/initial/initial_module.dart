import 'package:domestic_budget_app/app/modules/initial/pages/initial/initial_page.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/intro/intro_page.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/login/login_page.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/signin/signin_page.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/splash/splash_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/signin/signin_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/intro/intro_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/login/login_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/initial/initial_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/initial_repository.dart';
import 'package:domestic_budget_app/app/modules/initial/pages/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => InitialRepository()),
        Bind((i) => SplashController()),
        Bind((i) => IntroController()),
        Bind((i) => InitialController()),
        Bind((i) => SigninController()),
        Bind((i) => LoginController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/initial', child: (_, args) => InitialPage()),
        Router('/intro', child: (_, args) => IntroPage()),
        Router('/login', child: (_, args) => LoginPage()),
        Router('/signin', child: (_, args) => SigninPage()),
      ];

  static Inject get to => Inject<InitialModule>.of();
}
