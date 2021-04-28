//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars
//extra packages are called here which are being imported in the pubsec.yaml
import 'package:connectivity_for_web/connectivity_for_web.dart';
// ignore: implementation_imports
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  ConnectivityPlugin.registerWith(registrar);
  FluttertoastWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
