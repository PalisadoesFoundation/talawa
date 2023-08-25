


# signUp method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> signUp
()





<p>This function is used to sign up the user into the application by passing the data to database query.
The function uses <code>gqlNonAuthMutation</code> method provided by <code>databaseFunctions</code> services.</p>



## Implementation

```dart
Future<void> signUp() async {
  FocusScope.of(navigationService.navigatorKey.currentContext!).unfocus();
  setState(ViewState.busy);
  validate = AutovalidateMode.always;
  setState(ViewState.idle);
  if (formKey.currentState!.validate()) {
    validate = AutovalidateMode.disabled;
    navigationService
        .pushDialog(const CustomProgressDialog(key: Key('SignUpProgress')));
    databaseFunctions.init();
    try {
      final result = await databaseFunctions.gqlNonAuthMutation(
        queries.registerUser(
          firstName.text,
          lastName.text,
          email.text,
          password.text,
        ),
      );
      navigationService.pop();
      if (result != null) {
        final User signedInUser =
            User.fromJson(result.data!['signUp'] as Map<String, dynamic>);
        final bool userSaved = await userConfig.updateUser(signedInUser);
        final bool tokenRefreshed = await graphqlConfig.getToken() as bool;
        // if user successfully saved and access token is also generated.
        if (userSaved && tokenRefreshed) {
          // if the selected organization is public.
          if (selectedOrganization.isPublic!) {
            try {
              final QueryResult result =
                  await databaseFunctions.gqlAuthMutation(
                queries.joinOrgById(selectedOrganization.id!),
              ) as QueryResult;

              final List<OrgInfo>? joinedOrg = (result
                          .data!['joinPublicOrganization']
                      ['joinedOrganizations'] as List<dynamic>?)
                  ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
                  .toList();
              userConfig.updateUserJoinedOrg(joinedOrg!);
              userConfig.saveCurrentOrgInHive(
                userConfig.currentUser.joinedOrganizations![0],
              );
              navigationService.removeAllAndPush(
                Routes.mainScreen,
                Routes.splashScreen,
                arguments:
                    MainScreenArgs(mainScreenIndex: 0, fromSignUp: true),
              );
            } on Exception catch (e) {
              print(e);
              navigationService.showTalawaErrorSnackBar(
                'SomeThing went wrong',
                MessageType.error,
              );
            }
          } else {
            try {
              final QueryResult result =
                  await databaseFunctions.gqlAuthMutation(
                queries.sendMembershipRequest(selectedOrganization.id!),
              ) as QueryResult;

              final OrgInfo membershipRequest = OrgInfo.fromJson(
                result.data!['sendMembershipRequest']['organization']
                    as Map<String, dynamic>,
              );
              userConfig.updateUserMemberRequestOrg([membershipRequest]);
              navigationService.pop();
              navigationService.removeAllAndPush(
                Routes.waitingScreen,
                Routes.splashScreen,
              );
            } on Exception catch (e) {
              print(e);
              navigationService.showTalawaErrorSnackBar(
                'SomeThing went wrong',
                MessageType.error,
              );
            }
          }
        }
      }
    } on Exception catch (e) {
      print(e);
      navigationService.showTalawaErrorSnackBar(
        'SomeThing went wrong',
        MessageType.error,
      );
    }
  }
}
```







