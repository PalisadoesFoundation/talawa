/// This class contains GraphQL queries related to attachment handling.
class AttachmentQueries {
  /// Method to get the file URL mutation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: GraphQL mutation string for getting file URL.
  String getFileUrlMutation() {
    return '''
      mutation CreateGetfileUrl(\$objectName: String!, \$organizationId: ID!) {
        createGetfileUrl(
          input: { objectName: \$objectName, organizationId: \$organizationId }
        ) {
          presignedUrl
        }
      }
    ''';
  }

  /// Method to create a presigned URL mutation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: GraphQL mutation string for creating presigned URL.
  String createPresignedUrlMutation() {
    return '''
      mutation CreatePresignedUrl(\$fileName: String!, \$organizationId: ID!, \$fileHash: String!) {
        createPresignedUrl(
          input: { fileName: \$fileName, organizationId: \$organizationId, fileHash: \$fileHash }
        ) {
          presignedUrl
          objectName
          requiresUpload
        }
      }
    ''';
  }
}
