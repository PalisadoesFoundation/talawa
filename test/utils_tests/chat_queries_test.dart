import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/chat_queries.dart';

void main() {
  group("Tests for chat_queries.dart", () {
    late ChatQueries chatQueries;

    setUp(() {
      chatQueries = ChatQueries();
    });

    group('createChat', () {
      test("Check if createChat works correctly", () {
        final result = chatQueries.createChat();

        expect(result, isA<String>());
        expect(
          result,
          contains('mutation createChat(\$input: MutationCreateChatInput!)'),
        );
        expect(result, contains('createChat(input: \$input)'));
        expect(result, contains('id'));
        expect(result, contains('name'));
        expect(result, contains('description'));
        expect(result, contains('createdAt'));
        expect(result, contains('updatedAt'));
      });
    });

    group('createChatMembership', () {
      test("Check if createChatMembership works correctly", () {
        final result = chatQueries.createChatMembership();

        expect(result, isA<String>());
        expect(
          result,
          contains(
            'mutation createChatMembership(\$input: MutationCreateChatMembershipInput!)',
          ),
        );
        expect(result, contains('createChatMembership(input: \$input)'));
        expect(result, contains('id'));
        expect(result, contains('createdAt'));
        expect(result, contains('updatedAt'));
        expect(result, contains('creator'));
        expect(result, contains('name'));
      });
    });

    group('chatsByUser', () {
      test("Check if chatsByUser works correctly", () {
        final result = chatQueries.chatsByUser();

        expect(result, isA<String>());
        expect(result, contains('query chatsByUser'));
        expect(result, contains('chatsByUser'));
        expect(result, contains('id'));
        expect(result, contains('name'));
        expect(result, contains('description'));
        expect(result, contains('createdAt'));
        expect(result, contains('updatedAt'));
        expect(result, contains('members(last: 2)'));
        expect(result, contains('edges'));
        expect(result, contains('node'));
      });
    });

    group('fetchChatMessagesByChatId', () {
      test("Check if fetchChatMessagesByChatId works correctly", () {
        final result = chatQueries.fetchChatMessagesByChatId();

        expect(result, isA<String>());
        expect(
          result,
          contains(
            'query chat(\$input: QueryChatInput!, \$first: Int, \$last: Int, \$after: String, \$before: String)',
          ),
        );
        expect(result, contains('chat(input: \$input)'));
        expect(
          result,
          contains(
            'messages(first: \$first, last: \$last, after: \$after, before: \$before)',
          ),
        );
        expect(result, contains('pageInfo'));
        expect(result, contains('hasNextPage'));
        expect(result, contains('hasPreviousPage'));
        expect(result, contains('startCursor'));
        expect(result, contains('endCursor'));
        expect(result, contains('body'));
        expect(result, contains('creator'));
      });

      test("Check if fetchChatMessagesByChatId includes pagination support",
          () {
        final result = chatQueries.fetchChatMessagesByChatId();

        expect(result, contains('\$first: Int'));
        expect(result, contains('\$last: Int'));
        expect(result, contains('\$after: String'));
        expect(result, contains('\$before: String'));
        expect(result, contains('cursor'));
        expect(result, contains('edges'));
      });
    });

    group('createChatMessage', () {
      test("Check if createChatMessage works correctly", () {
        final result = chatQueries.createChatMessage();

        expect(result, isA<String>());
        expect(
          result,
          contains(
            'mutation createChatMessage(\$input: MutationCreateChatMessageInput!)',
          ),
        );
        expect(result, contains('createChatMessage(input: \$input)'));
        expect(result, contains('id'));
        expect(result, contains('body'));
        expect(result, contains('creator'));
        expect(result, contains('createdAt'));
        expect(result, contains('updatedAt'));
      });
    });

    group('chatMessageCreate subscription', () {
      test("Check if chatMessageCreate subscription works correctly", () {
        final result = chatQueries.chatMessageCreate;

        expect(result, isA<String>());
        expect(
          result,
          contains(
            'subscription chatMessageCreate(\$input: SubscriptionChatMessageCreateInput!)',
          ),
        );
        expect(result, contains('chatMessageCreate(input: \$input)'));
        expect(result, contains('id'));
        expect(result, contains('body'));
        expect(result, contains('createdAt'));
        expect(result, contains('updatedAt'));
        expect(result, contains('creator'));
      });

      test("Check if chatMessageCreate subscription includes creator details",
          () {
        final result = chatQueries.chatMessageCreate;

        expect(result, contains('creator'));
        expect(result, contains('id'));
        expect(result, contains('name'));
      });
    });

    group('GraphQL syntax validation', () {
      test("All queries should have proper GraphQL syntax", () {
        final queries = [
          chatQueries.createChat(),
          chatQueries.createChatMembership(),
          chatQueries.chatsByUser(),
          chatQueries.fetchChatMessagesByChatId(),
          chatQueries.createChatMessage(),
          chatQueries.chatMessageCreate,
        ];

        for (final query in queries) {
          expect(query, isNotEmpty);
          expect(query.trim(), isNotEmpty);
          // Check for balanced braces
          final openBraces = query.split('{').length - 1;
          final closeBraces = query.split('}').length - 1;
          expect(
            openBraces,
            equals(closeBraces),
            reason: 'Unbalanced braces in query: $query',
          );
        }
      });

      test("All mutations should include proper input types", () {
        final mutations = [
          chatQueries.createChat(),
          chatQueries.createChatMembership(),
          chatQueries.createChatMessage(),
        ];

        for (final mutation in mutations) {
          expect(mutation, contains('\$input:'));
          expect(mutation, contains('input: \$input'));
        }
      });

      test("Subscription should include proper input type", () {
        final subscription = chatQueries.chatMessageCreate;

        expect(
          subscription,
          contains('\$input: SubscriptionChatMessageCreateInput!'),
        );
        expect(subscription, contains('input: \$input'));
      });
    });
  });
}
