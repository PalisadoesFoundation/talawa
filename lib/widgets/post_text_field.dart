import 'package:flutter/material.dart';

/// PostTextController is customized to highlight the the tags that are present in the text.
class PostTextController extends TextEditingController {
  PostTextController({
    String? text,
  }) : super(text: text);

  /// Setting this will notify all the listeners of this [TextEditingController]
  /// that they need to update (it calls [notifyListeners]).
  @override
  set text(String newText) {
    value = value.copyWith(
      text: newText,
      selection: const TextSelection.collapsed(offset: -1),
      composing: TextRange.empty,
    );
  }

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final List<TextSpan> children = [];
    final matches = <String>{};
    final List<Map<String, List<int>>> matchIndex = [];
    final RegExp allRegex = RegExp(r"\B#[a-zA-Z0-9]+\b");

    text.splitMapJoin(
      allRegex,
      onNonMatch: (String span) {
        children.add(TextSpan(text: span, style: style));
        return span;
      },
      onMatch: (Match m) {
        matches.add(m[0]!);

        children.add(
          TextSpan(
            text: m[0],
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        );

        final resultMatchIndex = matchValueIndex(m);
        if (resultMatchIndex != null) {
          matchIndex.add(resultMatchIndex);
        }

        return '';
      },
    );

    return TextSpan(style: style, children: children);
  }

  Map<String, List<int>>? matchValueIndex(Match match) {
    final matchValue = match[0]?.replaceFirstMapped('#', (match) => '');
    if (matchValue != null) {
      final firstMatchChar = match.start + 1;
      final lastMatchChar = match.end - 1;
      final compactMatch = {
        matchValue: [firstMatchChar, lastMatchChar]
      };
      return compactMatch;
    }
    return null;
  }
}
