import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info/package_info.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/package_info');

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return {'appName': 'talawa', 'version': '1.0.0', 'buildNumber': '1'};
  });
  final packageInfo = await PackageInfo.fromPlatform();
  print(packageInfo.appName);

  channel.setMockMethodCallHandler(null);
}
