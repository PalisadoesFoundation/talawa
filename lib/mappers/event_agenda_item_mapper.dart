import 'package:talawa/mappers/event_agenda_category_mapper.dart';
import 'package:talawa/models/domain/event_agenda_item.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart' as dto;

/// Mapper for converting between EventAgendaItem DTO and Domain models.
class EventAgendaItemMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoItem`: The EventAgendaItem DTO to convert
  ///
  /// **returns**:
  /// * `EventAgendaItem`: The converted domain model
  static EventAgendaItem fromDto(dto.EventAgendaItem dtoItem) {
    return EventAgendaItem(
      id: dtoItem.id ?? '',
      name: dtoItem.name,
      description: dtoItem.description,
      duration: dtoItem.duration,
      key: dtoItem.key,
      type: dtoItem.type,
      createdAt: dtoItem.createdAt,
      updatedAt: dtoItem.updatedAt,
      attachments: dtoItem.attachments,
      urls: dtoItem.urls,
      categories: dtoItem.categories
          ?.map((c) => EventAgendaCategoryMapper.fromDto(c))
          .toList(),
      sequence: dtoItem.sequence,
    );
  }

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of EventAgendaItem DTOs to convert
  ///
  /// **returns**:
  /// * `List<EventAgendaItem>`: List of converted domain models
  static List<EventAgendaItem> fromDtoList(List<dto.EventAgendaItem>? dtos) {
    return dtos?.map(fromDto).toList() ?? [];
  }
}
