




build method - LanguageTile class - lang\_switch library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/lang\_switch.dart](../../widgets_lang_switch/widgets_lang_switch-library.html)
3. [LanguageTile](../../widgets_lang_switch/LanguageTile-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
build(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the tree
in a given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) and when the dependencies of this widget change
(e.g., an [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling [Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

* the fields of the widget, which themselves must not change over time,
  and
* any ambient state obtained from the `context` using
  [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget's [build](../../widgets_lang_switch/LanguageTile/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

## Implementation

```
@override
Widget build(BuildContext context) {
  //AppLanguage enables to set up localized values for each locale that our app supports.
  //A locale is an identifier used to select a user's language and formatting preferences.
  //This represents a Unicode Language Identifier (i.e. without Locale extensions),
  //except variants are not supported.
  return Consumer<AppLanguage>(
    builder: (context, appLang, _) {
      final Language userLanguage = languages.firstWhere(
        (element) => element.langCode == appLang.appLocal.languageCode,
      );
      return ListTile(
        key: const Key('LanguageTile'),
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal!,
        ),
        title:
            Text(AppLocalizations.of(context)!.strictTranslate("Language")),
        trailing: TextButton(
          key: const Key('LanguageSelector'),
          onPressed: () {
            navigationService.pushReplacementScreen(
              '/selectLang',
              arguments: '0',
            );
          },
          child: Text(userLanguage.langName),
        ),
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [lang\_switch](../../widgets_lang_switch/widgets_lang_switch-library.html)
3. [LanguageTile](../../widgets_lang_switch/LanguageTile-class.html)
4. build method

##### LanguageTile class





talawa
1.0.0+1






