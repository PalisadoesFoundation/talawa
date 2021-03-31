import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validator.dart';

void main() {
  test('Empty Email Test', () {
    var result = Validator.validateEmail('');
  });

  test('Invalid Email Test', () {
    var result = Validator.validateEmail('abc');
  });

  test('Valid Email Test', () {
    var result = Validator.validateEmail('test@test.com');
    expect(result, null);
  });

  test('Empty First Name Test', () {
    var result = Validator.validateFirstName('');
    expect(result, 'Firstname must not be left blank.');
  });

  test('Valid First Name Test', () {
    var result = Validator.validateLastName('Test');
    expect(result, null);
  });

  test('Empty Last Name Test', () {
    var result = Validator.validateLastName('');
    expect(result, 'Lastname must not be left blank.');
  });

  test('Valid Last Name Test', () {
    var result = Validator.validateLastName('User');
    expect(result, null);
  });
}
