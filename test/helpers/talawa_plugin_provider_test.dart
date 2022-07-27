import 'package:flutter/cupertino.dart';
import 'package:talawa/plugins/talawa_plugin_provider.dart';
import 'package:test/test.dart';

void main() {
  test('TalwaPluginProvider Test', () async {
    const talwaPluginProvider = TalawaPluginProvider(
      pluginName: "sample",
      visible: false,
      child: Text("hi"),
    );
    expect(talwaPluginProvider.visible, false);
    expect(talwaPluginProvider.pluginName, "sample");
  });
}
