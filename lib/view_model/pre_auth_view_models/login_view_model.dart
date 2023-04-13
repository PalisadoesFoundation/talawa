// ignore_for_file: talawa_api_doc, avoid_dynamic_calls
// ignore_for_file: talawa_good_doc_comments

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/main.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// LoginViewModel class helps to interact with model to serve data
/// and react to user's input in Login View.
///
/// Methods include:
/// * `login`
class LoginViewModel extends BaseModel {
  // variables
  final formKey = GlobalKey<FormState>();
  late List<Map<String, dynamic>> greeting;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  FocusNode passwordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  AutovalidateMode validate = AutovalidateMode.disabled;
  bool hidePassword = true;

  // initialiser
  void initialize() {
    // greating message
    greeting = [
      {
        'text': "We're ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall
      },
      {
        'text': 'Glad ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24)
      },
      {
        'text': "you're ",
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .headlineSmall
      },
      {
        'text': 'Back ',
        'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 24)
      },
    ];
  }

  /// This function is used to sign-in the user into application.
  Future<void> login() async {
    emailFocus.unfocus();
    passwordFocus.unfocus();
    validate = AutovalidateMode.always;
    // if the email and password are not empty.
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      navigationService
          .pushDialog(const CustomProgressDialog(key: Key('LoginProgress')));
      databaseFunctions.init();
      try {
        // run the graph QL query to login the user, passing `email` and `password`.
        final result = await databaseFunctions
            .gqlNonAuthMutation(queries.loginUser(email.text, password.text));
        navigationService.pop();
        // if user found.
        if (result != null) {
          final User loggedInUser =
              User.fromJson(result.data!['login'] as Map<String, dynamic>);
          userConfig.updateUser(loggedInUser);
          // if user has not already joined any organization.
          if (userConfig.currentUser.joinedOrganizations!.isEmpty) {
            navigationService.removeAllAndPush(
              Routes.waitingScreen,
              Routes.splashScreen,
            );
          } else {
            userConfig.saveCurrentOrgInHive(
              userConfig.currentUser.joinedOrganizations![0],
            );
            navigationService.removeAllAndPush(
              Routes.mainScreen,
              Routes.splashScreen,
              arguments: MainScreenArgs(mainScreenIndex: 0, fromSignUp: false),
            );
          }
          final loginResult = result.data['login'] as Map<String, dynamic>;
          androidFirebaseOptions =
              loginResult['androidFirebaseOptions'] as Map<String, dynamic>;
          iosFirebaseOptions =
              loginResult['iosFirebaseOptions'] as Map<String, dynamic>;
          if (androidFirebaseOptions['apiKey'] != null ||
              iosFirebaseOptions['apiKey'] != null) {
            await setUpFirebase();

            final token = await FirebaseMessaging.instance.getToken();
            await databaseFunctions.gqlAuthMutation(
              queries.saveFcmToken(token),
            );

            await setUpFirebaseMessaging();

            final androidFirebaseOptionsBox =
                await Hive.openBox('androidFirebaseOptions');
            androidFirebaseOptionsBox.put(
              'androidFirebaseOptions',
              androidFirebaseOptions,
            );

            final iosFirebaseOptionsBox =
                await Hive.openBox('iosFirebaseOptions');
            iosFirebaseOptionsBox.put(
              'iosFirebaseOptions',
              iosFirebaseOptions,
            );
          }
        }
      } on Exception catch (e) {
        print('here');
        print(e);
      }
    }
  }
}
