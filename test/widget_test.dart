import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_flutter_meedu/app/ui/pages/counter/counter_page.dart';

import 'set_up.dart';

void main() {
  setUpProviders();

  testWidgets(
    'CounterPage',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CounterPage(),
        ),
      );
      expect(find.text('0'), findsNWidgets(2));
      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.pump();
      expect(find.text('1'), findsNWidgets(2));
    },
  );

  testWidgets(
    'CounterPage copy',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CounterPage(),
        ),
      );
      expect(find.text('0'), findsNWidgets(2));
      await tester.tap(
        find.byType(FloatingActionButton),
      );
      await tester.pump();
      expect(find.text('1'), findsNWidgets(2));
    },
  );
}
