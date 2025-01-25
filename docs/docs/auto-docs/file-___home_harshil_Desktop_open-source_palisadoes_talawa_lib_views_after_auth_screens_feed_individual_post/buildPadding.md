




buildPadding function - individual\_post library - Dart API







menu

1. [talawa](../index.html)
2. [views/after\_auth\_screens/feed/individual\_post.dart](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. buildPadding function

buildPadding


dark\_mode

light\_mode




# buildPadding function


dynamic
buildPadding(

1. dynamic context,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) text

)

Generates a `Padding` widget with customizable vertical padding around a text element.

**params**:

* `context`: The build context in which the padding method is called.
* `text`: The text on which padding should be applied.

**returns**:

* `Padding`: Padding widget with vertical padding applied to the provided text.

## Implementation

```
Padding buildPadding(BuildContext context, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.006),
    child: Text(
      AppLocalizations.of(context)!.strictTranslate(text),
      style: Theme.of(context).textTheme.titleLarge,
    ),
  );
}
```

 


1. [talawa](../index.html)
2. [individual\_post](../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_feed_individual_post/)
3. buildPadding function

##### individual\_post library





talawa
1.0.0+1






