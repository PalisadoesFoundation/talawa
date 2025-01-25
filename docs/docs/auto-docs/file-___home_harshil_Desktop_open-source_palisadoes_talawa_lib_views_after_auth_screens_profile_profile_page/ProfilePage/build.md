




build method - ProfilePage class - profile\_page library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/profile/profile\_page.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_profile_profile_page/)
3. [ProfilePage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_profile_profile_page/ProfilePage-class.html)
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
  return BaseView<ProfilePageViewModel>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu),
            onPressed: () =>
                MainScreenViewModel.scaffoldKey.currentState!.openDrawer(),
          ),
          key: const Key("ProfilePageAppBar"),
          title: Text(
            AppLocalizations.of(context)!.strictTranslate('Profile'),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white,
                ),
          ),
          actions: [
            IconButton(
              key: const Key('settingIcon'),
              onPressed: () {
                navigationService.pushScreen(Routes.appSettings);
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ],
        ),
        // if data fetching is under process then renders Circular Progress Icon
        // else renders the widget.
        body: model.isBusy
            ? const CircularProgressIndicator()
            : RefreshIndicator(
                onRefresh: () async => model.initialize(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomAvatar(
                                key: const Key('profilepic'),
                                isImageNull: model.currentUser.image == null,
                                firstAlphabet: model.currentUser.firstName!
                                    .substring(0, 1),
                                imageUrl: model.currentUser.image,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                maxRadius: SizeConfig.screenHeight! * 0.02,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${model.currentUser.firstName!} ${model.currentUser.lastName!}',
                                style: TextStyle(
                                  fontSize: SizeConfig.screenHeight! * 0.025,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              key: const Key('inviteicon'),
                              icon: Icon(
                                Icons.share,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                              onPressed: () => model.invite(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.02,
                      ),
                      TalawaPluginProvider(
                        pluginName: "Donation",
                        visible: true,
                        child: Column(
                          children: [
                            RaisedRoundedButton(
                              key: homeModel!.keySPDonateUs,
                              buttonLabel: AppLocalizations.of(context)!
                                  .strictTranslate(
                                'Donate to the Community',
                              ),
                              onTap: () => donate(context, model),
                              textColor: Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder!
                                  .borderSide
                                  .color,
                              backgroundColor:
                                  Theme.of(context).colorScheme.tertiary,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.68,
                        width: double.infinity,
                        child: ContainedTabBarView(
                          tabs: [
                            Tab(
                              text: AppLocalizations.of(context)!
                                  .strictTranslate(
                                'Posts',
                              ),
                              key: const Key('UserpostTab'),
                            ),
                            Tab(
                              text: AppLocalizations.of(context)!
                                  .strictTranslate(
                                'Events',
                              ),
                              key: const Key('UserEventsTab'),
                            ),
                          ],
                          views: [
                            const UserFeed(key: Key("UserFeed")),
                            const UserEvents(key: Key("UserEvents")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [profile\_page](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_profile_profile_page/)
3. [ProfilePage](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_profile_profile_page/ProfilePage-class.html)
4. build method

##### ProfilePage class





talawa
1.0.0+1






