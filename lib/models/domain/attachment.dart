/// Clean domain model for attachments with business logic.
///
/// Separates attachment business logic from data transfer objects.
class Attachment {
  /// Creates an Attachment instance.
  const Attachment({
    required this.name,
    required this.url,
    this.fileHash,
    this.mimetype,
    this.objectName,
  });

  /// The name of the attachment file.
  final String name;

  /// The URL where the attachment is stored.
  final String url;

  /// Optional hash of the file for verification.
  final String? fileHash;

  /// MIME type of the attachment (e.g., 'image/png', 'application/pdf').
  final String? mimetype;

  /// Optional object name in storage.
  final String? objectName;

  /// Whether this attachment is an image file.
  bool get isImage => mimetype?.startsWith('image/') ?? false;

  /// Whether this attachment is a PDF file.
  bool get isPdf => mimetype == 'application/pdf';

  /// Whether this attachment is a video file.
  bool get isVideo => mimetype?.startsWith('video/') ?? false;

  /// Display name for the attachment, with fallback for unnamed files.
  String get displayName => name.isNotEmpty ? name : 'Unnamed file';

  /// File extension extracted from the filename.
  String get fileExtension {
    if (name.isEmpty) return '';
    final parts = name.split('.');
    return parts.length > 1 ? parts.last : '';
  }
}
