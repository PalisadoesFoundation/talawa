import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validator.dart';

void main() {
  test('Empty Email Test', () {
    final result = Validator.validateEmail('');
    //Email should be non-empty

    expect(result, 'Email must not be left blank');
  });

  test('Invalid Email Test', () {
    final result = Validator.validateEmail('abc');
    //Email should be valid

    expect(result, 'Please enter a valid Email Address');
  });

  test('Valid Email Test', () {
    final result = Validator.validateEmail('test@test.com');
    //Valid email returns null

    expect(result, null);
  });

  test('Empty First Name Test', () {
    final result = Validator.validateFirstName('');
    //First name should be non-empty
    expect(result, 'Firstname must not be left blank.');
  });

  test('Valid First Name Test', () {
    final result = Validator.validateLastName('Test');
    //Valid first name returns null

    expect(result, null);
  });

  test('Empty Last Name Test', () {
    final result = Validator.validateLastName('');
    //Last name should be non-empty

    expect(result, 'Lastname must not be left blank.');
  });

  test('Valid Last Name Test', () {
    final result = Validator.validateLastName('User');
    //Valid last name returns null

    expect(result, null);
  });
}
