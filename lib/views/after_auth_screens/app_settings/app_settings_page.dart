import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';
import 'package:talawa/widgets/lang_switch.dart';
import 'package:talawa/widgets/talawa_error_dialog.dart';
import 'package:talawa/widgets/theme_switch.dart';

/// Widget representing the App Settings page.
///
/// This widget represents the settings page of the application.
/// It allows users to configure various application settings.
class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold implements the basic Material Design visual layout structure.
    //Learn more about Scaffold class
    //[here](https://api.flutter.dev/flutter/material/Scaffold-class.html).
    // const String _talawaWebsite = '';
    const String talawaDocs = 'https://docs.talawa.io';
    const String talawaGithub =
        'https://github.com/PalisadoesFoundation/talawa';
    return BaseView<AppSettingViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          key: const Key('AppSettingScaffold'),
          // AppBar is a horizontal bar typically shown at the top of an app using the appBar property.
          appBar: AppBar(
            iconTheme: Theme.of(context).iconTheme,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            centerTitle: true,
            // title of the page in appBar property
            title: Text(
              // title text translation according to the app language.
              AppLocalizations.of(context)!.strictTranslate('Settings'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => navigationService.pop(),
            ),
          ),
          // style of the AppBar.
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   height: SizeConfig.screenHeight! * 0.77,
                //   child:
                // ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        userConfig.loggedIn
                            ? category(
                                context: context,
                                title: 'Profile',
                                listItems: [
                                  customListTile(
                                    leading: const Icon(Icons.edit),
                                    content: Text(
                                      AppLocalizations.of(context)!
                                          .strictTranslate('Edit Profile'),
                                    ),
                                    trailing: chevronButton(context: context),
                                    onTap: () {
                                      navigationService
                                          .pushScreen(Routes.editProfilePage);
                                    },
                                  ),
                                ],
                              )
                            : Container(),
                        category(
                          context: context,
                          title: 'General',
                          listItems: [
                            const ChangeThemeTile(),
                            const LanguageTile(),
                          ],
                        ),
                        category(
                          context: context,
                          title: 'Help & Support',
                          listItems: [
                            customListTile(
                              leading: const Icon(Icons.description),
                              content: Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('Talawa Docs'),
                              ),
                              trailing: chevronButton(
                                context: context,
                              ),
                              onTap: () {
                                model.launchWebsite(talawaDocs);
                              },
                            ),
                            customListTile(
                              leading: const Icon(Icons.code),
                              content: Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate('Talawa Git-Hub'),
                              ),
                              trailing: chevronButton(
                                context: context,
                              ),
                              onTap: () {
                                model.launchWebsite(talawaGithub);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                footerTile(context: context, model: model),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Generates an Icon widget for a chevron (right arrow).
  ///
  /// **params**:
  /// * `context`: The BuildContext of the widget used to derive the theme's primary color.
  ///
  /// **returns**:
  /// * `Icon`: An Icon widget representing a chevron (right arrow).
  Icon chevronButton({required BuildContext context}) {
    return Icon(
      Icons.chevron_right,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  /// Custom List Tile Widget.
  ///
  /// This widget creates a custom list tile with customizable components such as
  /// leading, content, trailing, and an optional onTap callback.
  ///
  /// **params**:
  /// * `leading`: Widget displayed at the start of the list tile.
  /// * `content`: Widget displayed as the main content of the list tile.
  /// * `trailing`: Widget displayed at the end of the list tile.
  /// * `onTap`: Callback function triggered when the list tile is tapped.
  ///
  /// **returns**:
  /// * `Widget`: Returns a ListTile widget customized with the provided components.
  Widget customListTile({
    Widget? leading,
    required Widget content,
    required Widget trailing,
    required void Function()? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal!,
      ),
      leading: leading,
      title: content,
      trailing: trailing,
      onTap: onTap,
    );
  }

  /// Widget representing a category with a title and a list of items.
  ///
  /// Displays a category title along with a list of widgets.
  ///
  /// **params**:
  /// * `context`: The [BuildContext] of the widget.
  /// * `title`: The title of the category to be displayed.
  /// * `listItems`: A list of [Widget]s representing items in the category.
  ///
  /// **returns**:
  /// * `Widget`: A [Padding] widget containing a [Column] with the category title displayed using
  /// [catergoryHeader] and followed by the list of `listItems`.
  Widget category({
    required BuildContext context,
    required String title,
    required List<Widget> listItems,
  }) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical! * 1.5),
      child: Column(
        children: [
              catergoryHeader(context: context, title: title),
            ] +
            listItems,
      ),
    );
  }

  /// Creates a header widget for a category.
  ///
  /// This widget displays a title for a category with a divider line underneath.
  ///
  /// **params**:
  /// * `context`: The [BuildContext] associated with the widget.
  /// * `title`: The title string to be displayed for the category.
  ///
  /// **returns**:
  /// * `Widget`: Returns a [Widget] that represents the category header.
  Widget catergoryHeader({
    required BuildContext context,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              AppLocalizations.of(context)!.strictTranslate(title),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          customDivider(context: context),
        ],
      ),
    );
  }

  /// Widget representing a footer tile that performs different actions based on user login status.
  ///
  /// **params**:
  /// * `context`: The [BuildContext] of the widget.
  /// * `model`: An instance of [AppSettingViewModel] used for handling app settings.
  ///
  /// **returns**:
  /// * `Widget`: Returns a [Column] widget displaying a divider and a [TextButton] that varies its behavior based on user login status.
  Widget footerTile({
    required BuildContext context,
    required AppSettingViewModel model,
  }) {
    return Column(
      children: [
        customDivider(context: context),
        TextButton(
          key: const Key('Logout'),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userConfig.loggedIn
                    ? const Icon(
                        Icons.logout,
                        color: Colors.red,
                      )
                    : Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal! * 3,
                ),
                Text(
                  AppLocalizations.of(context)!.strictTranslate(
                    userConfig.loggedIn ? 'Logout' : 'Join an Organisation',
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          onPressed: () {
            userConfig.loggedIn
                ? showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialog(
                        reverse: true,
                        dialogSubTitle: 'Are you sure you want to logout?',
                        successText: 'LogOut',
                        success: () async {
                          try {
                            final bool isLogoutSuccessful =
                                await model.logout();
                            if (!isLogoutSuccessful) {
                              throw Error(); //checks whether the logout was successful or not.
                            }
                            navigationService.pop();
                            navigationService.removeAllAndPush(
                              '/selectLang',
                              '/',
                            );
                          } catch (e) {
                            navigationService.pushDialog(
                              const TalawaErrorDialog(
                                'Unable to logout, please try again.',
                                key: Key('TalawaError'),
                                messageType: MessageType.error,
                              ),
                            );
                          }
                        },
                      );
                    },
                  )
                : navigationService.pushScreen(
                    Routes.setUrlScreen,
                    arguments: '',
                  );
          },
        ),
      ],
    );
  }

  /// Builds a customized Divider widget based on the provided [BuildContext].
  ///
  /// This function creates a Divider widget using the provided [context] to obtain
  /// the appropriate divider color from the current app's theme.
  ///
  /// **params**:
  /// * `context`: The BuildContext used to access the current app's theme.
  ///
  /// **returns**:
  /// * `Widget`: Returns a Divider widget customized with the color from the app's theme.
  Widget customDivider({
    required BuildContext context,
  }) {
    return Divider(
      color: Theme.of(context).dividerColor,
    );
  }
}
