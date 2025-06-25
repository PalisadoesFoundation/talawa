import 'package:hive/hive.dart';

part 'attachment_model.g.dart';

/// This class creates a model for attachments in posts. It includes fields for the name, file hash, MIME type, and object name of the attachment.
@HiveType(typeId: 8)
class AttachmentModel {
  AttachmentModel({
    this.name,
    this.fileHash,
    this.mimetype,
    this.objectName,
    this.url,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) {
    return AttachmentModel(
      name: json['name'] as String?,
      fileHash: json['fileHash'] as String?,
      mimetype: json['mimeType'] as String?,
      objectName: json['objectName'] as String?,
      url: json['url'] as String?,
    );
  }

  /// Name of the attachment.
  @HiveField(1)
  String? name;

  /// Hash of the file.
  @HiveField(2)
  String? fileHash;

  /// MIME type of the attachment.
  @HiveField(3)
  String? mimetype;

  /// Name of the object in the storage.
  @HiveField(4)
  String? objectName;

  /// Url of the attachment.
  @HiveField(5)
  String? url;

  /// Converts the AttachmentModel instance to a JSON map.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, String?>`: json is returned.
  Map<String, String?> toJson() {
    return {
      'name': name,
      'fileHash': fileHash,
      'mimetype': mimetype,
      'objectName': objectName,
    };
  }
}
