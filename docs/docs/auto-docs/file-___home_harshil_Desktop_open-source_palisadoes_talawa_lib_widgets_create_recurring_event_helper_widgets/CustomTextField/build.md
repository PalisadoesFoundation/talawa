




build method - CustomTextField class - create\_recurring\_event\_helper\_widgets library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/create\_recurring\_event\_helper\_widgets.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/)
3. [CustomTextField](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/CustomTextField-class.html)
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
  final outLineBorder = OutlineInputBorder(
    borderSide:
        BorderSide(color: Theme.of(context).textTheme.bodyLarge!.color!),
  );
  return SizedBox(
    width: SizeConfig.screenWidth! * 0.15,
    child: TextField(
      maxLength: maxTextLength,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: textEditingController,
      decoration: InputDecoration(
        counterText: "",
        enabledBorder: outLineBorder,
        focusedBorder: outLineBorder,
        border: outLineBorder,
        disabledBorder: outLineBorder,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
      ),
      enabled: enabled,
      readOnly: readOnly,
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [create\_recurring\_event\_helper\_widgets](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/)
3. [CustomTextField](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_create_recurring_event_helper_widgets/CustomTextField-class.html)
4. build method

##### CustomTextField class





talawa
1.0.0+1






