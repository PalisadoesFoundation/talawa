import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';

void main() {
  group('MainScreenArgs', () {
    test('Equality', () {
      // Test 1: Creating two equal instances of MainScreenArgs
      final mainScreenArgs1 = MainScreenArgs(
        fromSignUp: true,
        mainScreenIndex: 1,
        toggleDemoMode: false,
      );
      final mainScreenArgs2 = MainScreenArgs(
        fromSignUp: true,
        mainScreenIndex: 1,
        toggleDemoMode: false,
      );

      expect(mainScreenArgs1, equals(mainScreenArgs2));
      expect(mainScreenArgs1.hashCode, equals(mainScreenArgs2.hashCode));

      // Test 2: Creating instances with different properties
      final mainScreenArgs3 = MainScreenArgs(
        fromSignUp: false,
        mainScreenIndex: 2,
        toggleDemoMode: true,
      );

      expect(mainScreenArgs1, isNot(equals(mainScreenArgs3)));
      expect(mainScreenArgs1.hashCode, isNot(equals(mainScreenArgs3.hashCode)));
    });
  });
}
