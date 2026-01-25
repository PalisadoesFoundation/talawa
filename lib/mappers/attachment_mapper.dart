import 'package:talawa/models/attachments/attachment_model.dart';
import 'package:talawa/models/domain/attachment.dart';

/// Mapper for converting between AttachmentModel (DTO) and Attachment (Domain)
class AttachmentMapper {
  /// Converts DTO to Domain model
  static Attachment fromDto(AttachmentModel dto) {
    return Attachment(
      name: dto.name ?? '',
      url: dto.url ?? '',
      fileHash: dto.fileHash,
      mimetype: dto.mimetype,
      objectName: dto.objectName,
    );
  }

  /// Converts Domain model to DTO
  static AttachmentModel toDto(Attachment domain) {
    return AttachmentModel(
      name: domain.name,
      url: domain.url,
      fileHash: domain.fileHash,
      mimetype: domain.mimetype,
      objectName: domain.objectName,
    );
  }

  /// Converts list of DTOs to list of Domain models
  static List<Attachment> fromDtoList(List<AttachmentModel>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
