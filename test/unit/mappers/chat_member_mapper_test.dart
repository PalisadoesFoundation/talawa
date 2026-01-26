import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/chat_member_mapper.dart';
import 'package:talawa/models/chats/chat_member.dart' as dto;
import 'package:talawa/models/chats/chat_user.dart' as dto;
import 'package:talawa/models/domain/chat_member.dart';

void main() {
  group('ChatMemberMapper', () {
    group('fromDto', () {
      test('converts administrator role correctly', () {
        final dtoMember = dto.ChatMember(
          user: dto.ChatUser(id: 'user1', firstName: 'Admin'),
          role: dto.ChatMembershipRole.administrator,
        );

        final domain = ChatMemberMapper.fromDto(dtoMember);

        expect(domain.user.id, 'user1');
        expect(domain.role, ChatMemberRole.administrator);
        expect(domain.isAdmin, true);
        expect(domain.isRegular, false);
        expect(domain.displayRole, 'administrator');
      });

      test('converts regular role correctly', () {
        final dtoMember = dto.ChatMember(
          user: dto.ChatUser(id: 'user2', firstName: 'Regular'),
          role: dto.ChatMembershipRole.regular,
        );

        final domain = ChatMemberMapper.fromDto(dtoMember);

        expect(domain.role, ChatMemberRole.regular);
        expect(domain.isAdmin, false);
        expect(domain.isRegular, true);
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs', () {
        final dtos = [
          dto.ChatMember(
            user: dto.ChatUser(id: 'u1'),
            role: dto.ChatMembershipRole.administrator,
          ),
          dto.ChatMember(
            user: dto.ChatUser(id: 'u2'),
            role: dto.ChatMembershipRole.regular,
          ),
        ];

        final domains = ChatMemberMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].isAdmin, true);
        expect(domains[1].isRegular, true);
      });

      test('handles null list', () {
        final domains = ChatMemberMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
