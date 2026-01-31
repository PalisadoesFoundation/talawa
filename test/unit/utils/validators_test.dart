import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/validators.dart';

void main() {
  group('Validators', () {
    group('required', () {
      test('returns error for null', () {
        expect(Validators.required(null), 'Required');
      });

      test('returns error for empty string', () {
        expect(Validators.required(''), 'Required');
      });

      test('returns error for whitespace string', () {
        expect(Validators.required('   '), 'Required');
      });

      test('returns null for valid string', () {
        expect(Validators.required('Valid'), null);
      });
    });

    group('eventField', () {
      test('returns error for null or empty', () {
        expect(Validators.eventField(null, 'Title'),
            'Title must not be left blank.');
        expect(Validators.eventField('', 'Title'),
            'Title must not be left blank.');
      });

      test('returns error for value without letters', () {
        expect(Validators.eventField('123', 'Title'), 'Invalid Title');
        expect(
            Validators.eventField('!!!', 'Description'), 'Invalid Description');
      });

      test('returns null for valid value with letters', () {
        expect(Validators.eventField('Valid Title', 'Title'), null);
        expect(Validators.eventField('Test123', 'Title'), null);
      });
    });

    group('email', () {
      test('returns error for null', () {
        expect(Validators.email(null), 'Required');
      });

      test('returns error for empty string', () {
        expect(Validators.email(''), 'Required');
      });

      test('returns error for invalid email', () {
        expect(Validators.email('invalid-email'), 'Invalid email');
        expect(Validators.email('invalid@'), 'Invalid email');
        expect(Validators.email('@domain.com'), 'Invalid email');
        expect(Validators.email('user@domain'), 'Invalid email');
      });

      test('returns null for valid email', () {
        expect(Validators.email('test@example.com'), null);
        expect(Validators.email('user.name@domain.co.uk'), null);
      });
    });

    group('minLen', () {
      test('returns error for null', () {
        expect(Validators.minLen(null, 5), 'Min length 5');
      });

      test('returns error for string length less than n', () {
        expect(Validators.minLen('1234', 5), 'Min length 5');
      });

      test('returns null for string length equal to n', () {
        expect(Validators.minLen('12345', 5), null);
      });

      test('returns null for string length greater than n', () {
        expect(Validators.minLen('123456', 5), null);
      });
    });

    group('password', () {
      test('returns error for null or empty', () {
        expect(Validators.password(null), 'Password must not be left blank');
        expect(Validators.password(''), 'Password must not be left blank');
      });

      test('returns error for spaces', () {
        expect(Validators.password('Pass word1!'),
            'Password must not contain spaces');
      });

      test('returns error for weak password', () {
        const String msg =
            "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)";
        expect(Validators.password('weak'), msg);
        expect(Validators.password('NoNumber!'), msg);
        expect(Validators.password('NoSpecial1'), msg);
        expect(Validators.password('nocaps1!'), msg);
        expect(Validators.password('Short1!'), msg);
      });

      test('returns null for valid password', () {
        expect(Validators.password('StrongPass1!'), null);
      });

      test('returns null for password with exactly 8 characters', () {
        expect(Validators.password('Abcdef1!'), null);
      });

      test('returns error for password without lowercase', () {
        const String msg =
            "Your password must be at least 8 characters long, contain at least one numeric, one uppercase and one lowercase letters and one special character (@,#,\$,etc.)";
        expect(Validators.password('ALLCAPS1!'), msg);
      });
    });

    group('url', () {
      test('returns error for null or empty', () {
        expect(Validators.url(null), 'Please verify URL first');
        expect(Validators.url(''), 'Please verify URL first');
      });

      test('returns error for invalid url', () {
        expect(Validators.url('invalid-url'), 'Enter a valid URL');
        expect(Validators.url('htt//example.com'), 'Enter a valid URL');
      });

      test('returns error for non-http/https schemes', () {
        expect(Validators.url('file:///foo/bar'), 'Enter a valid URL');
        expect(Validators.url('javascript:alert(1)'), 'Enter a valid URL');
        expect(Validators.url('ftp://example.com'), 'Enter a valid URL');
      });

      test('returns null for valid url', () {
        expect(Validators.url('https://example.com'), null);
        expect(Validators.url('http://example.com'), null);
        expect(Validators.url('https://sub.domain.example.com/path?query=1'),
            null);
      });
    });

    group('passwordConfirm', () {
      test('returns error when passwords do not match', () {
        expect(Validators.passwordConfirm('pass1', 'pass2'),
            'Password does not match original');
      });

      test('returns null when passwords match', () {
        expect(Validators.passwordConfirm('same', 'same'), null);
      });

      test('returns error when values are null or empty', () {
        expect(
            Validators.passwordConfirm(null, null), 'Password cannot be empty');
        expect(Validators.passwordConfirm('', ''), 'Password cannot be empty');
        expect(Validators.passwordConfirm('pass', null),
            'Password cannot be empty');
      });
    });

    group('eventDateTime', () {
      test('returns error when end time is before start time', () {
        final start = DateTime(2023, 1, 1, 10, 0);
        final end = DateTime(2023, 1, 1, 9, 0);
        expect(
          Validators.eventDateTime(
            start,
            TimeOfDay.fromDateTime(start),
            end,
            TimeOfDay.fromDateTime(end),
          ),
          'Event end date/time cannot be before start date/time',
        );
      });

      test('returns null when end time is after start time', () {
        final start = DateTime(2023, 1, 1, 10, 0);
        final end = DateTime(2023, 1, 1, 11, 0);
        expect(
          Validators.eventDateTime(
            start,
            TimeOfDay.fromDateTime(start),
            end,
            TimeOfDay.fromDateTime(end),
          ),
          null,
        );
      });

      test('returns null when times are equal', () {
        final start = DateTime(2023, 1, 1, 10, 0);
        expect(
          Validators.eventDateTime(
            start,
            TimeOfDay.fromDateTime(start),
            start,
            TimeOfDay.fromDateTime(start),
          ),
          null,
        );
      });
    });

    group('eventStartDate', () {
      test('returns error for past date', () {
        final now = DateTime.now();
        // Normalize 'today' to start of day to match implementation
        final today = DateTime(now.year, now.month, now.day);
        final pastDate = today.subtract(const Duration(days: 1));
        expect(Validators.eventStartDate(pastDate),
            'Cannot create events having date prior than today');
      });

      test('returns null for today', () {
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        expect(Validators.eventStartDate(today), null);
      });

      test('returns null for future date', () {
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        final futureDate = today.add(const Duration(days: 1));
        expect(Validators.eventStartDate(futureDate), null);
      });
    });

    group('url (scheme-only rejection)', () {
      test('returns error for scheme-only URL (http:)', () {
        expect(Validators.url('http:'), 'Enter a valid URL');
      });

      test('returns error for scheme-only URL (https:)', () {
        expect(Validators.url('https:'), 'Enter a valid URL');
      });

      test('returns error for URL without host', () {
        expect(Validators.url('http://'), 'Enter a valid URL');
        expect(Validators.url('https://'), 'Enter a valid URL');
      });

      test('returns null for valid URL with host', () {
        expect(Validators.url('http://example.com'), null);
        expect(Validators.url('https://example.com/path'), null);
      });
    });
  });

  group('Validator (Legacy)', () {
    test('validateUrlExistence returns false when http get throws', () async {
      final validator = Validator();
      // Using a specialized domain that is guaranteed to be invalid/unreachable
      // to trigger the exception handling block in the method.
      final result =
          await validator.validateUrlExistence('http://example.invalid');
      expect(result, false);
    });

    test('validateUrlExistence returns true for 200 OK', () async {
      final validator = Validator();
      // Using httpbin.org which returns 200 status
      final result = await validator
          .validateUrlExistence('https://httpbin.org/status/200');
      expect(result, true);
    });

    test('validateUrlExistence returns false for 404 status', () async {
      final validator = Validator();
      final result = await validator
          .validateUrlExistence('https://httpbin.org/status/404');
      expect(result, false);
    });

    test('validateUrlExistence returns false for 500 status', () async {
      final validator = Validator();
      final result = await validator
          .validateUrlExistence('https://httpbin.org/status/500');
      expect(result, false);
    });

    test('validateUrlExistence returns true for redirect (301)', () async {
      // 301 is in 200-399 range so should return true
      final validator = Validator();
      final result = await validator
          .validateUrlExistence('https://httpbin.org/status/301');
      expect(result, true);
    });
  });
}
