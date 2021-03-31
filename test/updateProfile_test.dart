import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validator.dart';

void main() {
  test('Empty Email Test', () {
    var result = Validator.validateEmail('');
    //Email should be non-empty
    expect(result, 'Email must not be left blank');
  });

  test('Invalid Email Test', () {
    var result = Validator.validateEmail('abc');
    //Email should be valid
    expect(result, 'Please enter a valid Email Address');
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
