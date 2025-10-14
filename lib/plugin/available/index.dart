import 'package:talawa/plugin/available/hello_world/index.dart';
import 'package:talawa/plugin/types.dart';
import 'package:talawa/plugin/available/plugin_map/index.dart';
import 'package:talawa/plugin/available/razorpay/index.dart';

/// Pre-bundled plugins in the mobile app.
List<TalawaMobilePlugin> getBundledPlugins() => [
      HelloWorldPlugin(),
      PluginMapAppPlugin(),
      RazorpayPlugin(),
    ];
