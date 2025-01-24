




build method - ProfilePage class - profile\_page library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/profile/profile\_page.dart](../../views_after_auth_screens_profile_profile_page/views_after_auth_screens_profile_profile_page-library.html)
3. [ProfilePage](../../views_after_auth_screens_profile_profile_page/ProfilePage-class.html)
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

If a widget's [build](../../views_after_auth_screens_profile_profile_page/ProfilePage/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

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
2. [profile\_page](../../views_after_auth_screens_profile_profile_page/views_after_auth_screens_profile_profile_page-library.html)
3. [ProfilePage](../../views_after_auth_screens_profile_profile_page/ProfilePage-class.html)
4. build method

##### ProfilePage class





talawa
1.0.0+1






