import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/user_mapper.dart';
import 'package:talawa/models/user/user_info.dart' as dto;

void main() {
  group('UserMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoUser = dto.User(
          id: 'user123',
          name: 'John Doe',
          email: 'john@example.com',
          image: 'https://example.com/avatar.jpg',
        );

        final domain = UserMapper.fromDto(dtoUser);

        expect(domain.id, 'user123');
        expect(domain.name, 'John Doe');
        expect(domain.email, 'john@example.com');
        expect(domain.image, 'https://example.com/avatar.jpg');
        expect(domain.displayName, 'John Doe');
      });

      test('handles null name and email', () {
        final dtoUser = dto.User(id: 'user456');

        final domain = UserMapper.fromDto(dtoUser);

        expect(domain.id, 'user456');
        expect(domain.displayName, 'Unknown User');
      });

      test('uses email as displayName when name is null', () {
        final dtoUser = dto.User(
          id: 'user789',
          email: 'test@example.com',
        );

        final domain = UserMapper.fromDto(dtoUser);

        expect(domain.displayName, 'test@example.com');
      });
    });
  });
}
