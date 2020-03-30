import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:domestic_budget_app/app/modules/initial/pages/signin/signin_controller.dart';
import 'package:domestic_budget_app/app/modules/initial/initial_module.dart';

void main() {
  initModule(InitialModule());
  SigninController signin;

  setUp(() {
    signin = InitialModule.to.get<SigninController>();
  });

  group('SigninController Test', () {
    test("First Test", () {
      expect(signin, isInstanceOf<SigninController>());
    });

    test("Set Value", () {
      expect(signin.value, equals(0));
      signin.increment();
      expect(signin.value, equals(1));
    });
  });
}
