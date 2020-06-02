import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/views/widgets/forms/login_form.dart';

void main() {
  test('Empty email returns error string', () {
    var result = EmailFieldValidator.validateEmail('');
    expect(result, 'E-mail Address must be a valid email address.');
  });

    test('Non-Empty email returns null', () {
    var result = EmailFieldValidator.validateEmail('example@email.com');
    expect(result, null);
  });

    test('Empty password returns error string', () {
    var result = PasswordFieldValidator.validatePassword('');
    expect(result, 'Password must be at least 4 characters.');
  });
}
