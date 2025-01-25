




build method - FromPalisadoes class - from\_palisadoes library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/from\_palisadoes.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_from_palisadoes/)
3. [FromPalisadoes](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_from_palisadoes/FromPalisadoes-class.html)
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
  return Column(
    children: [
      // Customizing the word "from".
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // This method is called for localized text.
            AppLocalizations.of(context)!.strictTranslate('from'),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeHorizontal,
      ),
      // Customizing the word "Palisadoes".
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'PALISADOES',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeHorizontal! * 5,
      ),
    ],
  );
}
```

 


1. [talawa](../../index.html)
2. [from\_palisadoes](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_from_palisadoes/)
3. [FromPalisadoes](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_from_palisadoes/FromPalisadoes-class.html)
4. build method

##### FromPalisadoes class





talawa
1.0.0+1






