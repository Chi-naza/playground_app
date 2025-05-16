import 'package:flutter_test/flutter_test.dart';
import 'package:playground_app/services/counter_class.dart';

void main() {
  group("Counter Class Group - ", () {
    test("Counter Class When Instantiated", () {
      // Arrange
      final CounterClass counterClass = CounterClass();
      // Act
      final value = counterClass.counter;
      // Assert
      expect(value, 0);
    });

    test("Counter Class When Incremented", () {
      // Arrange
      final CounterClass counterClass = CounterClass();
      // Act
      counterClass.incrementCounter();
      final value = counterClass.counter;
      // Assert
      expect(value, 1);
    });
  });
}
