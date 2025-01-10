


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
<p>If a widget's <a href="../../views_after_auth_screens_profile_profile_page/ProfilePage/build.md">build</a> method is to depend on anything else, use a
<a href="https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html">StatefulWidget</a> instead.</p>
<p>See also:</p>
<ul>
<li><a href="https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html">StatelessWidget</a>, which contains the discussion on performance considerations.</li>
</ul>



## Implementation

```dart
@override
Widget build(BuildContext context) {
  return BaseView<ProfilePageViewModel>(
    onModelReady: (model) => model.initialize(),
    builder: (context, model, child) {
      return Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            color: Theme.of(context).iconTheme.color,
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
                ),
          ),
        ),
        // if data fetching is under process then renders Circular Progress Icon
        // else renders the widget.
        body: model.isBusy
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    CustomListTile(
                      key: const Key('OptionEditProfile'),
                      index: 0,
                      type: TileType.option,
                      option: Options(
                        // Avatar
                        icon: CustomAvatar(
                          isImageNull: model.currentUser.image == null,
                          firstAlphabet:
                              model.currentUser.firstName!.substring(0, 1),
                          imageUrl: model.currentUser.image,
                          fontSize: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .fontSize,
                        ),
                        // display first and last name.
                        title:
                            '${model.currentUser.firstName!} ${model.currentUser.lastName!}',
                        // display email address
                        subtitle: model.currentUser.email!,
                        // button to edit the profile which redirects to edit profile page.
                        trailingIconButton: IconButton(
                          icon: Icon(
                            Icons.drive_file_rename_outline,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            navigationService.pushScreen("/editProfilePage");
                          },
                        ),
                      ),
                      onTapOption: () {},
                    ),
                    const Divider(
                      thickness: 1, // thickness of the line
                      indent:
                          20, // empty space to the leading edge of divider.
                      endIndent:
                          20, // empty space to the trailing edge of the divider.
                      color: Colors
                          .black26, // The color to use when painting the line.
                      height: 20, //
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.67,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.01,
                          ),
                          CustomListTile(
                            key: homeModel!.keySPAppSetting,
                            index: 0,
                            type: TileType.option,
                            option: Options(
                              icon: Icon(
                                Icons.phonelink_setup,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                                size: 30,
                              ),
                              // title for App Settings.
                              title: AppLocalizations.of(context)!
                                  .strictTranslate('App Settings'),
                              // display language of the app.
                              subtitle:
                                  '${AppLocalizations.of(context)!.strictTranslate("Language")}, ${AppLocalizations.of(context)!.strictTranslate("dark mode")}, ${AppLocalizations.of(context)!.strictTranslate("font size")}',
                            ),
                            // button for the app setting which redirects to app setting page.
                            onTapOption: () {
                              navigationService
                                  .pushScreen("/appSettingsPage");
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.05,
                          ),
                          CustomListTile(
                            key: const Key('TasksByUser'),
                            index: 1,
                            type: TileType.option,
                            option: Options(
                              icon: Icon(
                                Icons.task_outlined,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                                size: 30,
                              ),
                              // title for My Tasks tile
                              title: AppLocalizations.of(context)!
                                  .strictTranslate('My Tasks'),
                              // display subtitle
                              subtitle: AppLocalizations.of(context)!
                                  .strictTranslate(
                                "View and edit all tasks created by you",
                              ),
                            ),
                            // on tag redirects to the user Tasks page.
                            onTapOption: () {
                              navigationService.pushScreen(Routes.userTasks);
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.05,
                          ),
                          // // Will be added later when we add the Help Section in Documentation.
                          // CustomListTile(
                          //   key: homeModel!.keySPHelp,
                          //   index: 1,
                          //   type: TileType.option,
                          //   option: Options(
                          //     icon: const Icon(
                          //       Icons.help_outline,
                          //       size: 30,
                          //     ),
                          //     title: AppLocalizations.of(context)!
                          //         .strictTranslate('Help'),
                          //     subtitle: AppLocalizations.of(context)!
                          //         .strictTranslate(
                          //       'Reach out to us for help',
                          //     ),
                          //   ),
                          //   onTapOption: () {},
                          // ),
                          /// `Donation` acts as plugin. If visible is true the it will be always visible.
                          /// even if it's uninstalled by the admin (for development purposes)
                          TalawaPluginProvider(
                            pluginName: "Donation",
                            visible: true,
                            child: Column(
                              children: [
                                CustomListTile(
                                  key: homeModel!.keySPDonateUs,
                                  index: 2,
                                  type: TileType.option,
                                  option: Options(
                                    icon: Icon(
                                      Icons.monetization_on,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      size: 30,
                                    ),
                                    title: AppLocalizations.of(context)!
                                        .strictTranslate('Donate  Us'),
                                    subtitle: AppLocalizations.of(context)!
                                        .strictTranslate(
                                      'Help us to develop for you',
                                    ),
                                  ),
                                  onTapOption: () => donate(context, model),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight! * 0.05,
                                ),
                              ],
                            ),
                          ),
                          // custom tile for Invitation.
                          CustomListTile(
                            key: homeModel!.keySPInvite,
                            index: 3,
                            type: TileType.option,
                            option: Options(
                              icon: Icon(
                                Icons.share,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                                size: 30,
                              ),
                              // title
                              title: AppLocalizations.of(context)!
                                  .strictTranslate('Invite'),
                              // subtitle
                              subtitle: AppLocalizations.of(context)!
                                  .strictTranslate('Invite to org'),
                            ),
                            // on tap call the invite function
                            onTapOption: () => model.invite(context),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.05,
                          ),
                          // Custom tile for Logout option.
                          CustomListTile(
                            key: homeModel!.keySPLogout,
                            index: 3,
                            type: TileType.option,
                            option: Options(
                              icon: Icon(
                                Icons.logout,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                                size: 30,
                              ),
                              title: AppLocalizations.of(context)!
                                  .strictTranslate('Log out'),
                              subtitle: AppLocalizations.of(context)!
                                  .strictTranslate('Log out from Talawa'),
                            ),
                            // on tap calls the logout function
                            onTapOption: () => model.logout(context),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.05,
                          ),
                          FromPalisadoes(key: homeModel!.keySPPalisadoes),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      );
    },
  );
}
```







