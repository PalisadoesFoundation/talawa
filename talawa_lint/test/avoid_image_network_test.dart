import 'package:talawa_lint/image_network_rule/avoid_image_network.dart';
import 'package:test/test.dart';

void main() {
  group('AvoidImageNetworkLintRule', () {
    group('isFlutterImageNetwork', () {
      test('returns true for valid Flutter Image.network', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'Image',
            'network',
            'package:flutter/src/widgets/image.dart',
          ),
          isTrue,
        );
      });

      test('returns false for Image.asset (different constructor)', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'Image',
            'asset',
            'package:flutter/src/widgets/image.dart',
          ),
          isFalse,
        );
      });

      test('returns false for Image.file (different constructor)', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'Image',
            'file',
            'package:flutter/src/widgets/image.dart',
          ),
          isFalse,
        );
      });

      test('returns false for Image.memory (different constructor)', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'Image',
            'memory',
            'package:flutter/src/widgets/image.dart',
          ),
          isFalse,
        );
      });

      test('returns false for unnamed Image constructor', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'Image',
            null, // unnamed constructor
            'package:flutter/src/widgets/image.dart',
          ),
          isFalse,
        );
      });

      test('returns false for custom Image class with network constructor', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'Image',
            'network',
            'package:my_app/custom_image.dart', // not Flutter package
          ),
          isFalse,
        );
      });

      test('returns false for different class name (CustomImage.network)', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'CustomImage',
            'network',
            'package:flutter/src/widgets/image.dart',
          ),
          isFalse,
        );
      });

      test('returns false when typeName is null', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            null,
            'network',
            'package:flutter/src/widgets/image.dart',
          ),
          isFalse,
        );
      });

      test('returns false when libraryUri is null', () {
        expect(
          AvoidImageNetworkLintRule.isFlutterImageNetwork(
            'Image',
            'network',
            null,
          ),
          isFalse,
        );
      });
    });

    group('shouldExcludeFile', () {
      test('excludes cached_image.dart with POSIX separators', () {
        expect(
          AvoidImageNetworkLintRule.shouldExcludeFile(
            '/home/user/project/lib/widgets/common/cached_image.dart',
          ),
          isTrue,
        );
      });

      test('excludes cached_image.dart with Windows separators', () {
        expect(
          AvoidImageNetworkLintRule.shouldExcludeFile(
            r'C:\Users\project\lib\widgets\common\cached_image.dart',
          ),
          isTrue,
        );
      });

      test('excludes cached_image.dart with mixed separators', () {
        expect(
          AvoidImageNetworkLintRule.shouldExcludeFile(
            r'/home/user/project/lib/widgets\common\cached_image.dart',
          ),
          isTrue,
        );
      });

      test('does NOT exclude other files in widgets/common/', () {
        expect(
          AvoidImageNetworkLintRule.shouldExcludeFile(
            '/home/user/project/lib/widgets/common/other_widget.dart',
          ),
          isFalse,
        );
      });

      test('does NOT exclude cached_image.dart in different directory', () {
        expect(
          AvoidImageNetworkLintRule.shouldExcludeFile(
            '/home/user/project/lib/views/cached_image.dart',
          ),
          isFalse,
        );
      });

      test('does NOT exclude regular Dart files', () {
        expect(
          AvoidImageNetworkLintRule.shouldExcludeFile(
            '/home/user/project/lib/main.dart',
          ),
          isFalse,
        );
      });

      test('does NOT exclude venue_selector.dart', () {
        expect(
          AvoidImageNetworkLintRule.shouldExcludeFile(
            '/home/user/project/lib/widgets/venue_selector.dart',
          ),
          isFalse,
        );
      });
    });
  });
}
