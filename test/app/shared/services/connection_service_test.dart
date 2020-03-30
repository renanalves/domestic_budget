import 'package:flutter_test/flutter_test.dart';

import 'package:domestic_budget_app/app/shared/services/connection_service.dart';

void main() {
  ConnectionService service;

  setUp(() {
    service = ConnectionService();
  });

  group('ConnectionService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<ConnectionService>());
    });
  });
}
