import 'package:domestic_budget_app/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';

class LocalStorageService extends Disposable {
  factory LocalStorageService.getInstance() =>
      AppModule.to.get<LocalStorageService>();
  Box box;

  LocalStorageService() {
    box = Hive.box('things');
  }

  dynamic getThing(dynamic key) {
    return box.get(key);
  }

  Future<void> setThing(dynamic key, dynamic value) async {
    return box.put(key, value);
  }

  Future<int> clear() {
    return box.clear();
  }

  delete(dynamic key) {
    box.delete(key);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
