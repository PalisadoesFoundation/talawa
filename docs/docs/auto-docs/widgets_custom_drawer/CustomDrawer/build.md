




build method - CustomDrawer class - custom\_drawer library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_drawer.dart](../../widgets_custom_drawer/widgets_custom_drawer-library.html)
3. [CustomDrawer](../../widgets_custom_drawer/CustomDrawer-class.html)
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

If a widget's [build](../../widgets_custom_drawer/CustomDrawer/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

## Implementation

```
@override
Widget build(BuildContext context) {
  return BaseView<CustomDrawerViewModel>(
    onModelReady: (model) => model.initialize(homeModel, context),
    builder: (context, model, child) {
      return Container(
        width: SizeConfig.screenWidth! * 0.6,
        alignment: Alignment.centerLeft,
        child: Drawer(
          key: const Key("Drawer"),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //A material design Drawer header that identifies the app's user.
              Expanded(
                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CustomAvatar(
                        isImageNull: model.selectedOrg?.image == null,
                        imageUrl: model.selectedOrg?.image,
                        firstAlphabet:
                            model.selectedOrg?.name!.substring(0, 1),
                      ),
                      accountName: Column(
                        key: MainScreenViewModel.keyDrawerCurOrg,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.selectedOrg?.name! ?? "NULL",
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate("Selected Organization"),
                          ),
                        ],
                      ),
                      accountEmail: const SizedBox(),
                    ),
                    //Tile to Switch organizations
                    Column(
                      key: MainScreenViewModel.keyDrawerSwitchableOrg,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 8.0,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate("Switch Organization"),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.41,
                          child: Scrollbar(
                            controller: model.controller,
                            thumbVisibility: true,
                            child: ListView.builder(
                              key: const Key("Switching Org"),
                              controller: model.controller,
                              padding: EdgeInsets.zero,
                              itemCount: model.switchAbleOrg.length,
                              // itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  key: const Key("Org"),
                                  onTap: () => model.switchOrg(
                                    model.switchAbleOrg[index],
                                  ),
                                  leading: CustomAvatar(
                                    isImageNull:
                                        model.switchAbleOrg[index].image ==
                                            null,
                                    imageUrl:
                                        model.switchAbleOrg[index].image,
                                    firstAlphabet: model
                                        .switchAbleOrg[index].name!
                                        .substring(0, 1),
                                    fontSize: 18,
                                  ),
                                  title: Text(
                                    model.switchAbleOrg[index].name!,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // A Tile to join a new organization
              Container(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        const Divider(),
                        ListTile(
                          key: MainScreenViewModel.keyDrawerJoinOrg,
                          onTap: () {
                            if (userConfig.loggedIn) {
                              navigationService.popAndPushScreen(
                                Routes.joinOrg,
                                arguments: '-1',
                              );
                            } else {
                              navigationService.popAndPushScreen(
                                Routes.setUrlScreen,
                                arguments: '',
                              );
                            }
                          },
                          leading: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          title: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate("Join new Organization"),
                          ),
                        ),
                        userConfig.loggedIn
                            ? ListTile(
                                key: MainScreenViewModel
                                    .keyDrawerLeaveCurrentOrg,
                                onTap: () => navigationService
                                    .pushDialog(model.exitAlertDialog()),
                                leading: const Icon(Icons.logout, size: 30),
                                title: Text(
                                  AppLocalizations.of(context)!
                                      .strictTranslate(
                                    "Leave Current Organization",
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          key: const Key("Sized Box Drawer"),
                          height: SizeConfig.screenHeight! * 0.03,
                        ),
                        const FromPalisadoes(key: Key("From Palisadoes")),
                        SizedBox(
                          key: const Key("Sized BottomBox Drawer"),
                          height: SizeConfig.screenHeight! * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [custom\_drawer](../../widgets_custom_drawer/widgets_custom_drawer-library.html)
3. [CustomDrawer](../../widgets_custom_drawer/CustomDrawer-class.html)
4. build method

##### CustomDrawer class





talawa
1.0.0+1






