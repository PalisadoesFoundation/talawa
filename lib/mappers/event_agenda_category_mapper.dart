import 'package:talawa/models/domain/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_category.dart' as dto;

/// Mapper for converting between AgendaCategory DTO and Domain models.
class EventAgendaCategoryMapper {
  /// Converts DTO to Domain model.
  ///
  /// **params**:
  /// * `dtoCategory`: The AgendaCategory DTO to convert
  ///
  /// **returns**:
  /// * `EventAgendaCategory`: The converted domain model
  static EventAgendaCategory fromDto(dto.AgendaCategory dtoCategory) {
    return EventAgendaCategory(
      id: dtoCategory.id ?? '',
      name: dtoCategory.name,
      description: dtoCategory.description,
    );
  }

  /// Converts list of DTOs to list of Domain models.
  ///
  /// **params**:
  /// * `dtos`: List of AgendaCategory DTOs to convert
  ///
  /// **returns**:
  /// * `List<EventAgendaCategory>`: List of converted domain models
  static List<EventAgendaCategory> fromDtoList(List<dto.AgendaCategory>? dtos) {
    return dtos?.map((dto) => fromDto(dto)).toList() ?? [];
  }
}
