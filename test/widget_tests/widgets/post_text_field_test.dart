import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/widgets/post_text_field.dart';

/// Method to Test test the post text field.
///
/// **params**:
///   None
///
/// **returns**:
///   None
void main() {
  group('PostTextController', () {
    testWidgets('buildTextSpan should highlight hashtags', (tester) async {
      const text = 'This is a #test post with #hashtags.';
      final controller = PostTextController(text: text);
      final span = controller.buildTextSpan(
        context: tester.element(find.byType(Container)),
        style: const TextStyle(color: Colors.black),
        withComposing: false,
      );
      final colors = span.children
          ?.whereType<TextSpan>()
          .map((e) => e.style?.color)
          .toList();
      expect(colors, [
        Colors.black, // 'This is a '
        const Color(0xff2196f3), // '#test '
        Colors.black, // 'post with '
        const Color(0xff2196f3), // '#hashtags'
        Colors.black, // '.'
      ]);
    });

    testWidgets('text property should update the value', (tester) async {
      const text = 'This is a #test post with #hashtags.';
      final controller = PostTextController(text: text);
      expect(controller.text, text);

      const newText = 'This is a new #test post.';
      controller.text = newText;
      expect(controller.text, newText);
    });

    testWidgets('text setter should update the value', (tester) async {
      final controller = PostTextController();
      expect(controller.text, '');
      controller.text = 'hello';
      expect(controller.text, 'hello');
    });

    test('matchValueIndex returns expected result', () {
      final postTextController =
          PostTextController(text: 'Sample #hashtag text');
      final regex = RegExp(r"\B#[a-zA-Z0-9]+\b");
      final match = regex.firstMatch(postTextController.text)!;

      final expected = {
        'hashtag': [8, 14]
      };
      final actual = postTextController.matchValueIndex(match);

      expect(actual, equals(expected));
    });
  });
}
