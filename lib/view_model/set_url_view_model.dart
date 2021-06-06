import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/widgets/progress_dialog.dart';

class SetUrlViewModel extends BaseModel {
  late List<Map<String, dynamic>> greeting;
  static const urlKey = "url";
  static const imageUrlKey = "imageUrl";
  final formKey = GlobalKey<FormState>();
  TextEditingController url = TextEditingController();
  FocusNode urlFocus = FocusNode();
  AutovalidateMode validate = AutovalidateMode.disabled;

  initialise() {
    greeting = [
      {
        'text': 'Join ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'and ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'Collaborate ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w700)
      },
      {
        'text': 'with     your ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline5
      },
      {
        'text': 'Organizations',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
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
      locator<NavigationService>()
          .pushDialog(const ProgressDialog(key: Key('UrlCheckProgress')));
      validate = AutovalidateMode.disabled;
      final bool? urlPresent = await Validator.validateUrlExistence(url.text);
      if (urlPresent!) {
        final box = Hive.box('url');
        box.put(urlKey, url.text);
        box.put(imageUrlKey, "${url.text}/talawa/");

        locator<NavigationService>().pop();
        locator<GraphqlConfig>().getOrgUrl();
        locator<NavigationService>()
            .pushScreen(navigateTo, arguments: argument);
      } else {
        locator<NavigationService>()
            .showSnackBar("URL doesn't exist/no connection please check");
      }
    }
  }
}
