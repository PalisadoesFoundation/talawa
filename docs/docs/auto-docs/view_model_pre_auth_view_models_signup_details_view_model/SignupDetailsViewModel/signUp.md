
<div>

# signUp method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Initiates the sign-up process.

Handles the sign-up process by performing the following steps:

1.  Unfocusing the current focus scope.
2.  Setting the view state to `ViewState.busy`.
3.  Setting validation mode to `AutovalidateMode.always`.
4.  Setting the view state to `ViewState.idle`.
5.  Validating the form using the form key.
6.  If validation is successful, disabling auto-validation mode and
    initiating the sign-up.
7.  Displaying a custom progress dialog during sign-up.
8.  Initializing database functions.
9.  Performing a GraphQL mutation to register the user with provided
    details (first name, last name, email, password).
10. Handling the result of the sign-up operation:
    -   Updating the current user with the received data.
    -   Refreshing the access token.
    -   Joining a public organization or sending a membership request
        based on the selected organization.

In case of any exceptions during the sign-up process, this function
catches and prints the error and displays a Talawa error snackbar with a
corresponding message.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  FocusScope.of(navigationService.navigatorKey.currentContext!).;
  setState(ViewState.busy);
  validate = AutovalidateMode.always;
  setState(ViewState.idle);
  if (formKey.currentState!.) {
    validate = AutovalidateMode.disabled;
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: TalawaErrors.youAreOfflineUnableToSignUp,
      action: () async {
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('SignUpProgress'),
          ),
        );
        databaseFunctions.;
        final String query;
        if (selectedOrganization != null) {
          query = queries.registerUser(
            firstName.text,
            lastName.text,
            email.text,
            Encryptor.encryptString(
              password.text,
            ),
            selectedOrganization?.id,
          );
        } else {
          query = queries.registerUser(
            firstName.text,
            lastName.text,
            email.text,
            Encryptor.encryptString(
              password.text,
            ),
            null,
          );
        }

        final result = await databaseFunctions.gqlNonAuthMutation(query);
        navigationService.;
        return result;
      },
      onValidResult: (result) async {
        if (result.data != null) {
          final User signedInUser = User.fromJson(
            result.data!['signUp'] as Map<String, dynamic>,
          );
          final bool userSaved = await userConfig.updateUser(signedInUser);
          final bool tokenRefreshed = await graphqlConfig. as bool;
          // if user successfully saved and access token is also generated.
          if (userSaved && tokenRefreshed) {
            // if the selected organization userRegistration not required.
            if (selectedOrganization?.id == '-1') {
              navigationService.removeAllAndPush(
                Routes.mainScreen,
                Routes.splashScreen,
                arguments: MainScreenArgs(
                  mainScreenIndex: 0,
                  fromSignUp: false,
                ),
              );
              await ;
            } else {
              if (selectedOrganization!.userRegistrationRequired!) {
                final query = queries.joinOrgById(selectedOrganization!.id!);
                print(query);
                final QueryResult result =
                    await databaseFunctions.gqlAuthMutation(
                  query,
                );
                final joinPublicOrganization = result
                    .data!['joinPublicOrganization'] as Map<String, dynamic>;
                final List<OrgInfo>? joinedOrg = (joinPublicOrganization[
                        'joinedOrganizations'] as List<dynamic>?)
                    ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
                    .;
                await userConfig.updateUserJoinedOrg(joinedOrg!);
                userConfig.saveCurrentOrgInHive(
                  userConfig.currentUser.joinedOrganizations![0],
                );
                navigationService.removeAllAndPush(
                  Routes.mainScreen,
                  Routes.splashScreen,
                  arguments:
                      MainScreenArgs(mainScreenIndex: 0, fromSignUp: true),
                );
              } else {
                final QueryResult result =
                    await databaseFunctions.gqlAuthMutation(
                  queries.sendMembershipRequest(selectedOrganization!.id!),
                );
                final sendMembershipRequest = result
                    .data!['sendMembershipRequest'] as Map<String, dynamic>;
                final OrgInfo membershipRequest = OrgInfo.fromJson(
                  sendMembershipRequest['organization']
                      as Map<String, dynamic>,
                );
                userConfig.updateUserMemberRequestOrg([membershipRequest]);
                navigationService.;
                navigationService.removeAllAndPush(
                  Routes.waitingScreen,
                  Routes.splashScreen,
                );
              }
              await ;
            }
          }
        }
      },
      onActionException: (e) async {
        print(e);
        navigationService.showTalawaErrorSnackBar(
          'Something went wrong',
          MessageType.error,
        );
      },
    );
  }
}
```







1.  [talawa](../../index.html)
2.  [signup_details_view_model](../../view_model_pre_auth_view_models_signup_details_view_model/)
3.  [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
4.  signUp method

##### SignupDetailsViewModel class







