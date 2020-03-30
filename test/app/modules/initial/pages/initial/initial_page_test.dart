import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:domestic_budget_app/app/modules/initial/pages/initial/initial_page.dart';

main() {
  testWidgets('InitialPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(InitialPage(title: 'Initial')));
    final titleFinder = find.text('Initial');
    expect(titleFinder, findsOneWidget);
  });
}
