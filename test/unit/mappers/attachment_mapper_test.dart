import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/attachment_mapper.dart';
import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/domain/attachment.dart';

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
        expect(domain.fileExtension, 'pdf');
        expect(domain.isVideo, false);
      });

      test('converts video attachment correctly', () {
        final dto = AttachmentModel(
          name: 'video.mp4',
          url: 'https://example.com/video.mp4',
          mimetype: 'video/mp4',
        );

        final domain = AttachmentMapper.fromDto(dto);

        expect(domain.name, 'video.mp4');
        expect(domain.isVideo, true);
        expect(domain.isImage, false);
        expect(domain.isPdf, false);
        expect(domain.fileExtension, 'mp4');
      });

      test('converts image attachment correctly', () {
        final dto = AttachmentModel(
          name: 'photo.jpg',
          url: 'https://example.com/photo.jpg',
          mimetype: 'image/jpeg',
        );

        final domain = AttachmentMapper.fromDto(dto);

        expect(domain.name, 'photo.jpg');
        expect(domain.isImage, true);
        expect(domain.isVideo, false);
        expect(domain.isPdf, false);
        expect(domain.fileExtension, 'jpg');
      });

      test('handles file without extension', () {
        final dto = AttachmentModel(
          name: 'README',
          url: 'https://example.com/README',
        );

        final domain = AttachmentMapper.fromDto(dto);

        expect(domain.name, 'README');
        expect(domain.fileExtension, '');
      });

      test('handles null values', () {
        final dto = AttachmentModel();
        final domain = AttachmentMapper.fromDto(dto);

        expect(domain.name, '');
        expect(domain.url, '');
        expect(domain.displayName, 'Unnamed file');
        expect(domain.fileExtension, '');
        expect(domain.isVideo, false);
      });
    });

    group('toDto', () {
      test('converts domain model to DTO', () {
        const domain = Attachment(
          name: 'photo.jpg',
          url: 'https://example.com/photo.jpg',
          fileHash: 'xyz789',
          mimetype: 'image/jpeg',
          objectName: 'obj_67890',
        );

        final dto = AttachmentMapper.toDto(domain);

        expect(dto.name, 'photo.jpg');
        expect(dto.url, 'https://example.com/photo.jpg');
        expect(dto.fileHash, 'xyz789');
        expect(dto.mimetype, 'image/jpeg');
        expect(dto.objectName, 'obj_67890');
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs to domain models', () {
        final dtos = [
          AttachmentModel(name: 'file1.pdf', url: 'url1'),
          AttachmentModel(name: 'file2.jpg', url: 'url2'),
        ];

        final domains = AttachmentMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].name, 'file1.pdf');
        expect(domains[1].name, 'file2.jpg');
      });

      test('handles null list', () {
        final domains = AttachmentMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
