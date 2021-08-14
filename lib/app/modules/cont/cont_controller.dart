import 'package:mobx/mobx.dart';
part 'cont_controller.g.dart';

class ContController = _ContControllerBase with _$ContController;

abstract class _ContControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
}
