




build method - DemoProfilePage class - profile\_page\_demo library - Dart API







menu

1. [talawa](../../index.html)
2. [views/demo\_screens/profile\_page\_demo.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_profile_page_demo/)
3. [DemoProfilePage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_profile_page_demo/DemoProfilePage-class.html)
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
  print(userConfig.loggedIn);
  return Scaffold(
    key: const Key('DemoProfilePage'),
    appBar: AppBar(
      backgroundColor: Colors.green,
      // Theme.of(context).primaryColor,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        color: Theme.of(context).iconTheme.color,
        icon: const Icon(Icons.menu),
        onPressed: () {
          MainScreenViewModel.scaffoldKey.currentState!.openDrawer();
        },
      ),
      key: const Key("ProfilePageAppBar"),
      title: Text(
        AppLocalizations.of(context)!.strictTranslate('Profile'),
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              // fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: 'open-sans',
              color: Colors.white,
            ),
      ),
      actions: [
        IconButton(
          key: const Key('settingIcon'),
          onPressed: () {
            print('came');
            navigationService.pushScreen(Routes.appSettings);
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    ),
    // if data fetching is under process then renders Circular Progress Icon
    // else renders the widget.
    body: guestViewWidget(context),
  );
}
```

 


1. [talawa](../../index.html)
2. [profile\_page\_demo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_profile_page_demo/)
3. [DemoProfilePage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_profile_page_demo/DemoProfilePage-class.html)
4. build method

##### DemoProfilePage class





talawa
1.0.0+1






