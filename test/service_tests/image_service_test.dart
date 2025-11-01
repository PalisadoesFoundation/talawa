import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/utils/attachment_queries.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

void main() {
  late ImageService imageService;
  testSetupLocator();

  setUp(() {
    registerServices();
    imageService = ImageService();
  });
  tearDown(() {
    unregisterServices();
  });

  group('Tests for Crop Image', () {
    test("crop image method", () async {
      const path = "test";
      final fakefile = File(path);
      final croppedFile = CroppedFile("fakeCropped");

      when(
        imageCropper.cropImage(
          sourcePath: "test",
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((realInvocation) async => croppedFile);

      final file = await imageService.cropImage(imageFile: fakefile);

      expect(file?.path, croppedFile.path);
    });

    test('cropImage handles null CroppedFile', () async {
      final testFile = File('test.png');

      when(
        imageCropper.cropImage(
          sourcePath: 'test',
          uiSettings: anyNamed('uiSettings'),
        ),
      ).thenAnswer((_) async => null);

      final result = await imageService.cropImage(imageFile: testFile);

      expect(result, isNull);
    });
  });

  group('Tests for convertToBase64', () {
    test('convertToBase64 converts file to base64 string', () async {
      // Create a temporary test file with known content
      const testContent = 'Test file content';
      final testBytes = utf8.encode(testContent);
      final tempFile = File('test_file.txt');
      await tempFile.writeAsBytes(testBytes);

      final fileString = await imageService.convertToBase64(tempFile);

      final List<int> decodedBytes = base64Decode(fileString);

      expect(decodedBytes, equals(testBytes));

      // Clean up
      await tempFile.delete();
    });

    test(
        'Check if convertToBase64 is working even if wrong file path is provided',
        () async {
      final file = File('fakePath');
      final fileString = await imageService.convertToBase64(file);
      expect(
        "",
        fileString,
      );
    });
  });

  group('Tests for calculateFileHash', () {
    test('calculateFileHash returns correct SHA-256 hash', () async {
      const testContent = 'Test file content';
      final testBytes = utf8.encode(testContent);
      final tempFile = File('test_hash_file.txt');
      await tempFile.writeAsBytes(testBytes);

      final hash = await imageService.calculateFileHash(tempFile);

      expect(hash, isNotEmpty);
      expect(hash.length, equals(64)); // SHA-256 hash is 64 characters long
      expect(hash, matches(RegExp(r'^[a-f0-9]{64}$'))); // Valid hex string

      // Clean up
      await tempFile.delete();
    });

    test('calculateFileHash returns consistent hash for same content',
        () async {
      const testContent = 'Consistent content';
      final testBytes = utf8.encode(testContent);

      final tempFile1 = File('test_hash_file1.txt');
      final tempFile2 = File('test_hash_file2.txt');

      await tempFile1.writeAsBytes(testBytes);
      await tempFile2.writeAsBytes(testBytes);

      final hash1 = await imageService.calculateFileHash(tempFile1);
      final hash2 = await imageService.calculateFileHash(tempFile2);

      expect(hash1, equals(hash2));

      // Clean up
      await tempFile1.delete();
      await tempFile2.delete();
    });

    test('calculateFileHash throws exception for non-existent file', () async {
      final nonExistentFile = File('non_existent_file.txt');

      expect(
        () => imageService.calculateFileHash(nonExistentFile),
        throwsException,
      );
    });
  });

  group('Tests for getContentType', () {
    test('getContentType returns correct MIME types for images', () {
      expect(imageService.getContentType('image.jpg'), 'image/jpeg');
      expect(imageService.getContentType('image.jpeg'), 'image/jpeg');
      expect(imageService.getContentType('image.png'), 'image/png');
      expect(imageService.getContentType('image.gif'), 'image/gif');
    });

    test('getContentType returns correct MIME types for documents', () {
      expect(imageService.getContentType('document.pdf'), 'application/pdf');
      expect(imageService.getContentType('document.doc'), 'application/msword');
      expect(
        imageService.getContentType('document.docx'),
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      );
      expect(
        imageService.getContentType('spreadsheet.xls'),
        'application/vnd.ms-excel',
      );
      expect(
        imageService.getContentType('spreadsheet.xlsx'),
        'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      );
    });

    test('getContentType returns correct MIME types for media files', () {
      expect(imageService.getContentType('video.mp4'), 'video/mp4');
      expect(imageService.getContentType('audio.mp3'), 'audio/mpeg');
    });

    test('getContentType handles case insensitive extensions', () {
      expect(imageService.getContentType('IMAGE.JPG'), 'image/jpeg');
      expect(imageService.getContentType('DOCUMENT.PDF'), 'application/pdf');
    });

    test('getContentType returns default for unknown extensions', () {
      expect(
        imageService.getContentType('file.unknown'),
        'application/octet-stream',
      );
      expect(imageService.getContentType('file'), 'application/octet-stream');
    });
  });

  group('Tests for uploadFileToMinio', () {
    test('uploadFileToMinio handles GraphQL exception', () async {
      final testFile = File('test_upload.txt');
      await testFile.writeAsString('test content');
      final mutation = AttachmentQueries().createPresignedUrlMutation();
      when(
        databaseFunctions.gqlAuthMutation(
          mutation,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: null,
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          exception: OperationException(),
        ),
      );

      expect(
        () => imageService.uploadFileToMinio(
          file: testFile,
          organizationId: 'org123',
        ),
        throwsException,
      );

      await testFile.delete();
    });

    test('uploadFileToMinio handles null data response', () async {
      final testFile = File('test_upload.txt');
      await testFile.writeAsString('test content');
      final mutation = AttachmentQueries().createPresignedUrlMutation();
      when(
        databaseFunctions.gqlAuthMutation(
          mutation,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: null,
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      expect(
        () => imageService.uploadFileToMinio(
          file: testFile,
          organizationId: 'org123',
        ),
        throwsException,
      );

      await testFile.delete();
    });

    test('uploadFileToMinio handles missing object name', () async {
      final testFile = File('test_upload.txt');
      await testFile.writeAsString('test content');
      final mutation = AttachmentQueries().createPresignedUrlMutation();
      when(
        databaseFunctions.gqlAuthMutation(
          mutation,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createPresignedUrl': {
              'presignedUrl': 'https://example.com/upload',
              'objectName': null,
              'requiresUpload': true,
            },
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      expect(
        () => imageService.uploadFileToMinio(
          file: testFile,
          organizationId: 'org123',
        ),
        throwsException,
      );

      await testFile.delete();
    });

    test('uploadFileToMinio handles file read error', () async {
      final nonExistentFile = File('non_existent_file.txt');

      expect(
        () => imageService.uploadFileToMinio(
          file: nonExistentFile,
          organizationId: 'org123',
        ),
        throwsException,
      );
    });
  });

  group('Tests for getFileFromMinio', () {
    test('getFileFromMinio handles GraphQL exception', () async {
      final mutation = AttachmentQueries().getFileUrlMutation();
      when(
        databaseFunctions.gqlAuthMutation(
          mutation,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: null,
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          exception: OperationException(),
        ),
      );

      expect(
        () => imageService.getFileFromMinio(
          objectName: 'test-object',
          organizationId: 'org123',
        ),
        throwsException,
      );
    });

    test('getFileFromMinio handles null data response', () async {
      final mutation = AttachmentQueries().getFileUrlMutation();
      when(
        databaseFunctions.gqlAuthMutation(
          mutation,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: null,
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      expect(
        () => imageService.getFileFromMinio(
          objectName: 'test-object',
          organizationId: 'org123',
        ),
        throwsException,
      );
    });

    test('getFileFromMinio handles null presigned URL', () async {
      final mutation = AttachmentQueries().getFileUrlMutation();
      when(
        databaseFunctions.gqlAuthMutation(
          mutation,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createGetfileUrl': {
              'presignedUrl': null,
            },
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      expect(
        () => imageService.getFileFromMinio(
          objectName: 'test-object',
          organizationId: 'org123',
        ),
        throwsException,
      );
    });

    test('getFileFromMinio handles empty presigned URL', () async {
      final mutation = AttachmentQueries().getFileUrlMutation();
      when(
        databaseFunctions.gqlAuthMutation(
          mutation,
          variables: anyNamed('variables'),
        ),
      ).thenAnswer(
        (_) async => QueryResult(
          data: {
            'createGetfileUrl': {
              'presignedUrl': '',
            },
          },
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
        ),
      );

      expect(
        () => imageService.getFileFromMinio(
          objectName: 'test-object',
          organizationId: 'org123',
        ),
        throwsException,
      );
    });
  });
}
