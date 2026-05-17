import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';

/// Renders a single event as a tappable card.
///
/// Card shows title, time, and optional location. Tapping pushes the
/// event-info screen for the underlying [Event].
class EventCardWidget extends StatelessWidget {
  /// Builds an [EventCardWidget] bound to an [EventCalendarViewModel].
  ///
  /// **params**:
  /// * `model`: Active [EventCalendarViewModel] used to resolve the
  ///   underlying [Event] from the appointment id.
  /// * `event`: SfCalendar appointment to render.
  const EventCardWidget({
    super.key,
    required this.model,
    required this.event,
  });

  /// View model used to resolve the [Event] referenced by [event.id].
  final EventCalendarViewModel model;

  /// Appointment whose details drive the card's text and color.
  final Appointment event;

  @override
  Widget build(BuildContext context) {
    final String startTime =
        '${event.startTime.hour.toString().padLeft(2, '0')}:${event.startTime.minute.toString().padLeft(2, '0')}';
    final String endTime =
        '${event.endTime.hour.toString().padLeft(2, '0')}:${event.endTime.minute.toString().padLeft(2, '0')}';

    return GestureDetector(
      onTap: () {
        final originalEvent =
            model.eventList.firstWhere((e) => e.id == event.id);
        navigationService.pushScreen(
          "/eventInfo",
          arguments: originalEvent,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 5,
                height: 50,
                decoration: BoxDecoration(
                  color: event.color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.subject,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$startTime - $endTime',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    if ((event.location ?? '').isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              event.location!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey[700]),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
