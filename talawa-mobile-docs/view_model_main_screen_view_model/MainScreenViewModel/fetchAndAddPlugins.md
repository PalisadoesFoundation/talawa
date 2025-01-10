


# fetchAndAddPlugins method








void fetchAndAddPlugins
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)





<p>Dynamically adds <code>BottomNavigationBarItems</code> in <code>BottomNavigationBar</code>.</p>
<p>by mapping over the data received from the server.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>context</code>: its the same context you use everywhere in the flutter framework refer flutter docs for more info.</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
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
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add_box,
        key: keyBNPost,
      ),
      label: AppLocalizations.of(context)!.strictTranslate('Add'),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_outlined,
        key: keyBNChat,
      ),
      label: AppLocalizations.of(context)!.strictTranslate('Chat'),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
        key: keyBNProfile,
      ),
      label: AppLocalizations.of(context)!.strictTranslate('Profile'),
    )
  ];

  pages = [
    OrganizationFeed(
      key: const Key("HomeView"),
      homeModel: this,
    ),
    ExploreEvents(
      key: const Key('ExploreEvents'),
      homeModel: this,
    ),
    AddPost(
      key: const Key('AddPost'),
      drawerKey: MainScreenViewModel.scaffoldKey,
    ),
    const ChatPage(
      key: Key('Chats'),
    ),
    ProfilePage(
      key: keySPEditProfile,
      homeModel: this,
    ),
  ];

  pluginList = (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

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
  Timer.periodic(const Duration(seconds: 300), (timer) {
    FetchPluginList();
    final newPluginList =
        (Hive.box('pluginBox').get('plugins') ?? []) as List<dynamic>;

    if (listEquals(pluginList, newPluginList)) {
      notifyListeners();
    }
  });
}
```







