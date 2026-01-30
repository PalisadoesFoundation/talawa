import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/parsers/json_parser.dart';

void main() {
  group('JSON Parser Tests', () {
    group('parseJsonToMap', () {
      test('should parse valid JSON string to Map', () {
        const jsonString = '{"key1": "value1", "key2": "value2"}';
        final result = parseJsonToMap(jsonString);

        expect(result, isA<Map<String, dynamic>>());
        expect(result['key1'], 'value1');
        expect(result['key2'], 'value2');
      });

      test('should parse nested JSON objects', () {
        const jsonString = '{"outer": {"inner": "value"}}';
        final result = parseJsonToMap(jsonString);

        expect(result['outer'], isA<Map<String, dynamic>>());
        expect((result['outer'] as Map<String, dynamic>)['inner'], 'value');
      });

      test('should parse JSON with various data types', () {
        const jsonString = '''
        {
          "string": "text",
          "number": 42,
          "boolean": true,
          "nullValue": null,
          "array": [1, 2, 3]
        }
        ''';
        final result = parseJsonToMap(jsonString);

        expect(result['string'], 'text');
        expect(result['number'], 42);
        expect(result['boolean'], true);
        expect(result['nullValue'], null);
        expect(result['array'], [1, 2, 3]);
      });

      test('should handle empty JSON object', () {
        const jsonString = '{}';
        final result = parseJsonToMap(jsonString);

        expect(result, isEmpty);
        expect(result, isA<Map<String, dynamic>>());
      });

      test('should throw FormatException for invalid JSON', () {
        const invalidJson = '{invalid json}';

        expect(
          () => parseJsonToMap(invalidJson),
          throwsFormatException,
        );
      });

      test('should throw FormatException for malformed JSON', () {
        const malformedJson = '{"key": "value"';

        expect(
          () => parseJsonToMap(malformedJson),
          throwsFormatException,
        );
      });

      test('should throw TypeError when JSON is not a Map', () {
        const jsonArray = '["item1", "item2"]';

        expect(
          () => parseJsonToMap(jsonArray),
          throwsA(isA<TypeError>()),
        );
      });

      test('should parse complex nested structures', () {
        const jsonString = '''
        {
          "users": [
            {"id": 1, "name": "Alice"},
            {"id": 2, "name": "Bob"}
          ],
          "metadata": {
            "count": 2,
            "timestamp": "2026-01-23"
          }
        }
        ''';
        final result = parseJsonToMap(jsonString);

        expect(result['users'], isA<List>());
        expect((result['users'] as List).length, 2);
        expect((result['metadata'] as Map<String, dynamic>)['count'], 2);
      });
    });

    group('parseJsonToList', () {
      test('should parse valid JSON array to List', () {
        const jsonString = '["item1", "item2", "item3"]';
        final result = parseJsonToList(jsonString);

        expect(result, isA<List<dynamic>>());
        expect(result.length, 3);
        expect(result[0], 'item1');
        expect(result[1], 'item2');
        expect(result[2], 'item3');
      });

      test('should parse nested JSON arrays', () {
        const jsonString = '[["inner1", "inner2"], ["inner3"]]';
        final result = parseJsonToList(jsonString);

        expect(result[0], isA<List<dynamic>>());
        expect((result[0] as List)[0], 'inner1');
        expect((result[0] as List)[1], 'inner2');
        expect((result[1] as List)[0], 'inner3');
      });

      test('should parse array with various data types', () {
        const jsonString = '["text", 42, true, null, {"key": "value"}]';
        final result = parseJsonToList(jsonString);

        expect(result[0], 'text');
        expect(result[1], 42);
        expect(result[2], true);
        expect(result[3], null);
        expect(result[4], isA<Map<String, dynamic>>());
        expect((result[4] as Map<String, dynamic>)['key'], 'value');
      });

      test('should handle empty JSON array', () {
        const jsonString = '[]';
        final result = parseJsonToList(jsonString);

        expect(result, isEmpty);
        expect(result, isA<List<dynamic>>());
      });

      test('should throw FormatException for invalid JSON', () {
        const invalidJson = '[invalid json]';

        expect(
          () => parseJsonToList(invalidJson),
          throwsFormatException,
        );
      });

      test('should throw FormatException for malformed JSON array', () {
        const malformedJson = '["item1", "item2"';

        expect(
          () => parseJsonToList(malformedJson),
          throwsFormatException,
        );
      });

      test('should throw TypeError when JSON is not a List', () {
        const jsonObject = '{"key": "value"}';

        expect(
          () => parseJsonToList(jsonObject),
          throwsA(isA<TypeError>()),
        );
      });

      test('should parse array of objects', () {
        const jsonString = '''
        [
          {"id": 1, "name": "Alice"},
          {"id": 2, "name": "Bob"},
          {"id": 3, "name": "Charlie"}
        ]
        ''';
        final result = parseJsonToList(jsonString);

        expect(result.length, 3);
        expect((result[0] as Map<String, dynamic>)['name'], 'Alice');
        expect((result[1] as Map<String, dynamic>)['name'], 'Bob');
        expect((result[2] as Map<String, dynamic>)['name'], 'Charlie');
      });
    });
  });
}
