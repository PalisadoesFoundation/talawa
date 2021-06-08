import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/widgets/progress_dialog.dart';

class SetUrlViewModel extends BaseModel {
  final navigatorService = locator<NavigationService>();
  final graphqlService = locator<GraphqlConfig>();
  final formKey = GlobalKey<FormState>();
  static const imageUrlKey = "imageUrl";
  static const urlKey = "url";
  TextEditingController url = TextEditingController();
  FocusNode urlFocus = FocusNode();
  late List<Map<String, dynamic>> greeting;
  AutovalidateMode validate = AutovalidateMode.disabled;

  initialise({String inviteUrl = ''}) {
    final uri = inviteUrl;
    if (uri.isNotEmpty) {
      final box = Hive.box('url');
      box.put(urlKey, uri);
      box.put(imageUrlKey, "$uri/talawa/");
      graphqlService.getOrgUrl();
    }
    greeting = [
      {
        'text': 'Join ',
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'and ',
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'Collaborate ',
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'with your ',
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline5
      },
      {
        'text': 'Organizations',
        'textStyle': Theme.of(navigatorService.navigatorKey.currentContext!)
            .textTheme
            .headline5!
            .copyWith(fontSize: 24, color: const Color(0xFF4285F4))
      },
    ];
  }

  Future<void> checkURLandNavigate(String navigateTo, String argument) async {
    urlFocus.unfocus();
    validate = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      navigatorService
          .pushDialog(const ProgressDialog(key: Key('UrlCheckProgress')));
      validate = AutovalidateMode.disabled;
      final String uri = url.text.trim();
      final bool? urlPresent = await Validator.validateUrlExistence(uri);
      if (urlPresent! == true) {
        final box = Hive.box('url');
        box.put(urlKey, uri);
        box.put(imageUrlKey, "$uri/talawa/");

        navigatorService.pop();
        graphqlService.getOrgUrl();
        navigatorService.pushScreen(navigateTo, arguments: argument);
      } else {
        navigatorService
            .showSnackBar("URL doesn't exist/no connection please check");
      }
    }
  }
}
