import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/funds/fund_campaign.dart';

void main() {
  group('Campaign Model', () {
    test('fromJson parses all fields correctly', () {
      final json = {
        'id': 'camp1',
        'fund': {'id': 'fund1'},
        'name': 'Campaign 1',
        'startAt': '2025-08-14T13:46:48.563Z',
        'endAt': '2025-08-15T13:46:48.563Z',
        'goalAmount': 1000,
        'currencyCode': 'USD',
        'pledgedAmount': 500,
        'pledges': null,
      };

      final campaign = Campaign.fromJson(json);

      expect(campaign.id, 'camp1');
      expect(campaign.fundId, 'fund1');
      expect(campaign.name, 'Campaign 1');
      expect(campaign.startDate, DateTime.parse('2025-08-14T13:46:48.563Z'));
      expect(campaign.endDate, DateTime.parse('2025-08-15T13:46:48.563Z'));
      expect(campaign.goalAmount, 1000.0);
      expect(campaign.currency, 'USD');
      expect(campaign.pledgedAmount, 500.0);
      expect(campaign.pledges, isNull);
    });

    test('fromJson handles missing fields', () {
      final json = {
        'id': 'camp2',
        'fundId': 'fund2',
        'name': 'Campaign 2',
      };

      final campaign = Campaign.fromJson(json);

      expect(campaign.id, 'camp2');
      expect(campaign.fundId, 'fund2');
      expect(campaign.name, 'Campaign 2');
      expect(campaign.startDate, isNull);
      expect(campaign.endDate, isNull);
      expect(campaign.goalAmount, isNull);
      expect(campaign.currency, isNull);
      expect(campaign.pledgedAmount, 0.0);
      expect(campaign.pledges, isNull);
    });
  });
}
