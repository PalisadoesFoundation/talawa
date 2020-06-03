import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validator.dart';

void main() {
  group('Register Page test', () {
    test('Firstname < 4 returns error string', () {
      var result = Validator.validateFirstName('');
      expect(result, 'First name must be at least 4 characters.');
    });

    test('Firstname > 4 returns message', () {
      var result = Validator.validateFirstName('example');
      expect(result, null);
    });

    test('Lastname < 4 returns error string', () {
      var result = Validator.validateLastName('');
      expect(result, 'Last name must be at least 4 characters.');
    });

    test('Lastname > 4 returns message', () {
      var result = Validator.validateLastName('example');
      expect(result, null);
    });

  });
}
