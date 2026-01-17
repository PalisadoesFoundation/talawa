// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
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

      group('validateTime', () {
        test('returns error when value is null', () {
          expect(Validator.validateTime(null), 'Please enter a duration');
        });

        test('returns error when value is empty', () {
          expect(Validator.validateTime(''), 'Please enter a duration');
        });

        test('returns error for invalid format', () {
          expect(Validator.validateTime('1:20'),
              'Invalid duration format (mm:ss)');
        });

        test('returns error when seconds are >= 60', () {
          expect(Validator.validateTime('10:75'),
              'Seconds must be less than 60');
        });

        test('returns null for valid mm:ss format', () {
          expect(Validator.validateTime('05:30'), null);
        });
      });


      group('Test validateName', () {
        test('Test validateName when value is empty', () {
          final result = Validator.validateName('');

          expect(result, 'Name must not be left blank.');
        });

        test('Test validateName when value does not match regex pattern', () {
          final result = Validator.validateName('123');

          expect(result, 'Invalid Name');
        });

        test('Test validateName when value match regex pattern', () {
          final result = Validator.validateName('Name');

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
        'Test validateUrlExistence',
        () {
          test('Test validateUrlExistence when url is not present', () async {
            final result = await Validator().validateUrlExistence(
              'https://www.google.com',
            );

            expect(result, true);
          });
          test('Test validateUrlExistence when url is not present', () async {
            final result = await Validator()
                .validateUrlExistence('https://nnnoootttaaasssiiittteee.com');

            expect(result, false);
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
  group('EventDateTimeValidator', () {
    test('validateEventDateTime', () {
      final date = DateTime(2025, 10, 16);

      final invalid = Validator.validateEventDateTime(
        date,
        const TimeOfDay(hour: 10, minute: 0),
        date,
        const TimeOfDay(hour: 9, minute: 0),
      );
      expect(invalid, 'Event end date/time cannot be before start date/time');

      final valid = Validator.validateEventDateTime(
        date,
        const TimeOfDay(hour: 10, minute: 0),
        date,
        const TimeOfDay(hour: 11, minute: 0),
      );
      expect(valid, isNull);
    });

    test('validateEventStartDate', () {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final past = today.subtract(const Duration(days: 1));
      final future = today.add(const Duration(days: 1));

      expect(
        Validator.validateEventStartDate(past),
        'Cannot create events having date prior than today',
      );
      expect(Validator.validateEventStartDate(today), isNull);
      expect(Validator.validateEventStartDate(future), isNull);
    });
  });
}
