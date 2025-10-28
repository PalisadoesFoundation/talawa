import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Pledge Model', () {
    test('fromJson parses all fields correctly', () {
      final json = {
        'id': 'pledge1',
        'amount': 200,
        'note': 'For education',
        'pledger': {
          'id': 'user2',
          'name': 'Bob',
        },
        'creator': {
          'id': 'user1',
          'name': 'Alice',
        },
        'campaign': {
          'id': 'camp1',
          'fund': {'id': 'fund1'},
          'name': 'Campaign 1',
          'startAt': '2025-08-14T13:46:48.563Z',
          'endAt': '2025-08-15T13:46:48.563Z',
          'goalAmount': 1000,
          'currencyCode': 'USD',
          'pledgedAmount': 500,
        },
      };

      final pledge = Pledge.fromJson(json);

      expect(pledge.id, 'pledge1');
      expect(pledge.amount, 200);
      expect(pledge.note, 'For education');
      expect(pledge.pledger, isA<User>());
      expect(pledge.pledger?.id, 'user2');
      expect(pledge.creator, isA<User>());
      expect(pledge.creator?.id, 'user1');
      expect(pledge.campaign, isA<Campaign>());
      expect(pledge.campaign?.id, 'camp1');
      expect(pledge.startDate, DateTime.parse('2025-08-14T13:46:48.563Z'));
      expect(pledge.endDate, DateTime.parse('2025-08-15T13:46:48.563Z'));
      expect(pledge.currency, 'USD');
    });

    test('fromJson handles null fields', () {
      final json = {
        'id': 'pledge2',
        'amount': null,
        'note': null,
        'pledger': null,
        'creator': null,
        'campaign': null,
      };

      final pledge = Pledge.fromJson(json);

      expect(pledge.id, 'pledge2');
      expect(pledge.amount, isNull);
      expect(pledge.note, isNull);
      expect(pledge.pledger, isNull);
      expect(pledge.creator, isNull);
      expect(pledge.campaign, isNull);
      expect(pledge.startDate, isNull);
      expect(pledge.endDate, isNull);
      expect(pledge.currency, isNull);
    });
  });
}
