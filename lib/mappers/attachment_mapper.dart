import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/domain/attachment.dart';

/// Mapper for converting between AttachmentModel (DTO) and Attachment (Domain).
class AttachmentMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dto`: The AttachmentModel DTO to convert
  ///
  /// **returns**:
  /// * `Attachment`: The converted domain model
  static Attachment fromDto(AttachmentModel dto) {
    return Attachment(
      name: dto.name ?? '',
      url: dto.url ?? '',
      fileHash: dto.fileHash,
      mimetype: dto.mimetype,
      objectName: dto.objectName,
    );
  }

  /// Converts Domain model to DTO.
  ///
  /// **params**:
  /// * `domain`: The Attachment domain model to convert
  ///
  /// **returns**:
  /// * `AttachmentModel`: The converted DTO
  static AttachmentModel toDto(Attachment domain) {
    return AttachmentModel(
      name: domain.name,
      url: domain.url,
      fileHash: domain.fileHash,
      mimetype: domain.mimetype,
      objectName: domain.objectName,
    );
  }

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of AttachmentModel DTOs to convert
  ///
  /// **returns**:
  /// * `List<Attachment>`: List of converted domain models
  static List<Attachment> fromDtoList(List<AttachmentModel>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
