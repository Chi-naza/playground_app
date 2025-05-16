import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playground_app/screens/animation_screen.dart';

void main() {
  testWidgets('Animation Screen ... Test', (tester) async {
    await tester.pumpWidget(MaterialApp(home: AnimationScreen()));

    var containerFinder = find.byType(Container);
    // checks if container is inside the screen
    expect(containerFinder, findsOneWidget);

    // Convert the finder to widget in order to test the properties of the widget
    var containerWidget = tester.widget<Container>(containerFinder);

    // Testing the initial width and height of our container
    expect(containerWidget.constraints?.minWidth, 0);
    expect(containerWidget.constraints?.minHeight, 0);

    // Testing the intial color & borderRadius of the container
    expect((containerWidget.decoration as BoxDecoration).color, Colors.blue);
    expect(
      (containerWidget.decoration as BoxDecoration).borderRadius,
      BorderRadius.zero,
    );

    // TESTING THE WIDGETS WHEN ANIMATION IS OVER

    // first call pumpAndSettle to repeatedly rebuild the screen
    await tester.pumpAndSettle();

    // Then we need to update our container variable with the new data after animation
    containerFinder = find.byType(Container);
    containerWidget = tester.widget<Container>(containerFinder);

    expect(containerWidget.constraints?.minWidth, 200);
    expect(containerWidget.constraints?.minHeight, 200);
    expect((containerWidget.decoration as BoxDecoration).color, Colors.green);
    expect(
      (containerWidget.decoration as BoxDecoration).borderRadius,
      BorderRadius.circular(20),
    );
  });
}
