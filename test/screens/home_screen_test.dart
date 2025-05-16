import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground_app/screens/home_screen.dart';

void main() {
  testWidgets('Home Screen ... Testing floating action button', (tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    final data = find.textContaining("0");
    expect(data, findsOneWidget);

    final data2 = find.textContaining("1");
    expect(data2, findsNothing);

    final floatingButton = find.byType(FloatingActionButton);
    // when floating btn is tapped
    await tester.tap(floatingButton);
    // triggers a rebuild so we see our onTap change
    await tester.pump();

    // We look for "1" cos the increment has happened
    final data3 = find.textContaining("1");
    expect(data3, findsOneWidget);

    // Checking if Appbar is available
    final appbarFinder = find.byType(AppBar);
    expect(appbarFinder, findsOneWidget);

    /* NOTES:

      1. Find byType() works only if there is one instance of that widget.
        But if there are two instances...eg having two floatingActionButtons,then you will need to use - findByKey(), by that you will assign a unique key to each of the widgets.

      2. When you are waiting for a future to complete to update the screen with values: 
        a. Don't use tester.pump() bcos even if it rebuilds the widget and the data is not available yet, then your test will fail
        b. Instead, use tester.pumpAndSettle() - which repeatedly calls [pump] with the given duration until there are no longer any frames scheduled.

      */
  });
}
