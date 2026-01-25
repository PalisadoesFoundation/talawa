class Attachment {
  const Attachment({
    required this.name,
    required this.url,
    this.fileHash,
    this.mimetype,
    this.objectName,
  });

  final String name;
  final String url;
  final String? fileHash;
  final String? mimetype;
  final String? objectName;

  // Computed properties
  bool get isImage => mimetype?.startsWith('image/') ?? false;
  bool get isPdf => mimetype == 'application/pdf';
  bool get isVideo => mimetype?.startsWith('video/') ?? false;
  String get displayName => name.isNotEmpty ? name : 'Unnamed file';

  String get fileExtension {
    if (name.isEmpty) return '';
    final parts = name.split('.');
    return parts.length > 1 ? parts.last : '';
  }
}
