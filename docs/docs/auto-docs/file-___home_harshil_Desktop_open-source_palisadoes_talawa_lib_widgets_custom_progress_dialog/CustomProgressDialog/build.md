




build method - CustomProgressDialog class - custom\_progress\_dialog library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_progress\_dialog.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_progress_dialog/)
3. [CustomProgressDialog](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_progress_dialog/CustomProgressDialog-class.html)
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
  return BaseView<ProgressDialogViewModel>(
    onModelReady: (model) => model.initialise(),
    builder: (context, model, child) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.25,
          vertical: SizeConfig.screenHeight! * 0.35,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).textTheme.titleLarge!.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          //An iOS-style activity indicator that spins clockwise.
          child: CupertinoActivityIndicator(
            radius: SizeConfig.screenWidth! * 0.065,
          ),
        ),
        // Shows no-internet image and text on no connectivity
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [custom\_progress\_dialog](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_progress_dialog/)
3. [CustomProgressDialog](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_progress_dialog/CustomProgressDialog-class.html)
4. build method

##### CustomProgressDialog class





talawa
1.0.0+1






