import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/GraphAPI.dart';
import 'package:talawa/utils/validator.dart';

void main() {

  GraphAPI graphAPI = GraphAPI();
  group('Login Page test', () {
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
