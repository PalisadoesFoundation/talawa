::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/user_config.dart](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  userLogOut method

::: self-name
userLogOut
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [userLogOut]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[userLogOut]{.name}()
:::

::: {.section .desc .markdown}
Logs out the current user.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> userLogOut() async {
  await actionHandlerService.performAction(
    actionType: ActionType.critical,
    criticalActionFailureMessage: TalawaErrors.youAreOfflineUnableToLogout,
    action: () async {
      navigationService.pop();
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('LogoutProgress'),
        ),
      );
      return await databaseFunctions.gqlAuthMutation(queries.logout());
    },
    onValidResult: (result) async {
      if (result.data != null && result.data!['logout'] == true) {
        // throw StateError('error');

        final user = Hive.box<User>('currentUser');
        final url = Hive.box('url');
        final organisation = Hive.box<OrgInfo>('currentOrg');
        // final androidFirebaseOptionsBox = Hive.box('androidFirebaseOptions');
        // final iosFirebaseOptionsBox = Hive.box('iosFirebaseOptions');
        await user.clear();
        await url.clear();
        await organisation.clear();
        // androidFirebaseOptionsBox.clear();
        // iosFirebaseOptionsBox.clear();
        // try {
        //   Firebase.app()
        //       .delete(); // Deleting app will stop all Firebase plugins
        // } catch (e) {
        //   debugPrint("ERROR: Unable to delete firebase app $e");
        // }
        _currentUser = User(id: 'null', authToken: 'null');
      }
    },
    onActionException: (e) async {
      navigationService.pushDialog(
        const TalawaErrorDialog(
          'Unable to logout, please try again.',
          key: Key('TalawaError'),
          messageType: MessageType.error,
        ),
      );
    },
    updateUI: () {
      navigationService.pop();
    },
    apiCallSuccessUpdateUI: () {
      navigationService.removeAllAndPush(
        Routes.setUrlScreen,
        Routes.splashScreen,
        arguments: '',
      );
    },
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  userLogOut method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
