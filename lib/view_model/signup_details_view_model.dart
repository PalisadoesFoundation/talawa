import 'package:flutter/material.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/models/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/locator.dart';

class SignupDetailsViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  final formKey = GlobalKey<FormState>();
  late OrgInfo selectedOrganization;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  FocusNode confirmFocus = FocusNode();
  bool hidePassword = true;
  AutovalidateMode validate = AutovalidateMode.disabled;

  initialise(OrgInfo org) {
    selectedOrganization = org;
    greeting = [
      {
        'text': "Let's ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'get ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': "you ",
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'SignUp ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24)
      },
    ];
  }

  next() async {
    FocusScope.of(locator<NavigationService>().navigatorKey.currentContext!)
        .unfocus();
    setState(ViewState.busy);
    validate = AutovalidateMode.always;
    setState(ViewState.idle);
    if (formKey.currentState!.validate()) {
      validate = AutovalidateMode.disabled;
      final bool signUpSuccess = await locator<DataBaseMutationFunctions>()
          .signup('test', 'test', 'test9@gsoc.us', 'Test@123');
      if (signUpSuccess) {
        locator<GraphqlConfig>().getToken();
        if (selectedOrganization.isPublic!) {
          final bool successJoin = await locator<DataBaseMutationFunctions>()
              .joinPublicOrg(selectedOrganization.id!);
          if (successJoin) {
            locator<UserConfig>().currentUser!.print();
            locator<NavigationService>().removeAllAndPush('/mainScreen', '/');
          } else {
            locator<NavigationService>().showSnackBar('SomeThing went wrong');
          }
        } else {
          final bool successRequest = await locator<DataBaseMutationFunctions>()
              .sendMembershipRequest(selectedOrganization.id!);
          if (successRequest) {
            locator<UserConfig>().currentUser!.print();
            locator<NavigationService>().removeAllAndPush('/waiting', '/');
          } else {
            locator<NavigationService>().showSnackBar('SomeThing went wrong');
          }
        }
      }
    }
  }
}
