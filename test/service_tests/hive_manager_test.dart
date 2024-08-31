import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/hive_manager.dart';

void main() {
  test('tearDownHive', () async {
    await HiveManager.teardownHive();
  });
}
