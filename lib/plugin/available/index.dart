import 'package:talawa/plugin/types.dart';
import 'package:talawa/plugin/available/plugin_map/index.dart';
import 'package:talawa/plugin/available/razorpay/index.dart';
import 'package:talawa/plugin/available/summarize_t5/index.dart';

/// Pre-bundled plugins in the mobile app.
List<TalawaMobilePlugin> getBundledPlugins() => [
      PluginMapAppPlugin(),
      RazorpayPlugin(),
      SummarizeT5Plugin(),
    ];
