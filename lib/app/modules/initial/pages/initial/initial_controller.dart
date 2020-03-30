import 'package:mobx/mobx.dart';

part 'initial_controller.g.dart';

class InitialController = _InitialBase with _$InitialController;

abstract class _InitialBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
