// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:playground_app/services/app_methods.dart';

void main() {
  test("Testing Divide Function in App Methods", () {
    // HOU 214F 00125 000
    // AAA: Arrange, Act & Assert

    // ARRANGE
    final appMethods = AppMethods();
    int dividend = 12;
    int divisor = 3;

    // ACT
    final answer = appMethods.divideTwoNumbers(dividend, divisor);

    // ASSERT
    expect(answer, 4);
  });

  // Another test case
  test("Testing Divide Function in App Methods With divisor as ZERO", () {
    // AAA: Arrange, Act & Assert

    // ARRANGE
    final appMethods = AppMethods();
    int dividend = 3;
    int divisor = 0;

    // ACT
    final answer = appMethods.divideTwoNumbers(dividend, divisor);

    // ASSERT
    expect(answer, 0);
  });
}
