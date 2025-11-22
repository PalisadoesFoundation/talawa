import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/utils/attachment_queries.dart';

void main() {
  group('AttachmentQueries', () {
    test('getFileUrlMutation returns correct GraphQL mutation', () {
      final query = AttachmentQueries().getFileUrlMutation();

      expect(query, contains('mutation CreateGetfileUrl'));
      expect(query, contains(r'$objectName: String!'));
      expect(query, contains(r'$organizationId: ID!'));
      expect(query, contains('createGetfileUrl('));
      expect(query, contains('objectName: \$objectName'));
      expect(query, contains('organizationId: \$organizationId'));
      expect(query, contains('presignedUrl'));
    });

    test('createPresignedUrlMutation returns correct GraphQL mutation', () {
      final query = AttachmentQueries().createPresignedUrlMutation();

      expect(query, contains('mutation CreatePresignedUrl'));
      expect(query, contains(r'$fileName: String!'));
      expect(query, contains(r'$organizationId: ID!'));
      expect(query, contains(r'$fileHash: String!'));
      expect(query, contains('createPresignedUrl('));
      expect(query, contains('fileName: \$fileName'));
      expect(query, contains('organizationId: \$organizationId'));
      expect(query, contains('fileHash: \$fileHash'));
      expect(query, contains('presignedUrl'));
      expect(query, contains('objectName'));
      expect(query, contains('requiresUpload'));
    });
  });
}
