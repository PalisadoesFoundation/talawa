import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/post_mapper.dart';
import 'package:talawa/models/post/post_model.dart' as dto;

void main() {
  group('PostMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoPost = dto.Post(
          id: 'post123',
          caption: 'Test caption',
        );

        final domain = PostMapper.fromDto(dtoPost);

        expect(domain.id, 'post123');
        expect(domain.caption, 'Test caption');
      });

      test('handles null id', () {
        final dtoPost = dto.Post(caption: 'No ID');

        final domain = PostMapper.fromDto(dtoPost);

        expect(domain.id, '');
        expect(domain.caption, 'No ID');
      });
    });
  });
}
