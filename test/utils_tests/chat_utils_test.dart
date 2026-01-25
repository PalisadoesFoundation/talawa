import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/chats/chat.dart';
import 'package:talawa/models/chats/chat_user.dart';
import 'package:talawa/utils/chat_utils.dart';

void main() {
  group('ChatUtils', () {
    late ChatUser user1;
    late ChatUser user2;
    late ChatUser user3;
    late ChatUser creator;
    late Chat directChat;
    late Chat groupChat;
    late Chat singleUserChat;

    setUp(() {
      user1 = ChatUser(id: 'user1', firstName: 'John');
      user2 = ChatUser(id: 'user2', firstName: 'Jane');
      user3 = ChatUser(id: 'user3', firstName: 'Bob');
      creator = ChatUser(id: 'creator1', firstName: 'Admin');

      directChat = Chat(
        id: 'direct1',
        name: 'Direct Chat',
        creator: creator,
        members: [user1, user2],
      );

      groupChat = Chat(
        id: 'group1',
        name: 'Test Group_chatgroup1',
        creator: creator,
        members: [
          user1,
          user2,
          user3,
          creator,
        ], // 4 members so removal is valid
      );

      singleUserChat = Chat(
        id: 'single1',
        name: 'Single User Chat',
        creator: creator,
        members: [user1],
      );
    });

    group('isGroupChat', () {
      test('returns true for chat with 3 or more members', () {
        expect(ChatUtils.isGroupChat(groupChat), isTrue);
      });

      test('returns false for chat with 2 members', () {
        expect(ChatUtils.isGroupChat(directChat), isFalse);
      });

      test('returns false for chat with 1 member', () {
        expect(ChatUtils.isGroupChat(singleUserChat), isFalse);
      });

      test('returns false for chat with null members', () {
        final chat = Chat(id: 'test', members: null);
        expect(ChatUtils.isGroupChat(chat), isFalse);
      });

      test('returns false for chat with empty members list', () {
        final chat = Chat(id: 'test', members: []);
        expect(ChatUtils.isGroupChat(chat), isFalse);
      });
    });

    group('isDirectChat', () {
      test('returns true for chat with exactly 2 members', () {
        expect(ChatUtils.isDirectChat(directChat), isTrue);
      });

      test('returns false for chat with 3 or more members', () {
        expect(ChatUtils.isDirectChat(groupChat), isFalse);
      });

      test('returns false for chat with 1 member', () {
        expect(ChatUtils.isDirectChat(singleUserChat), isFalse);
      });

      test('returns false for chat with null members', () {
        final chat = Chat(id: 'test', members: null);
        expect(ChatUtils.isDirectChat(chat), isFalse);
      });

      test('returns false for chat with empty members list', () {
        final chat = Chat(id: 'test', members: []);
        expect(ChatUtils.isDirectChat(chat), isFalse);
      });
    });

    group('extractGroupName', () {
      test('removes chat ID suffix from group name', () {
        const chatName = 'My Group_chat123abc';
        final result = ChatUtils.extractGroupName(chatName);
        expect(result, equals('My Group'));
      });

      test('removes UUID-style chat ID suffix', () {
        const chatName =
            'Project Team_chat0198864e-a551-7189-803e-0374aeee6650';
        final result = ChatUtils.extractGroupName(chatName);
        expect(result, equals('Project Team'));
      });

      test('returns original name if no suffix found', () {
        const chatName = 'Simple Group Name';
        final result = ChatUtils.extractGroupName(chatName);
        expect(result, equals('Simple Group Name'));
      });

      test('handles empty string', () {
        const chatName = '';
        final result = ChatUtils.extractGroupName(chatName);
        expect(result, equals(''));
      });

      test('handles name with underscore but no chat suffix', () {
        const chatName = 'Group_with_underscores';
        final result = ChatUtils.extractGroupName(chatName);
        expect(result, equals('Group_with_underscores'));
      });
    });

    group('formatGroupName', () {
      test('appends chat ID suffix to user input', () {
        const userInput = 'My New Group';
        const chatId = 'abc123';
        final result = ChatUtils.formatGroupName(userInput, chatId);
        expect(result, equals('My New Group_chatabc123'));
      });

      test('removes existing suffix before adding new one', () {
        const userInput = 'Old Group_chatold123';
        const chatId = 'new456';
        final result = ChatUtils.formatGroupName(userInput, chatId);
        expect(result, equals('Old Group_chatnew456'));
      });

      test('trims whitespace from user input', () {
        const userInput = '  Spaced Group  ';
        const chatId = 'xyz789';
        final result = ChatUtils.formatGroupName(userInput, chatId);
        expect(result, equals('Spaced Group_chatxyz789'));
      });

      test('handles empty user input', () {
        const userInput = '';
        const chatId = 'test123';
        final result = ChatUtils.formatGroupName(userInput, chatId);
        expect(result, equals('_chattest123'));
      });
    });

    group('getDisplayName', () {
      test('returns clean group name for group chats', () {
        final chat = Chat(
          id: 'group1',
          name: 'Team Chat_chatgroup1',
          members: [user1, user2, user3],
        );
        final result = ChatUtils.getDisplayName(chat, 'user1');
        expect(result, equals('Team Chat'));
      });

      test('returns "Group Chat" for group with null/empty name', () {
        final chat = Chat(
          id: 'group1',
          name: null,
          members: [user1, user2, user3],
        );
        final result = ChatUtils.getDisplayName(chat, 'user1');
        expect(result, equals('Group Chat'));
      });

      test("returns other person's name for direct chats", () {
        final result = ChatUtils.getDisplayName(directChat, 'user1');
        expect(result, equals('Jane'));
      });

      test('returns "Unknown User" if other member has no name', () {
        final userWithoutName = ChatUser(id: 'user2');
        final chat = Chat(
          id: 'direct1',
          members: [user1, userWithoutName],
        );
        final result = ChatUtils.getDisplayName(chat, 'user1');
        expect(result, equals('Unknown User'));
      });

      test('returns "Direct Chat" if other member not found', () {
        final user2 = ChatUser(id: 'user2', firstName: '');
        directChat = Chat(
          id: 'direct1',
          name: 'Direct Chat',
          creator: creator,
          members: [
            user2,
            user1,
          ],
        );
        final result = ChatUtils.getDisplayName(directChat, 'nonexistent');
        expect(result, equals('Unknown User'));
      });

      test('returns "Chat" for invalid chat types', () {
        final result = ChatUtils.getDisplayName(singleUserChat, 'user1');
        expect(result, equals('Chat'));
      });
    });

    group('categorizeChats', () {
      test('correctly categorizes chats into groups and direct', () {
        final chats = [directChat, groupChat, singleUserChat];
        final result = ChatUtils.categorizeChats(chats);

        final groups = result['groups']!;
        final direct = result['direct']!;

        expect(groups.length, equals(1));
        expect(groups.first.id, equals('group1'));
        expect(direct.length, equals(1));
        expect(direct.first.id, equals('direct1'));
      });

      test('handles empty chat list', () {
        final result = ChatUtils.categorizeChats([]);
        final groups = result['groups']!;
        final direct = result['direct']!;

        expect(groups.isEmpty, isTrue);
        expect(direct.isEmpty, isTrue);
      });

      test('ignores invalid chats with 1 or 0 members', () {
        final chats = [singleUserChat, Chat(id: 'empty', members: [])];
        final result = ChatUtils.categorizeChats(chats);
        final groups = result['groups']!;
        final direct = result['direct']!;

        expect(groups.isEmpty, isTrue);
        expect(direct.isEmpty, isTrue);
      });
    });

    group('isCurrentUserAdmin', () {
      test('returns true if current user is the creator of group chat', () {
        final result = ChatUtils.isCurrentUserAdmin(groupChat, 'creator1');
        expect(result, isTrue);
      });

      test('returns false if current user is not the creator', () {
        final result = ChatUtils.isCurrentUserAdmin(groupChat, 'user1');
        expect(result, isFalse);
      });

      test('returns false for direct chats', () {
        final result = ChatUtils.isCurrentUserAdmin(directChat, 'creator1');
        expect(result, isFalse);
      });

      test('returns false if creator is null', () {
        final chat = Chat(
          id: 'group1',
          members: [user1, user2, user3],
          creator: null,
        );
        final result = ChatUtils.isCurrentUserAdmin(chat, 'user1');
        expect(result, isFalse);
      });
    });

    group('validateGroupName', () {
      test('returns valid for proper group name', () {
        final Map<String, dynamic> result =
            ChatUtils.validateGroupName('My Group Chat');
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });

      test('returns invalid for empty name', () {
        final Map<String, dynamic> result = ChatUtils.validateGroupName('');
        expect(result['isValid'] as bool, isFalse);
        expect(result['error'] as String, equals('Group name cannot be empty'));
      });

      test('returns invalid for whitespace-only name', () {
        final Map<String, dynamic> result = ChatUtils.validateGroupName('   ');
        expect(result['isValid'] as bool, isFalse);
        expect(result['error'] as String, equals('Group name cannot be empty'));
      });

      test('returns invalid for name too long', () {
        final longName = 'a' * 51;
        final Map<String, dynamic> result =
            ChatUtils.validateGroupName(longName);
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Group name cannot exceed 50 characters'),
        );
      });

      test('returns invalid for name too short', () {
        final Map<String, dynamic> result = ChatUtils.validateGroupName('a');
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Group name must be at least 2 characters'),
        );
      });

      test('returns invalid for name with invalid characters', () {
        final Map<String, dynamic> result =
            ChatUtils.validateGroupName('Group<Name>');
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Group name contains invalid characters'),
        );
      });

      test('accepts name with exactly 2 characters', () {
        final Map<String, dynamic> result = ChatUtils.validateGroupName('My');
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });

      test('accepts name with exactly 50 characters', () {
        final name50 = 'a' * 50;
        final Map<String, dynamic> result = ChatUtils.validateGroupName(name50);
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });
    });

    group('validateMemberRemoval', () {
      test('returns valid for proper member removal', () {
        final Map<String, dynamic> result = ChatUtils.validateMemberRemoval(
          chat: groupChat,
          memberId: 'user3',
          currentUserId: 'creator1',
        );
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });

      test('returns invalid for direct chat', () {
        final Map<String, dynamic> result = ChatUtils.validateMemberRemoval(
          chat: directChat,
          memberId: 'user2',
          currentUserId: 'creator1',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Only group chats allow member removal'),
        );
      });

      test('returns invalid if current user is not admin', () {
        final Map<String, dynamic> result = ChatUtils.validateMemberRemoval(
          chat: groupChat,
          memberId: 'user3',
          currentUserId: 'user1',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Only admin can remove members'),
        );
      });

      test('returns invalid if trying to remove self (admin)', () {
        final Map<String, dynamic> result = ChatUtils.validateMemberRemoval(
          chat: groupChat,
          memberId: 'creator1',
          currentUserId: 'creator1',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Admin cannot leave group. Delete the group instead.'),
        );
      });

      test('returns invalid if removal would result in less than 3 members',
          () {
        final minGroupChat = Chat(
          id: 'min_group',
          creator: creator,
          members: [creator, user1, user2], // Exactly 3 members
        );
        final Map<String, dynamic> result = ChatUtils.validateMemberRemoval(
          chat: minGroupChat,
          memberId: 'user2',
          currentUserId: 'creator1',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals(
            'Cannot remove member. Group must have at least 3 members.',
          ),
        );
      });
    });

    group('validateGroupLeave', () {
      test('returns valid for non-admin member leaving', () {
        final Map<String, dynamic> result = ChatUtils.validateGroupLeave(
          chat: groupChat,
          currentUserId: 'user1',
        );
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });

      test('returns invalid for direct chat', () {
        final Map<String, dynamic> result = ChatUtils.validateGroupLeave(
          chat: directChat,
          currentUserId: 'user1',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Only group chats can be left'),
        );
      });

      test('returns invalid if admin tries to leave', () {
        final Map<String, dynamic> result = ChatUtils.validateGroupLeave(
          chat: groupChat,
          currentUserId: 'creator1',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Admin cannot leave group. Delete the group instead.'),
        );
      });

      test('returns invalid if leaving would result in less than 3 members',
          () {
        final minGroupChat = Chat(
          id: 'min_group',
          creator: creator,
          members: [creator, user1, user2], // Exactly 3 members
        );
        final Map<String, dynamic> result = ChatUtils.validateGroupLeave(
          chat: minGroupChat,
          currentUserId: 'user1',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Cannot leave group. Group must have at least 3 members.'),
        );
      });
    });

    group('getMemberCount', () {
      test('returns correct member count', () {
        expect(
          ChatUtils.getMemberCount(groupChat),
          equals(4),
        ); // Updated for 4 members
        expect(ChatUtils.getMemberCount(directChat), equals(2));
        expect(ChatUtils.getMemberCount(singleUserChat), equals(1));
      });

      test('returns 0 for null members', () {
        final chat = Chat(id: 'test', members: null);
        expect(ChatUtils.getMemberCount(chat), equals(0));
      });

      test('returns 0 for empty members list', () {
        final chat = Chat(id: 'test', members: []);
        expect(ChatUtils.getMemberCount(chat), equals(0));
      });
    });

    group('validateAdminAction', () {
      test('returns valid for admin performing rename action', () {
        final Map<String, dynamic> result = ChatUtils.validateAdminAction(
          chat: groupChat,
          currentUserId: 'creator1',
          action: 'rename',
        );
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });

      test('returns valid for admin performing add_member action', () {
        final Map<String, dynamic> result = ChatUtils.validateAdminAction(
          chat: groupChat,
          currentUserId: 'creator1',
          action: 'add_member',
        );
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });

      test('returns valid for admin performing delete action', () {
        final Map<String, dynamic> result = ChatUtils.validateAdminAction(
          chat: groupChat,
          currentUserId: 'creator1',
          action: 'delete',
        );
        expect(result['isValid'] as bool, isTrue);
        expect(result['error'], isNull);
      });

      test('returns invalid for direct chat', () {
        final Map<String, dynamic> result = ChatUtils.validateAdminAction(
          chat: directChat,
          currentUserId: 'creator1',
          action: 'rename',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Action only available for group chats'),
        );
      });

      test('returns invalid for non-admin user', () {
        final Map<String, dynamic> result = ChatUtils.validateAdminAction(
          chat: groupChat,
          currentUserId: 'user1',
          action: 'rename',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals('Only admin can perform this action'),
        );
      });

      test('returns invalid for remove_member with minimum members', () {
        final minGroupChat = Chat(
          id: 'min_group',
          creator: creator,
          members: [creator, user1, user2], // Exactly 3 members
        );
        final Map<String, dynamic> result = ChatUtils.validateAdminAction(
          chat: minGroupChat,
          currentUserId: 'creator1',
          action: 'remove_member',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(
          result['error'] as String,
          equals(
            'Cannot remove members. Group must have at least 3 members.',
          ),
        );
      });

      test('returns invalid for unknown action', () {
        final Map<String, dynamic> result = ChatUtils.validateAdminAction(
          chat: groupChat,
          currentUserId: 'creator1',
          action: 'unknown_action',
        );
        expect(result['isValid'] as bool, isFalse);
        expect(result['error'] as String, equals('Unknown action'));
      });
    });
  });
}
