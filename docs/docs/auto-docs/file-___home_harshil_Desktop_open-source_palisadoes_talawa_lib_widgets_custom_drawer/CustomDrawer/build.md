




build method - CustomDrawer class - custom\_drawer library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_drawer.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_drawer/)
3. [CustomDrawer](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_drawer/CustomDrawer-class.html)
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
2. [custom\_drawer](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_drawer/)
3. [CustomDrawer](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_drawer/CustomDrawer-class.html)
4. build method

##### CustomDrawer class





talawa
1.0.0+1






