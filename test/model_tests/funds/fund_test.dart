import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/funds/fund.dart';
import 'package:talawa/models/funds/fund_campaign.dart';

void main() {
  group('Test Fund Model', () {
    test('Test Fund fromJson', () {
      final fundJson = {
        '_id': 'fund1',
        'organizationId': 'org1',
        'name': 'General Fund',
        'taxDeductible': true,
        'isDefault': false,
        'isArchived': false,
        'creator': {
          '_id': 'user1',
          'firstName': 'John',
          'lastName': 'Doe',
        },
        'campaigns': [Campaign(id: 'campaign1')],
        'createdAt': '2024-01-01T00:00:00Z',
        'updatedAt': '2024-01-02T00:00:00Z',
      };

      final fund = Fund.fromJson(fundJson);

      expect(fund.id, 'fund1');
      expect(fund.organizationId, 'org1');
      expect(fund.name, 'General Fund');
      expect(fund.taxDeductible, true);
      expect(fund.isDefault, false);
      expect(fund.isArchived, false);
      expect(fund.creator?.id, 'user1');
      expect(fund.campaigns?.length, 1);
      expect(fund.campaigns?[0].id, 'campaign1');
      expect(fund.createdAt, DateTime.parse('2024-01-01T00:00:00Z'));
      expect(fund.updatedAt, DateTime.parse('2024-01-02T00:00:00Z'));
    });

    test('Test Fund fromJson with null values', () {
      final fundJson = {
        '_id': null,
        'organizationId': null,
        'name': null,
        'referenceNumber': null,
        'taxDeductible': null,
        'isDefault': null,
        'isArchived': null,
        'creator': null,
        'campaigns': null,
        'createdAt': null,
        'updatedAt': null,
      };

      final fund = Fund.fromJson(fundJson);

      expect(fund.id, isNull);
      expect(fund.organizationId, isNull);
      expect(fund.name, isNull);
      expect(fund.taxDeductible, isNull);
      expect(fund.isDefault, isNull);
      expect(fund.isArchived, isNull);
      expect(fund.creator, isNull);
      expect(fund.campaigns, isNull);
      expect(fund.createdAt, isNull);
      expect(fund.updatedAt, isNull);
    });
  });
}
