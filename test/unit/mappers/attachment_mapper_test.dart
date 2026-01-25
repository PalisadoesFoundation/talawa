import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/attachment_mapper.dart';
import 'package:talawa/models/attachments/attachment_model.dart';

void main() {
  group('AttachmentMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dto = AttachmentModel(
          name: 'document.pdf',
          url: 'https://example.com/file.pdf',
          fileHash: 'abc123hash',
          mimetype: 'application/pdf',
          objectName: 'obj_12345',
        );

        final domain = AttachmentMapper.fromDto(dto);

        expect(domain.name, 'document.pdf');
        expect(domain.url, 'https://example.com/file.pdf');
        expect(domain.fileHash, 'abc123hash');
        expect(domain.mimetype, 'application/pdf');
        expect(domain.objectName, 'obj_12345');
        expect(domain.isPdf, true);
        expect(domain.isImage, false);
      });

      test('handles null values', () {
        final dto = AttachmentModel();
        final domain = AttachmentMapper.fromDto(dto);

        expect(domain.name, '');
        expect(domain.url, '');
        expect(domain.displayName, 'Unnamed file');
      });
    });
  });
}
