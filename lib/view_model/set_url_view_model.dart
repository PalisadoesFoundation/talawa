import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/snackbar_service.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/locator.dart';
import 'package:http/http.dart' as http;

class SetUrlViewModel extends BaseModel {
  //services
  final _navigationService = locator<NavigationService>();
  final _graphqlConfigService = locator<GraphqlConfigService>();
  final _snackbarService = locator<SnackBarService>();

  //Variables
  bool _verified = false;
  late List<Map<String, dynamic>> greeting;
  static const _urlKey = "url";
  static const _imageUrlKey = "imageUrl";
  final formKey = GlobalKey<FormState>();
  final TextEditingController _url = TextEditingController();
  final FocusNode _urlFocus = FocusNode();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  AutovalidateMode validate = AutovalidateMode.disabled;

  // Getters
  bool get verified => _verified;
  FocusNode get urlNode => _urlFocus;
  TextEditingController get url => _url;

  // setters
  void setVerifiedURL({required bool val}) {
    _verified = val;
    notifyListeners();
  }

  void unfocus() {
    _urlFocus.unfocus();
    notifyListeners();
  }

  //Functions
  initialise() {
    greeting = [
      {
        'text': 'Join ',
        'textStyle':
            Theme.of(locator<NavigationService>().navigatorKey.currentContext!)
                .textTheme
                .headline6!
                .copyWith(fontSize: 32, fontWeight: FontWeight.w700)
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
                .copyWith(fontSize: 32, fontWeight: FontWeight.w700)
      },
      {
        'text': 'with your ',
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
                .copyWith(
                    fontSize: 32,
                    color: const Color(0xFF4285F4),
                    fontWeight: FontWeight.w700)
      },
    ];
  }

  void navigateTo(String route) {
    _navigationService.pushScreen(route);
  }

  Future<void> verifyURL() async {
    final String _urlString = _url.text;
    setState(ViewState.busy);
    print(_urlString);
    try {
      await http.get(Uri.parse(_urlString));
      await _storage.write(key: _urlKey, value: _urlString);
      await _storage.write(key: _imageUrlKey, value: "$_urlString/talawa/");
      setVerifiedURL(val: true);
      _graphqlConfigService.getOrgUrl();
    } catch (e) {
      _snackbarService
          .showSnackBar("URL doesn't exist/no connection please check");
    }
    print(await _storage.read(key: _urlKey));
    setState(ViewState.idle);
  }
}
