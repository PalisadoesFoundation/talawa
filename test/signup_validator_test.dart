import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validator.dart';

void main() {
  group('Register Page test', () {
    test('Firstname < 2 returns error string', () {
      var result = Validator.validateFirstName('');
      expect(result, 'First name must be at least 2 characters.');
    });

    test('Firstname > 2 returns message', () {
      var result = Validator.validateFirstName('example');
      expect(result, null);
    });

    test('Lastname < 2 returns error string', () {
      var result = Validator.validateLastName('');
      expect(result, 'Last name must be at least 2 characters.');
    });

    test('Lastname > 2 returns message', () {
      var result = Validator.validateLastName('example');
      expect(result, null);
    });

    test('Empty email returns error string', () {
      var result = Validator.validateEmail('');
      expect(result, 'E-mail Address must be a valid email address.');
    });
    test('Non-Empty email returns null', () {
      var result = Validator.validateEmail('example@email.com');
      expect(result, null);
    });

    test('Empty password returns error string', () {
      var result = Validator.validatePassword('');
      expect(result, 'Password must be at least 4 characters.');
    });
  });
}
