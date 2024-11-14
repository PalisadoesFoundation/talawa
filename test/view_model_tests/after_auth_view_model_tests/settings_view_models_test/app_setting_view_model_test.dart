// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/settings_view_models/app_setting_view_model.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockUrlLauncher extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {
  @override
  Future<bool> launchUrl(String url, LaunchOptions? options) {
    if (url == 'http://www.success.com') return Future.value(true);
    return Future.value(false);
  }
}

void main() async {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    SizeConfig().test();
    testSetupLocator();
  });

  group('Test for appSettingviewModel', () {
    setUpAll(() async {
      getAndRegisterNavigationService();
      getAndRegisterUserConfig();
      final mock = MockUrlLauncher();
      UrlLauncherPlatform.instance = mock;
    });

    test('Test logout function.', () {
      final model = AppSettingViewModel();
      model.logout();
    });

    test('test for launchWebsite method', () async {
      final model = AppSettingViewModel();
      const successUrl = 'http://www.success.com';
      const failUrl = 'http://www.fail.com';

      bool opened = false;

      // if successfully launches the website.
      opened = await model.launchWebsite(successUrl);
      expect(opened, true);

      // if failed to launch the website.
      opened = await model.launchWebsite(failUrl);
      expect(opened, false);
    });
  });
}
