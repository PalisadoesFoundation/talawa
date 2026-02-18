import 'package:flutter/material.dart';
import 'package:talawa/plugin/types.dart';
import 'manifest.dart';
import 'routes.dart';
import 'pages.dart';
import 'injectors.dart';

/// Razorpay Payment Gateway Plugin
/// 
/// Provides donation and transaction management features
class RazorpayPlugin implements TalawaMobilePlugin {
  @override
  PluginManifest get manifest => pluginRazorpayManifest;

  @override
  List<PluginRoute> getRoutes() {
    return [
      PluginRoute(
        routeName: RazorpayRoutes.donation,
        builder: (context) => const RazorpayDonationPage(),
      ),
      PluginRoute(
        routeName: RazorpayRoutes.transactions,
        builder: (context) => const RazorpayTransactionsPage(),
      ),
    ];
  }

  @override
  List<PluginMenuItem> getMenuItems(BuildContext context) {
    return [
      PluginMenuItem(
        title: 'Donate (Razorpay)',
        subtitle: 'Make a donation via Razorpay',
        icon: Icons.payment,
        routeName: RazorpayRoutes.donation,
      ),
      PluginMenuItem(
        title: 'My Transactions',
        subtitle: 'View your payment history',
        icon: Icons.receipt_long,
        routeName: RazorpayRoutes.transactions,
      ),
    ];
  }

  @override
  PluginExtensions getExtensions() {
    return PluginExtensions(
      g1: g1MenuInjectors(),
    );
  }
}
