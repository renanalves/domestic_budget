import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:domestic_budget_app/app/modules/initial/pages/intro/intro_page.dart';

main() {
  testWidgets('IntroPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(IntroPage(title: 'Intro')));
    final titleFinder = find.text('Intro');
    expect(titleFinder, findsOneWidget);
  });
}
