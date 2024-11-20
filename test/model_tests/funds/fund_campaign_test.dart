import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';

void main() {
  group('Test Campaign Model', () {
    test('Test Campaign fromJson', () {
      final campaignJson = {
        '_id': 'campaign1',
        'fundId': 'fund1',
        'name': 'Annual Fundraiser',
        'startDate': '2024-01-01T00:00:00Z',
        'endDate': '2024-12-31T23:59:59Z',
        'fundingGoal': 10000.0,
        'currency': 'USD',
        'pledges': [Pledge(id: 'pledge1')],
        'createdAt': '2024-01-01T00:00:00Z',
        'updatedAt': '2024-01-02T00:00:00Z',
      };

      final campaign = Campaign.fromJson(campaignJson);

      expect(campaign.id, 'campaign1');
      expect(campaign.fundId, 'fund1');
      expect(campaign.name, 'Annual Fundraiser');
      expect(campaign.startDate, DateTime.parse('2024-01-01T00:00:00Z'));
      expect(campaign.endDate, DateTime.parse('2024-12-31T23:59:59Z'));
      expect(campaign.fundingGoal, 10000.0);
      expect(campaign.currency, 'USD');
      expect(campaign.pledges?.length, 1);
      expect(campaign.pledges?[0].id, 'pledge1');
      expect(campaign.createdAt, DateTime.parse('2024-01-01T00:00:00Z'));
      expect(campaign.updatedAt, DateTime.parse('2024-01-02T00:00:00Z'));
    });

    test('Test Campaign fromJson with null values', () {
      final campaignJson = {
        '_id': null,
        'fundId': null,
        'name': null,
        'startDate': null,
        'endDate': null,
        'fundingGoal': null,
        'currency': null,
        'pledges': null,
        'createdAt': null,
        'updatedAt': null,
      };

      final campaign = Campaign.fromJson(campaignJson);

      expect(campaign.id, isNull);
      expect(campaign.fundId, isNull);
      expect(campaign.name, isNull);
      expect(campaign.startDate, isNull);
      expect(campaign.endDate, isNull);
      expect(campaign.fundingGoal, isNull);
      expect(campaign.currency, isNull);
      expect(campaign.pledges, isNull);
      expect(campaign.createdAt, isNull);
      expect(campaign.updatedAt, isNull);
    });
  });
}
