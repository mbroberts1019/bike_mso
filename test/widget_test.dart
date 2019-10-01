// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bike_mso/components/homeRouteButton.dart';

void main() {
  group('HomeRouteButton', () {
    testWidgets('text and Icon display', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: ReusableButton(
              color: Colors.purple,
              buttonIcon: Icon(Icons.add),
              onPress: () {},
              iconText: 'This is text'),
        ),
      );

      expect(find.text('This is text'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('onPress should get called on Tap',
        (WidgetTester tester) async {
      var tapCount = 0;

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: ReusableButton(
              color: Colors.purple,
              buttonIcon: Icon(Icons.add),
              onPress: () {
                tapCount += 1;
              },
              iconText: 'This is text'),
        ),
      );
      expect(tapCount, 0);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(tapCount, 1);
    });
  });
}
