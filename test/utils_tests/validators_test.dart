// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validators.dart';

void main() {
  group(
    'Test Validator',
    () {
      group('Test validateURL', () {
        test('Test validateURL when value is empty', () {
          final result = Validator.validateURL('');

          expect(result, 'Please verify URL first');
        });

        test('Test validateURL when value is not absolute', () {
          final result = Validator.validateURL('path/resource');

          expect(result, 'Enter a valid URL');
        });

        test('Test validateURL when value is not absolute', () {
          final result = Validator.validateURL('https://domain/path/resource');

          expect(result, null);
        });
      });

      group('Test validateFirstName', () {
        test('Test validateFirstName when value is empty', () {
          final result = Validator.validateFirstName('');

          expect(result, 'Firstname must not be left blank.');
        });

        test('Test validateFirstName when value does not match regex pattern',
            () {
          final result = Validator.validateFirstName('123');

          expect(result, 'Invalid Firstname');
        });

        test('Test validateFirstName when value match regex pattern', () {
          final result = Validator.validateFirstName('Name');

          expect(result, null);
        });
      });

      group('Test validateLastName', () {
        test('Test validateLastName when value is empty', () {
          final result = Validator.validateLastName('');

          expect(result, 'Lastname must not be left blank.');
        });

        test('Test validateLastName when value does not match regex pattern',
            () {
          final result = Validator.validateLastName('123');

          expect(result, 'Invalid Lastname');
        });

        test('Test validateLastName when value match regex pattern', () {
          final result = Validator.validateLastName('Name');

          expect(result, null);
        });
      });

      group('Test validateEmail', () {
        test('Test validateEmail when value is empty', () {
          final result = Validator.validateEmail('');

          expect(result, 'Email must not be left blank');
        });

        test('Test validateEmail when value does not match regex pattern', () {
          final List<String> invalidEmailList = [
            'plainaddress',
            '#@%^%#\$@#\$@#.com',
            '@example.com',
            'Joe Smith <email@example.com>',
            'email.example.com',
            'email@example@example.com',
            'email@example.com (Joe Smith)',
          ];

          for (final String email in invalidEmailList) {
            final result = Validator.validateEmail(email);

            expect(result, 'Please enter a valid Email Address');
          }
        });

        test('Test validateEmail when value match regex pattern', () {
          final List<String> validEmailList = [
            'email@example.com',
            'firstname.lastname@example.com',
            'firstname+lastname@example.com',
            'email@example.name',
            'email@example.museum',
            'email@example.co.jp',
            'firstname-lastname@example.com',
          ];

          for (final String email in validEmailList) {
            final result = Validator.validateEmail(email);

            expect(result, null);
          }
        });
      });

      group(
        'Test validatePassword',
        () {
          test('Test validatePassword when value is empty', () {
            final result = Validator.validatePassword('');

            expect(result, 'Password must not be left blank');
          });

          test('Test validatePassword when value has spaces', () {
            final result = Validator.validatePassword('password with spaces');

            expect(result, 'Password must not contain spaces');
          });

          test('Test validatePassword when value does not match regex pattern',
              () {
            final List<String> invalidPassword = [
              '12345678',
              'not8len',
              'notcapital',
              'NOSMALL',
              'nonum',
              'NoSpecialChar123',
            ];

            for (final String password in invalidPassword) {
              final result = Validator.validatePassword(password);

              expect(
                result,
                'Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)',
              );
            }
          });

          test('Test validatePassword when value match regex pattern', () {
            final result = Validator.validatePassword('ValidPassword123@');

            expect(result, null);
          });
        },
      );

      group(
        'Test validateUrlExistence',
        () {
          test('Test validateUrlExistence when url is not present', () async {
            final result = await Validator()
                .validateUrlExistence('https://nnnoootttaaasssiiittteee.com');

            expect(result, false);
          });

          test('Test validateUrlExistence when url is not present', () async {
            final result = await Validator().validateUrlExistence(
              'https://www.google.com',
            );

            expect(result, true);
          });
        },
      );

      group(
        'Test validatePasswordConfirm',
        () {
          test(
              'Test validatePasswordConfirm when value is not matching with comparator',
              () {
            final result = Validator.validatePasswordConfirm(
              'Password123@',
              'Password1234@',
            );

            expect(result, 'Password does not match original');
          });

          test(
              'Test validatePasswordConfirm when value is matching with comparator',
              () {
            final result = Validator.validatePasswordConfirm(
              'Password123@',
              'Password123@',
            );

            expect(result, null);
          });
        },
      );

      group(
        'Test validateEventForm',
        () {
          test('Test validateEventForm when value is empty', () {
            final result = Validator.validateEventForm('', 'label');

            expect(result, 'label must not be left blank.');
          });

          test('Test validateEventForm when value does not match regex pattern',
              () {
            final result = Validator.validateEventForm('12345', 'label');

            expect(result, 'Invalid label');
          });

          test('Test validateEventForm when value match regex pattern', () {
            final result = Validator.validateEventForm('12345Name', 'label');

            expect(result, null);
          });
        },
      );
    },
  );
}
