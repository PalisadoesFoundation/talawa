




build method - CustomRectangle class - create\_recurring\_event\_helper\_widgets library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/create\_recurring\_event\_helper\_widgets.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/)
3. [CustomRectangle](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/CustomRectangle-class.html)
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
  final repeatEveryBoxDecoration = BoxDecoration(
    border: Border.all(
      color: Theme.of(context).textTheme.bodyLarge!.color!,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(5),
  );
  return Container(
    decoration: repeatEveryBoxDecoration,
    child: Center(child: child),
  );
}
```

 


1. [talawa](../../index.html)
2. [create\_recurring\_event\_helper\_widgets](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/)
3. [CustomRectangle](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/CustomRectangle-class.html)
4. build method

##### CustomRectangle class





talawa
1.0.0+1






