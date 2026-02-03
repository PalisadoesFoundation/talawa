// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/validators.dart';
import '../helpers/test_helpers.dart';
// import '../helpers/test_helpers.mocks.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
  });

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('SignUp Tests', () {
    // final model = MockSignupDetailsViewModel();

    test('Test validation for name', () {
      final String? blankName = Validators.required("");
      expect(blankName, "Required");

      final String? validName = Validators.required("testName");
      expect(validName, null);
    });

    test('Test validation for Email', () {
      final String? blankEmail = Validators.email("");
      expect(blankEmail, "Required");

      final String? invalidEmail1 = Validators.email("testInvalidEmail");
      expect(invalidEmail1, "Invalid email");

      final String? invalidEmail2 = Validators.email("test@.com");
      expect(invalidEmail2, "Invalid email");

      final String? invalidEmail3 = Validators.email("@test.com");
      expect(invalidEmail3, "Invalid email");

      final String? validEmail = Validators.email("testName@testOrg.com");
      expect(validEmail, null);
    });

    test('Test validation for password', () {
      final String? blankPassword = Validators.password("");
      expect(blankPassword, "Password must not be left blank");

      // Validators.password does not check min length implicitly for "test" -> it checks regex
      // The regex requires 8 chars, 1 numeric, 1 upper, 1 lower, 1 special.

      const String complexMsg =
          "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)";

      final String? invalidPassword1 = Validators.password("test");
      expect(invalidPassword1, complexMsg);

      final String? invalidPassword2 = Validators.password("123");
      expect(invalidPassword2, complexMsg);

      final String? invalidPassword3 = Validators.password("TEST");
      expect(invalidPassword3, complexMsg);

      final String? invalidPassword4 = Validators.password("test123");
      expect(invalidPassword4, complexMsg);

      final String? invalidPassword5 = Validators.password("test123!");
      expect(invalidPassword5, complexMsg);

      final String? validPassword = Validators.password("tesT123!");
      expect(validPassword, null);

      // test for confirm password
      final String? differentPassword =
          Validators.passwordConfirm("tesT123", "test1234");
      expect(differentPassword, "Password does not match original");

      final String? matchingPassword =
          Validators.passwordConfirm("tesT123", "tesT123");
      expect(matchingPassword, null);
    });

    test('Test sign up function', () {
      // final User newUser = User();

      // NOTE: This test is entirely WRONG.
      // TODO: Fix by testing GraphQL mutations.

      // when(model.signUp()).thenAnswer((realInvocation) {
      //   if (newUser.id == null || newUser.id == "") {
      //     return "User Id can't be blank";
      //   }
      //   if (newUser.firstName == null || newUser.firstName == "") {
      //     return "First Name can't be blank";
      //   }
      //   if (newUser.lastName == null || newUser.lastName == "") {
      //     return "Last Name can't be blank";
      //   }
      //   if (newUser.email == null || newUser.email == "") {
      //     return "Email can't be blank";
      //   }
      //   return {
      //     "id": newUser.id,
      //     "firstName": newUser.firstName,
      //     "lastName": newUser.lastName,
      //     "email": newUser.email,
      //   };
      // });

      // //checking with blank user Id
      // expect(model.signUp(), "User Id can't be blank");

      // newUser.id = "5";
      // //checking with blank first name
      // expect(model.signUp(), "First Name can't be blank");

      // newUser.firstName = "testFirstName";
      // //checking with blank last name
      // expect(model.signUp(), "Last Name can't be blank");

      // newUser.lastName = "testLastName";
      // //checking with blank email
      // expect(model.signUp(), "Email can't be blank");

      // newUser.email = "testName@testOrg.com";
      // // checking with all details
      // // should give proper response
      // expect(model.signUp(), {
      //   "id": newUser.id,
      //   "firstName": newUser.firstName,
      //   "lastName": newUser.lastName,
      //   "email": newUser.email,
      // });
    });
  });
}
