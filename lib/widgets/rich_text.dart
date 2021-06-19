import 'package:flutter/cupertino.dart';
import 'package:talawa/utils/app_localization.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({required Key key, required this.words})
      : super(key: key);
  final List<Map<String, dynamic>> words;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: AppLocalizations.of(context)!
            .translate(words[0]['text'].toString().trim()),
        style: words[0]['textStyle'] as TextStyle,
        children: List.generate(
          words.length - 1,
          (index) => TextSpan(
            text: AppLocalizations.of(context)!
                .translate(words[index + 1]['text'].toString().trim()),
            style: words[index + 1]['textStyle'] as TextStyle,
          ),
        ),
      ),
    );
  }
}
