import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validator.dart';

void main() {
  group('Register/login Page test', () {
    test('Firstname must not be null', () {
      var result = Validator.validateFirstName('');
      expect(result, 'Firstname must not be left blank.');
    });

    test('Firstname is not null', () {
      var result = Validator.validateFirstName('example');
      expect(result, null);
    });

    test('Lastname must not be null', () {
      var result = Validator.validateLastName('');
      expect(result, 'Lastname must not be left blank.');
    });

    test('Lastname is not null', () {
      var result = Validator.validateLastName('example');
      expect(result, null);
    });

    test('Empty email returns error string', () {
      var result = Validator.validateEmail('');
      expect(result, 'Not a Valid Email Address');
    });
    test('Incorrectly formated email return error string', () {
      var result = Validator.validateEmail('example@email');
      expect(result, 'Not a Valid Email Address');
    });
    test('Correctly foramtted email returns null', () {
      var result = Validator.validateEmail('example@email.com');
      expect(result, null);
    });

    test('password less than 6 returns error string', () {
      var result = Validator.validatePassword('pass');
      expect(result, 'Invalid Password');
    });
       test('password valid', () {
      var result = Validator.validatePassword('PASSWORD1@');
      expect(result, null);
    });
  });
}
