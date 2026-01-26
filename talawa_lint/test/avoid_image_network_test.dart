import 'package:talawa_lint/image_network_rule/avoid_image_network.dart';
import 'package:test/test.dart';

void main() {
  group('AvoidImageNetworkLintRule Logic', () {
    test('isFlutterImageNetwork returns true for valid Flutter Image.network',
        () {
      expect(
        AvoidImageNetworkLintRule.isFlutterImageNetwork(
          'Image',
          'network',
          'package:flutter/src/widgets/image.dart',
        ),
        isTrue,
      );
    });

    test('isFlutterImageNetwork returns false for Image.asset', () {
      expect(
        AvoidImageNetworkLintRule.isFlutterImageNetwork(
          'Image',
          'asset',
          'package:flutter/src/widgets/image.dart',
        ),
        isFalse,
      );
    });

    test('isFlutterImageNetwork returns false for different class name', () {
      expect(
        AvoidImageNetworkLintRule.isFlutterImageNetwork(
          'NotImage',
          'network',
          'package:flutter/src/widgets/image.dart',
        ),
        isFalse,
      );
    });

    test('isFlutterImageNetwork returns false for different package', () {
      expect(
        AvoidImageNetworkLintRule.isFlutterImageNetwork(
          'Image',
          'network',
          'package:other_package/image.dart',
        ),
        isFalse,
      );
    });

    test('isFlutterImageNetwork returns false if libraryUri is null', () {
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
}
