import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/attachments/attachment_model.dart';

void main() {
  group('AttachmentModel', () {
    test('can be constructed with all fields', () {
      final attachment = AttachmentModel(
        name: 'file.txt',
        fileHash: 'abc123',
        mimetype: 'text/plain',
        objectName: 'object/file.txt',
        url: 'https://example.com/file.txt',
      );

      expect(attachment.name, 'file.txt');
      expect(attachment.fileHash, 'abc123');
      expect(attachment.mimetype, 'text/plain');
      expect(attachment.objectName, 'object/file.txt');
      expect(attachment.url, 'https://example.com/file.txt');
    });

    test('fromJson creates correct instance', () {
      final json = {
        'name': 'file.txt',
        'fileHash': 'abc123',
        'mimeType': 'text/plain',
        'objectName': 'object/file.txt',
        'url': 'https://example.com/file.txt',
      };

      final attachment = AttachmentModel.fromJson(json);

      expect(attachment.name, 'file.txt');
      expect(attachment.fileHash, 'abc123');
      expect(attachment.mimetype, 'text/plain');
      expect(attachment.objectName, 'object/file.txt');
      expect(attachment.url, 'https://example.com/file.txt');
    });

    test('toJson returns correct map', () {
      final attachment = AttachmentModel(
        name: 'file.txt',
        fileHash: 'abc123',
        mimetype: 'text/plain',
        objectName: 'object/file.txt',
      );

      final json = attachment.toJson();

      expect(json['name'], 'file.txt');
      expect(json['fileHash'], 'abc123');
      expect(json['mimetype'], 'text/plain'); // because of .split('.').last
      expect(json['objectName'], 'object/file.txt');
    });

    test('toJson handles null fields', () {
      final attachment = AttachmentModel();
      final json = attachment.toJson();

      expect(json['name'], isNull);
      expect(json['fileHash'], isNull);
      expect(json['mimetype'], isNull);
      expect(json['objectName'], isNull);
    });
  });
}
