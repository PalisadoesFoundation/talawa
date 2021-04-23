import 'package:package_info/package_info.dart';

class PackageDetails {
  static Future<Map<String, dynamic>> getInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return <String, dynamic>{
      'appName': packageInfo.appName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };
  }
}
