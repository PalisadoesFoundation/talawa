import 'package:talawa/plugin/types.dart';

/// Razorpay Plugin Manifest
/// 
/// Provides payment gateway integration for donations and transactions
const pluginRazorpayManifest = PluginManifest(
  id: 'razorpay',
  name: 'Razorpay Payment Gateway',
  description: 'Enable donations and payment transactions through Razorpay',
);

/// Razorpay Plugin Dependencies
/// 
/// External packages required by this plugin
const Map<String, String> razorpayDependencies = {
  'razorpay_flutter': '^1.3.7',
};
