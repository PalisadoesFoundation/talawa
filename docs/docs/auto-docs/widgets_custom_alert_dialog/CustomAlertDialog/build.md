




build method - CustomAlertDialog class - custom\_alert\_dialog library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_alert\_dialog.dart](../../widgets_custom_alert_dialog/widgets_custom_alert_dialog-library.html)
3. [CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
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

If a widget's [build](../../widgets_custom_alert_dialog/CustomAlertDialog/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

## Implementation

```
@override
Widget build(BuildContext context) {
  final List<Widget> actions = [
    RaisedRoundedButton(
      key: Key(secondaryButtonText),
      onTap: () {
        secondaryButtonTap != null
            ? secondaryButtonTap!()
            : navigationService.pop();
      },
      buttonLabel:
          AppLocalizations.of(context)!.strictTranslate(secondaryButtonText),
      textColor: Colors.white,
      backgroundColor: const Color(0xFF008A37),
      width: SizeConfig.screenWidth! * 0.2,
      height: SizeConfig.screenHeight! * 0.06,
    ),
    RaisedRoundedButton(
      key: Key(successText),
      onTap: () => success(),
      buttonLabel: AppLocalizations.of(context)!.strictTranslate(successText),
      textColor: const Color(0xFF008A37),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      width: SizeConfig.screenWidth! * 0.2,
      height: SizeConfig.screenHeight! * 0.06,
    ),
  ];
  return AlertDialog(
    surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
    title: Text(
      AppLocalizations.of(context)!.strictTranslate(dialogTitle),
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.w800),
    ),
    content: Text(
      AppLocalizations.of(context)!.strictTranslate(dialogSubTitle),
    ),
    buttonPadding: EdgeInsets.symmetric(
      horizontal: SizeConfig.screenWidth! * 0.05,
      vertical: SizeConfig.screenHeight! * 0.05,
    ),
    actions: reverse ? actions.reversed.toList() : actions,
  );
}
```

 


1. [talawa](../../index.html)
2. [custom\_alert\_dialog](../../widgets_custom_alert_dialog/widgets_custom_alert_dialog-library.html)
3. [CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
4. build method

##### CustomAlertDialog class





talawa
1.0.0+1






