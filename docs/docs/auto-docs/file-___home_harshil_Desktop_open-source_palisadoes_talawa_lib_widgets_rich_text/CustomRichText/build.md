




build method - CustomRichText class - rich\_text library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/rich\_text.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_rich_text/)
3. [CustomRichText](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_rich_text/CustomRichText-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      text:
          "${AppLocalizations.of(context)!.strictTranslate(words[0]['text'].toString().trim())} ",
      style: words[0]['textStyle'] as TextStyle,
      children: List.generate(
        words.length - 1,
        (index) => TextSpan(
          text:
              "${AppLocalizations.of(context)!.strictTranslate(words[index + 1]['text'].toString().trim())} ",
          style: words[index + 1]['textStyle'] as TextStyle,
        ),
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [rich\_text](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_rich_text/)
3. [CustomRichText](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_rich_text/CustomRichText-class.html)
4. build method

##### CustomRichText class





talawa
1.0.0+1






