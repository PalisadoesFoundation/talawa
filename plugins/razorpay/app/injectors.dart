import 'package:flutter/material.dart';
import 'package:talawa/plugin/types.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/navigation_service.dart';
import 'manifest.dart';
import 'routes.dart';

/// g1 Menu Injectors for Razorpay Plugin
/// 
/// Provides two menu buttons:
/// 1. Donate (Razorpay) - Navigate to donation page
/// 2. My Transactions - View payment transaction history
List<PluginInjectorExtension> g1MenuInjectors() {
  return [
    PluginInjectorExtension(
      pluginId: pluginRazorpayManifest.id,
      name: 'Razorpay Payment Options',
      description: 'Donation and transaction management',
      order: 20, // After plugin_map (order: 10)
      builder: (context, {data}) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.payment, color: Colors.green),
                title: const Text('Donate (Razorpay)'),
                subtitle: const Text('Make a donation via Razorpay'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  locator<NavigationService>().pushScreen(
                    RazorpayRoutes.donation,
                  );
                },
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey.shade800,
              ),
              ListTile(
                leading: const Icon(Icons.receipt_long, color: Colors.blue),
                title: const Text('My Transactions'),
                subtitle: const Text('View your payment history'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  locator<NavigationService>().pushScreen(
                    RazorpayRoutes.transactions,
                  );
                },
              ),
            ],
          ),
        );
      },
    ),
  ];
}
