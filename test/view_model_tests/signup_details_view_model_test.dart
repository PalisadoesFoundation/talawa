import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('SignUp Tests', () {
    final model = MockSignupDetailsViewModel();

    test('Test validation for first and last name', () {
      final String? blankFirstName = Validator.validateFirstName("");
      expect(blankFirstName, "Firstname must not be left blank.");

      final String? blankLastName = Validator.validateLastName("");
      expect(blankLastName, "Lastname must not be left blank.");

      final String? validFirstName =
          Validator.validateFirstName("testFirstName");
      expect(validFirstName, null);

      final String? validLastName = Validator.validateLastName("testLastName");
      expect(validLastName, null);
    });

    test('Test validation for Email', () {
      final String? blankEmail = Validator.validateEmail("");
      expect(blankEmail, "Email must not be left blank");

      final String? invalidEmail1 = Validator.validateEmail("testInvalidEmail");
      expect(invalidEmail1, "Please enter a valid Email Address");

      final String? invalidEmail2 = Validator.validateEmail("test@.com");
      expect(invalidEmail2, "Please enter a valid Email Address");

      final String? invalidEmail3 = Validator.validateEmail("@test.com");
      expect(invalidEmail3, "Please enter a valid Email Address");

      final String? validEmail =
          Validator.validateEmail("testName@testOrg.com");
      expect(validEmail, null);
    });

    test('Test validation for password', () {
      final String? blankPassword = Validator.validatePassword("");
      expect(blankPassword, "Password must not be left blank");

      final String? invalidPassword1 = Validator.validatePassword("test");
      expect(invalidPassword1, "Invalid Password");

      final String? invalidPassword2 = Validator.validatePassword("123");
      expect(invalidPassword2, "Invalid Password");

      final String? invalidPassword3 = Validator.validatePassword("TEST");
      expect(invalidPassword3, "Invalid Password");

      final String? invalidPassword4 = Validator.validatePassword("test123");
      expect(invalidPassword4, "Invalid Password");

      final String? invalidPassword5 = Validator.validatePassword("test123!");
      expect(invalidPassword5, "Invalid Password");

      final String? validPassword = Validator.validatePassword("tesT123!");
      expect(validPassword, null);

      // test for confirm password
      final String? differentPassword =
          Validator.validatePasswordConfirm("tesT123", "test1234");
      expect(differentPassword, "Password does not match original");

      final String? matchingPassword =
          Validator.validatePasswordConfirm("tesT123", "tesT123");
      expect(matchingPassword, null);
    });

    test('Test sign up function', () async {
      final User newUser = User();

      when(model.signUp()).thenAnswer((realInvocation) {
        if (newUser.id == null || newUser.id == "") {
          return "User Id can't be blank";
        }
        if (newUser.firstName == null || newUser.firstName == "") {
          return "First Name can't be blank";
        }
        if (newUser.lastName == null || newUser.lastName == "") {
          return "Last Name can't be blank";
        }
        if (newUser.email == null || newUser.email == "") {
          return "Email can't be blank";
        }
        return {
          "id": newUser.id,
          "firstName": newUser.firstName,
          "lastName": newUser.lastName,
          "email": newUser.email,
        };
      });

      //checking with blank user Id
      expect(model.signUp(), "User Id can't be blank");

      newUser.id = "5";
      //checking with blank first name
      expect(model.signUp(), "First Name can't be blank");

      newUser.firstName = "testFirstName";
      //checking with blank last name
      expect(model.signUp(), "Last Name can't be blank");

      newUser.lastName = "testLastName";
      //checking with blank email
      expect(model.signUp(), "Email can't be blank");

      newUser.email = "testName@testOrg.com";
      // checking with all details
      // should give proper response
      expect(model.signUp(), {
        "id": newUser.id,
        "firstName": newUser.firstName,
        "lastName": newUser.lastName,
        "email": newUser.email,
      });
    });
  });
}
