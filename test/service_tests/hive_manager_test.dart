import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/services/hive_manager.dart';

void main() {
  test('tearDownHive', () async {
    await HiveManager.teardownHive();

    expect(Hive.isBoxOpen(HiveKeys.userBoxKey), isFalse);
    expect(Hive.isBoxOpen(HiveKeys.orgBoxKey), isFalse);
    expect(Hive.isBoxOpen(HiveKeys.asymetricKeyBoxKey), isFalse);
    expect(Hive.isBoxOpen(HiveKeys.pluginBoxKey), isFalse);
    expect(Hive.isBoxOpen(HiveKeys.urlBoxKey), isFalse);
    expect(Hive.isBoxOpen(HiveKeys.offlineActionQueueKey), isFalse);
    expect(Hive.isBoxOpen(HiveKeys.postFeedKey), isFalse);
    expect(Hive.isBoxOpen(HiveKeys.eventFeedKey), isFalse);
  });
}
