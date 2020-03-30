import 'package:mobx/mobx.dart';

part 'intro_controller.g.dart';

class IntroController = _IntroBase with _$IntroController;

abstract class _IntroBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
