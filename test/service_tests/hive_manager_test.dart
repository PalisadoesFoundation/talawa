import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/hive_manager.dart';

void main() {
  group('test HiveManager', () {
    test('tearDownHive', () async {
      await HiveManager.teardownHive();

      expect(Hive.isBoxOpen(HiveKeys.userBoxKey), isFalse);
      expect(Hive.isBoxOpen(HiveKeys.orgBoxKey), isFalse);
      expect(Hive.isBoxOpen(HiveKeys.urlBoxKey), isFalse);
      expect(Hive.isBoxOpen(HiveKeys.offlineActionQueueKey), isFalse);
      expect(Hive.isBoxOpen(HiveKeys.postFeedKey), isFalse);
      expect(Hive.isBoxOpen(HiveKeys.eventFeedKey), isFalse);

      await HiveManager.teardownHive();
    });

    test('openBox', () async {
      await HiveManager.openBox<OrgInfo>(HiveKeys.orgBoxKey);
      await HiveManager.openBox<User>(HiveKeys.orgBoxKey);
    });

    test('closeHiveBox', () async {
      await HiveManager.closeBox('xyz');
    });

    test('registerAdapter', () async {
      await HiveManager.registerAdapter(UserAdapter());
    });
  });
}
