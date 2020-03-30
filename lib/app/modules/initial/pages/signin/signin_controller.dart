import 'package:mobx/mobx.dart';

part 'signin_controller.g.dart';

class SigninController = _SigninBase with _$SigninController;

abstract class _SigninBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
