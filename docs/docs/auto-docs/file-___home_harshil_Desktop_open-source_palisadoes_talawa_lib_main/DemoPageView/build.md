




build method - DemoPageView class - main library - Dart API







menu

1. [talawa](../../index.html)
2. [main.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_main/)
3. [DemoPageView](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_main/DemoPageView-class.html)
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
  FetchPluginList();
  return BaseView<DemoViewModel>(
    builder: (context, model, child) => Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.strictTranslate('Demo Page')),
      ),
      body: Container(
        child: Text(model.title),
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [main](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_main/)
3. [DemoPageView](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_main/DemoPageView-class.html)
4. build method

##### DemoPageView class





talawa
1.0.0+1






