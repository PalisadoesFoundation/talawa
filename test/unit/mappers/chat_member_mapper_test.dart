import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_member_mapper.dart';
import 'package:talawa/models/chats/chat_member.dart' as dto;
import 'package:talawa/models/chats/chat_user.dart' as dto_user;

void main() {
  group('ChatMemberMapper', () {
    test('fromDto converts member with admin role', () {
      final dtoMember = dto.ChatMember(
        user: dto_user.ChatUser(id: 'user1', firstName: 'Admin'),
        role: dto.ChatMembershipRole.administrator,
      );

      final domain = ChatMemberMapper.fromDto(dtoMember);

      expect(domain.user.id, 'user1');
      expect(domain.isAdmin, true);
      expect(domain.isRegular, false);
    });

    test('fromDto converts member with regular role', () {
      final dtoMember = dto.ChatMember(
        user: dto_user.ChatUser(id: 'user2', firstName: 'Member'),
        role: dto.ChatMembershipRole.regular,
      );

      final domain = ChatMemberMapper.fromDto(dtoMember);

      expect(domain.isAdmin, false);
      expect(domain.isRegular, true);
    });
  });
}
