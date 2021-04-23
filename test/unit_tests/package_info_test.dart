import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info/package_info.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/package_info');

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return {'appName': 'talawa', 'version': '1.0.0', 'buildNumber': '1'};
  });
  final packageInfo = await PackageInfo.fromPlatform();
  group('Testing mocked package_info plugin', () {
    test('Test for name of the App', () async {
      expect(packageInfo.appName, 'talawa');
    });
    test('Test for version of App', () async {
      expect(packageInfo.version, '1.0.0');
    });
    test('Test for buildNumber of App', () async {
      expect(packageInfo.buildNumber, '1');
    });
  });

  channel.setMockMethodCallHandler(null);
}
