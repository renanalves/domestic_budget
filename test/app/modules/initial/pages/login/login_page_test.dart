import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:domestic_budget_app/app/modules/initial/pages/login/login_page.dart';

main() {
  testWidgets('LoginPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LoginPage(title: 'Login')));
    final titleFinder = find.text('Login');
    expect(titleFinder, findsOneWidget);
  });
}
