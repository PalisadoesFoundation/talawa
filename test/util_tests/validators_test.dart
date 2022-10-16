import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validators.dart';

void main() {
  setUp(() {});
  group('Test Validator Class', () {
    test('Test validateURL method', () {
      // Correct URL
      expect(Validator.validateURL("http://example.com/"), null);
      // Empty URL
      expect(Validator.validateURL(""), "Please verify URL first");
      // Invalid URL
      expect(Validator.validateURL("not-a-valid-url"), "Enter a valid URL");
    });

    test('Test validateFirstName method', () {
      // Correct First Name
      expect(Validator.validateFirstName("John"), null);
      // Empty First Name
      expect(
          Validator.validateFirstName(""), "Firstname must not be left blank.");
      expect(Validator.validateFirstName("--------------------"),
          "Invalid Firstname");
    });
    test('Test validateLastName method', () {
      // Correct last Name
      expect(Validator.validateLastName("Doe"), null);
      // Empty last Name
      expect(
          Validator.validateLastName(""), "Lastname must not be left blank.");
      expect(Validator.validateLastName("--------------------"),
          "Invalid Lastname");
    });
  });

  test('Test validateEmail method', () {
    // Correct E-mail address
    expect(Validator.validateEmail("john123@doe.com"), null);
    // Empty E-mail address
    expect(Validator.validateEmail(""), "Email must not be left blank");
    // Invalid E-mail Address
    expect(Validator.validateEmail("1jzasa.o"),
        "Please enter a valid Email Address");
  });

  test('Test validatePassword method', () {
    // Correct Password
    expect(Validator.validatePassword("JohnsecretPass@1234"), null);
    // Empty Password
    expect(Validator.validatePassword(""), "Password must not be left blank");
    // Invalid Password
    expect(Validator.validatePassword("my bad password"),
        "Password must not contain spaces");
    // Invalid Password
    expect(Validator.validatePassword("bdpass"),
        "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)");
  });
  test('Test validatePasswordConfirm method', () {
    // Correct Password
    expect(
        Validator.validatePasswordConfirm(
            "JohnsecretPass@1234", "JohnsecretPass@1234"),
        null);
    // Invalid Password
    expect(Validator.validatePasswordConfirm("JohnsecretPass@1234", "john"),
        "Password does not match original");
  });

  test('Test validateUrlExistence method', () async {
    final validator = Validator();
    // Valid URL
    bool? temp = await validator.validateUrlExistence("http://example.com/");
    expect(temp, true);
    // Invalid URL
    temp =
        await validator.validateUrlExistence("http://exampleeeeee.com/adasdas");
    expect(temp, false);
  });

  test('Test validateEventForm method', () async {
    // Valid label
    expect(Validator.validateEventForm("value", "label"), null);
    // Empty value
    expect(Validator.validateEventForm("", "label"),
        "label must not be left blank.");
    // Invalid URL
    expect(Validator.validateEventForm("----------", "label"), "Invalid label");
  });
}
