import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:domestic_budget_app/app/modules/initial/pages/intro/intro_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/initial_module.dart';

void main() {
  initModule(InitialModule());
  IntroController intro;

  setUp(() {
    intro = InitialModule.to.get<IntroController>();
  });

  group('IntroController Test', () {
    test("First Test", () {
      expect(intro, isInstanceOf<IntroController>());
    });

    test("Set Value", () {
      expect(intro.value, equals(0));
      intro.increment();
      expect(intro.value, equals(1));
    });
  });
}
