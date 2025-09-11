import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/pair.dart';

void main() {
  group('Pair Class Tests', () {
    test('Constructor creates pair with correct values', () {
      const pair = Pair(1, 'hello');

      expect(pair.first, equals(1));
      expect(pair.second, equals('hello'));
    });

    test('Constructor works with different types', () {
      const stringIntPair = Pair<String, int>('world', 42);
      const doubleBoolPair = Pair<double, bool>(3.14, true);
      const listMapPair = Pair<List<int>, Map<String, String>>(
        [1, 2, 3],
        {'key': 'value'},
      );

      expect(stringIntPair.first, equals('world'));
      expect(stringIntPair.second, equals(42));
      expect(doubleBoolPair.first, equals(3.14));
      expect(doubleBoolPair.second, equals(true));
      expect(listMapPair.first, equals([1, 2, 3]));
      expect(listMapPair.second, equals({'key': 'value'}));
    });

    test('Constructor works with null values', () {
      const pairWithNulls = Pair<String?, int?>(null, null);
      const pairWithPartialNull = Pair<String?, int>(null, 5);

      expect(pairWithNulls.first, isNull);
      expect(pairWithNulls.second, isNull);
      expect(pairWithPartialNull.first, isNull);
      expect(pairWithPartialNull.second, equals(5));
    });

    test('toString returns correct format', () {
      const pair1 = Pair(1, 'hello');
      const pair2 = Pair('test', 42);
      const pair3 = Pair(null, 'world');

      expect(pair1.toString(), equals('(1, hello)'));
      expect(pair2.toString(), equals('(test, 42)'));
      expect(pair3.toString(), equals('(null, world)'));
    });

    test('toString with complex objects', () {
      const pair = Pair([1, 2, 3], {'key': 'value'});

      expect(pair.toString(), equals('([1, 2, 3], {key: value})'));
    });

    group('Equality Tests', () {
      test('identical pairs are equal', () {
        const pair1 = Pair(1, 'hello');
        const pair2 = Pair(1, 'hello');

        expect(pair1, equals(pair2));
        expect(pair1 == pair2, isTrue);
      });

      test('different first values are not equal', () {
        const pair1 = Pair(1, 'hello');
        const pair2 = Pair(2, 'hello');

        expect(pair1, isNot(equals(pair2)));
        expect(pair1 == pair2, isFalse);
      });

      test('different second values are not equal', () {
        const pair1 = Pair(1, 'hello');
        const pair2 = Pair(1, 'world');

        expect(pair1, isNot(equals(pair2)));
        expect(pair1 == pair2, isFalse);
      });

      test('pairs with null values equality', () {
        const pair1 = Pair<String?, int?>(null, null);
        const pair2 = Pair<String?, int?>(null, null);
        const pair3 = Pair<String?, int?>(null, 5);

        expect(pair1, equals(pair2));
        expect(pair1, isNot(equals(pair3)));
      });

      test('pairs with different types are not equal', () {
        const pair1 = Pair<int, String>(1, 'hello');
        const pair2 = Pair<String, int>('1', 1);

        expect(pair1, isNot(equals(pair2)));
      });

      test('pair is not equal to non-pair object', () {
        const pair = Pair(1, 'hello');
        const notAPair = 'not a pair';

        expect(pair, isNot(equals(notAPair)));
        // ignore: unrelated_type_equality_checks
        expect(pair == notAPair, isFalse);
      });

      test('identical instances are equal', () {
        const pair1 = Pair(1, 'hello');
        const pair2 = pair1;

        expect(identical(pair1, pair2), isTrue);
        expect(pair1, equals(pair2));
      });
    });

    group('HashCode Tests', () {
      test('equal pairs have equal hash codes', () {
        const pair1 = Pair(1, 'hello');
        const pair2 = Pair(1, 'hello');

        expect(pair1.hashCode, equals(pair2.hashCode));
      });

      test('different pairs may have different hash codes', () {
        const pair1 = Pair(1, 'hello');
        const pair2 = Pair(2, 'world');

        // Note: We can't guarantee different hash codes, but they should typically differ
        // This test mainly ensures hashCode doesn't throw exceptions
        expect(() => pair1.hashCode, returnsNormally);
        expect(() => pair2.hashCode, returnsNormally);
      });

      test('hash code is consistent across multiple calls', () {
        const pair = Pair(1, 'hello');
        final hashCode1 = pair.hashCode;
        final hashCode2 = pair.hashCode;

        expect(hashCode1, equals(hashCode2));
      });

      test('hash code works with null values', () {
        const pair = Pair<String?, int?>(null, null);

        expect(() => pair.hashCode, returnsNormally);
        expect(pair.hashCode, isA<int>());
      });
    });

    group('Immutability Tests', () {
      test('fields are final and cannot be changed', () {
        const pair = Pair(1, 'hello');

        // These should be compile-time errors if uncommented:
        // pair.first = 2;  // Error: Cannot assign to final field
        // pair.second = 'world';  // Error: Cannot assign to final field

        // Verify values remain unchanged
        expect(pair.first, equals(1));
        expect(pair.second, equals('hello'));
      });

      test('const constructor creates compile-time constants', () {
        // These should be compile-time constants
        const pair1 = Pair(1, 'hello');
        const pair2 = Pair<String, int>('world', 42);

        expect(pair1.first, equals(1));
        expect(pair2.second, equals(42));
      });
    });

    group('Type Safety Tests', () {
      test('generic types are preserved', () {
        const stringIntPair = Pair<String, int>('hello', 42);
        const intStringPair = Pair<int, String>(42, 'hello');

        expect(stringIntPair.first, isA<String>());
        expect(stringIntPair.second, isA<int>());
        expect(intStringPair.first, isA<int>());
        expect(intStringPair.second, isA<String>());
      });

      test('works with complex generic types', () {
        const listMapPair = Pair<List<String>, Map<int, bool>>(
          ['a', 'b'],
          {1: true, 2: false},
        );

        expect(listMapPair.first, isA<List<String>>());
        expect(listMapPair.second, isA<Map<int, bool>>());
        expect(listMapPair.first.length, equals(2));
        expect(listMapPair.second[1], isTrue);
      });
    });

    group('Collection Usage Tests', () {
      test('can be used as map keys', () {
        const pair1 = Pair(1, 'a');
        const pair2 = Pair(2, 'b');
        const pair3 = Pair(1, 'a'); // Same as pair1

        final map = <Pair<int, String>, String>{
          pair1: 'value1',
          pair2: 'value2',
        };

        expect(map[pair1], equals('value1'));
        expect(map[pair2], equals('value2'));
        expect(map[pair3], equals('value1')); // Same key as pair1
        expect(map.length, equals(2));
      });

      test('can be used in sets', () {
        const pair1 = Pair(1, 'a');
        const pair2 = Pair(2, 'b');
        const pair3 = Pair(1, 'a'); // Duplicate of pair1

        // ignore: equal_elements_in_set
        final set = {pair1, pair2, pair3};

        expect(set.length, equals(2)); // pair3 is duplicate
        expect(set.contains(pair1), isTrue);
        expect(set.contains(pair2), isTrue);
        expect(set.contains(pair3), isTrue); // Same as pair1
      });

      test('can be used in lists', () {
        const pair1 = Pair(1, 'a');
        const pair2 = Pair(2, 'b');

        final list = [pair1, pair2, pair1]; // Intentional duplicate

        expect(list.length, equals(3));
        expect(list[0], equals(pair1));
        expect(list[1], equals(pair2));
        expect(list[2], equals(pair1));
      });
    });

    group('Edge Cases', () {
      test('works with same type for both values', () {
        const pair = Pair<String, String>('first', 'second');

        expect(pair.first, equals('first'));
        expect(pair.second, equals('second'));
        expect(pair.first, isNot(equals(pair.second)));
      });

      test('works with identical values', () {
        const pair = Pair('same', 'same');

        expect(pair.first, equals(pair.second));
        expect(pair.toString(), equals('(same, same)'));
      });

      test('works with function types', () {
        String stringFunc() => 'hello';
        int intFunc() => 42;

        final pair =
            Pair<String Function(), int Function()>(stringFunc, intFunc);

        expect(pair.first(), equals('hello'));
        expect(pair.second(), equals(42));
      });
    });
  });
}
