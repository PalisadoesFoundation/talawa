


# build method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) build
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)

_<span class="feature">override</span>_



<p>Describes the part of the user interface represented by this widget.</p>
<p>The framework calls this method when this widget is inserted into the tree
in a given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> and when the dependencies of this widget change
(e.g., an <a href="https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html">InheritedWidget</a> referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.</p>
<p>The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling <a href="https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html">Widget.canUpdate</a>.</p>
<p>Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>.</p>
<p>The given <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a> contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different <a href="https://api.flutter.dev/flutter/widgets/BuildContext-class.html">BuildContext</a>
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.</p>
<p>The implementation of this method must only depend on:</p>
<ul>
<li>the fields of the widget, which themselves must not change over time,
and</li>
<li>any ambient state obtained from the <code>context</code> using
<a href="https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html">BuildContext.dependOnInheritedWidgetOfExactType</a>.</li>
</ul>
<p>If a widget's <a href="../../widgets_custom_drawer/CustomDrawer/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
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
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //A material design Drawer header that identifies the app's user.
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CustomAvatar(
                      isImageNull: model.selectedOrg?.image == null,
                      imageUrl: model.selectedOrg?.image,
                      firstAlphabet: model.selectedOrg?.name!.substring(0, 1),
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
                        )
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
                                onTap: () => model
                                    .switchOrg(model.switchAbleOrg[index]),
                                leading: CustomAvatar(
                                  isImageNull:
                                      model.switchAbleOrg[index].image ==
                                          null,
                                  imageUrl: model.switchAbleOrg[index].image,
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
                  const Divider(),
                  // A Tile to join a new organization
                  ListTile(
                    key: MainScreenViewModel.keyDrawerJoinOrg,
                    onTap: () => navigationService
                        .popAndPushScreen(Routes.joinOrg, arguments: '-1'),
                    leading: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!
                          .strictTranslate("Join new Organization"),
                    ),
                  ),
                  ListTile(
                    key: MainScreenViewModel.keyDrawerLeaveCurrentOrg,
                    onTap: () => exitButton(),
                    leading: const Icon(Icons.logout, size: 30),
                    title: Text(
                      AppLocalizations.of(context)!
                          .strictTranslate("Leave Current Organization"),
                    ),
                  ),
                  SizedBox(
                    key: const Key("Sized Box Drawer"),
                    height: SizeConfig.screenHeight! * 0.03,
                  ),
                  const FromPalisadoes(key: Key("From Palisadoes")),
                  SizedBox(
                    key: const Key("Sized BottomBox Drawer"),
                    height: SizeConfig.screenHeight! * 0.03,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
```







