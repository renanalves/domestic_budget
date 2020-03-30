import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:domestic_budget_app/app/modules/initial/pages/splash/splash_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/initial_module.dart';

void main() {
  initModule(InitialModule());
  SplashController splash;

  setUp(() {
    splash = InitialModule.to.get<SplashController>();
  });

  group('SplashController Test', () {
    test("First Test", () {
      expect(splash, isInstanceOf<SplashController>());
    });

    test("Set Value", () {
      expect(splash.value, equals(0));
      splash.increment();
      expect(splash.value, equals(1));
    });
  });
}
