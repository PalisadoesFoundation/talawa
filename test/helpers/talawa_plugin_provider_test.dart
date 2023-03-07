// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/plugins/talawa_plugin_provider.dart';

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
