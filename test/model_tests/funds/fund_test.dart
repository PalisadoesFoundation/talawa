import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Fund Model', () {
    test('fromJson parses all fields correctly', () {
      final json = {
        'id': 'fund1',
        'name': 'Education Fund',
        'isTaxDeductible': true,
        'creator': {
          'id': 'user1',
          'name': 'Alice',
        },
        'campaigns': [
          {
            'id': 'camp1',
            'name': 'Campaign 1',
            'startAt': '2025-08-14T13:46:48.563Z',
            'endAt': '2025-08-15T13:46:48.563Z',
            'goalAmount': 1000,
            'currencyCode': 'USD',
            'pledgedAmount': 500,
          }
        ],
        'createdAt': '2025-08-14T13:46:48.563Z',
        'updatedAt': '2025-08-15T13:46:48.563Z',
      };

      final fund = Fund.fromJson(json);

      expect(fund.id, 'fund1');
      expect(fund.name, 'Education Fund');
      expect(fund.taxDeductible, true);
      expect(fund.creator, isA<User>());
      expect(fund.creator?.id, 'user1');
      expect(fund.campaigns, isA<List<Campaign>>());
      expect(fund.campaigns?.first.id, 'camp1');
      expect(fund.createdAt, DateTime.parse('2025-08-14T13:46:48.563Z'));
      expect(fund.updatedAt, DateTime.parse('2025-08-15T13:46:48.563Z'));
    });

    test('fromJson handles null campaigns', () {
      final json = {
        'id': 'fund2',
        'name': 'Health Fund',
        'isTaxDeductible': false,
        'creator': null,
        'campaigns': null,
        'createdAt': null,
        'updatedAt': null,
      };

      final fund = Fund.fromJson(json);

      expect(fund.campaigns, isNull);
      expect(fund.creator, isNull);
      expect(fund.createdAt, isNull);
      expect(fund.updatedAt, isNull);
    });
  });
}
