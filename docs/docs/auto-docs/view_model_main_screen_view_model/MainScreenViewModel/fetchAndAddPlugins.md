




fetchAndAddPlugins method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. fetchAndAddPlugins method

fetchAndAddPlugins


dark\_mode

light\_mode




# fetchAndAddPlugins method


void
fetchAndAddPlugins(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)

Dynamically adds `BottomNavigationBarItems` in `BottomNavigationBar`.

by mapping over the data received from the server.

**params**:

* `context`: its the same context you use everywhere in the flutter framework refer flutter docs for more info.

**returns**:
None


## Implementation

```
void fetchAndAddPlugins(
  BuildContext context,
) {
  navBarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        key: keyBNHome,
      ),
      label: AppLocalizations.of(context)!.strictTranslate('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.event_note,
        key: keyBNEvents,
      ),
      label: AppLocalizations.of(context)!.strictTranslate('Events'),
    ),

    /// Makes chat inaccessible for the user
    //TODO: add chat functionality
    // BottomNavigationBarItem(
    //   icon: Icon(
    //     Icons.chat_outlined,
    //     key: keyBNChat,
    //   ),
    //   label: AppLocalizations.of(context)!.strictTranslate('Chat'),
    // ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
        key: keyBNProfile,
      ),
      label: AppLocalizations.of(context)!.strictTranslate('Profile'),
    ),
  ];

  if (!demoMode) {
    pages = [
      OrganizationFeed(
        key: const Key("HomeView"),
        homeModel: this,
      ),
      ExploreEvents(
        key: const Key('ExploreEvents'),
        homeModel: this,
      ),
      // AddPost(
      //   key: const Key('AddPost'),
      //   drawerKey: MainScreenViewModel.scaffoldKey,
      // ),
      // const ChatPage(
      //   key: Key('Chats'),
      // ),
      ProfilePage(
        key: keySPEditProfile,
        homeModel: this,
      ),
    ];
    pluginList =
        (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

    print(pluginPrototypeData);
    pluginList.forEach((plugin) {
      if (pluginPrototypeData.containsKey(
            (plugin as Map<String, dynamic>)["pluginName"] as String,
          ) &&
          plugin["pluginInstallStatus"] as bool) {
        navBarItems.add(
          BottomNavigationBarItem(
            icon: Icon(
              (pluginPrototypeData[plugin["pluginName"]]
                  as Map<String, dynamic>)["icon"] as IconData,
            ),
            label: AppLocalizations.of(context)!.strictTranslate(
              plugin["pluginName"] as String,
            ),
          ),
        );
        pages.add(
          (pluginPrototypeData[plugin["pluginName"]]
              as Map<String, dynamic>)["class"] as StatelessWidget,
        );
      }
    });

    /// Causes the app check the plugins updates in every 300 sec
    ///
    /// updated and re-render the navbar
    Timer.periodic(Duration(seconds: (testMode ? 1 : 300)), (timer) {
      FetchPluginList();
      final newPluginList =
          (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

      if (listEquals(pluginList, newPluginList)) {
        // notifyListeners();
      }
      if (testMode) timer.cancel();
    });
  } else {
    pages = [
      DemoOrganizationFeed(
        key: const Key("DemoHomeView"),
        homeModel: this,
      ),
      DemoExploreEvents(
        key: const Key('DemoExploreEvents'),
        homeModel: this,
      ),
      // DemoAddPost(
      //   key: const Key('DemoAddPost'),
      //   drawerKey: MainScreenViewModel.scaffoldKey,
      // ),
      // const ChatPage(
      //   key: Key('Chats'),
      // ),
      DemoProfilePage(
        key: const Key('DemoProfile'),
        homeModel: this,
      ),
    ];
  }
}
```

 


1. [talawa](../../index.html)
2. [main\_screen\_view\_model](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. fetchAndAddPlugins method

##### MainScreenViewModel class





talawa
1.0.0+1






