import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';

/// A widget to display the caption of a post with support for hashtags and expandable text.
class CaptionTextWidget extends StatefulWidget {
  const CaptionTextWidget({required this.caption, super.key});

  /// The caption text to display.
  final String caption;

  @override
  State<CaptionTextWidget> createState() => _CaptionTextWidgetState();
}

class _CaptionTextWidgetState extends State<CaptionTextWidget> {
  /// A boolean to track whether the caption is expanded or not.
  bool expanded = false;

  /// The length at which the caption will be trimmed.
  static const int trimLength = 150;

  /// Highlights hashtags in the caption text.
  ///
  /// **params**:
  /// * `text`: The caption text to process.
  /// * `style`: The default text style for the caption.
  /// * `tagStyle`: The text style for hashtags.
  ///
  /// **returns**:
  /// * `List<InlineSpan>`: A list of `InlineSpan` objects that can be used in a `Text.rich` widget.
  List<InlineSpan> _highlightTags(
    String text,
    TextStyle style,
    TextStyle tagStyle,
  ) {
    final exp = RegExp(r'(#[\w]+)');
    final spans = <InlineSpan>[];
    int start = 0;
    for (final match in exp.allMatches(text)) {
      if (match.start > start) {
        spans.add(
          TextSpan(text: text.substring(start, match.start), style: style),
        );
      }
      spans.add(TextSpan(text: match.group(0), style: tagStyle));
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start), style: style));
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'open-sans',
          color: Theme.of(context).colorScheme.onSecondary,
        );
    final tagStyle =
        style.copyWith(color: Colors.blue, fontWeight: FontWeight.bold);

    final String displayText = !expanded && widget.caption.length > trimLength
        ? '${widget.caption.substring(0, trimLength)}...'
        : widget.caption;

    final bool showMore = widget.caption.length > trimLength;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: _highlightTags(displayText, style, tagStyle),
            ),
            textAlign: TextAlign.justify,
          ),
          if (showMore)
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => setState(() => expanded = !expanded),
                child: Text(
                  expanded
                      ? AppLocalizations.of(context)!
                          .strictTranslate("show less")
                      : AppLocalizations.of(context)!
                          .strictTranslate("show more"),
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
