import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/enums/enums.dart';

void main() {
  group('VoteType Conversions', () {
    // Test the conversion from enum value to API string.
    test('toApiString should return correct string representations', () {
      expect(
        VoteType.upVote.toApiString(),
        'up_vote',
        reason: 'Upvote must map to "up_vote"',
      );
      expect(
        VoteType.downVote.toApiString(),
        'down_vote',
        reason: 'Downvote must map to "down_vote"',
      );
      expect(
        VoteType.none.toApiString(),
        'null',
        reason: 'None must map to "null"',
      );
    });

    // Test the conversion from API string to enum value for valid strings.
    test('fromApiString should correctly parse valid API strings', () {
      expect(
        VoteType.fromApiString('up_vote'),
        VoteType.upVote,
        reason: '"up_vote" must map to VoteType.upVote',
      );
      expect(
        VoteType.fromApiString('down_vote'),
        VoteType.downVote,
        reason: '"down_vote" must map to VoteType.downVote',
      );
      expect(
        VoteType.fromApiString('null'),
        VoteType.none,
        reason: '"null" must map to VoteType.none',
      );
    });

    // Test handling of null input.
    test('fromApiString should return none for null input', () {
      expect(
        VoteType.fromApiString(null),
        VoteType.none,
        reason: 'null string input must return VoteType.none',
      );
    });

    // Test handling of invalid or unknown string inputs.
    test('fromApiString should return none for unknown string inputs', () {
      expect(
        VoteType.fromApiString('unknown_vote'),
        VoteType.none,
        reason: 'Unknown string must default to VoteType.none',
      );
      expect(
        VoteType.fromApiString('UP_VOTE'),
        VoteType.none,
        reason: 'Case mismatch must default to VoteType.none',
      );
      expect(
        VoteType.fromApiString(''),
        VoteType.none,
        reason: 'Empty string must default to VoteType.none',
      );
    });
  });
}
