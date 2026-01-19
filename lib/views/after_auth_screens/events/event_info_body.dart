import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/recurrence_rule_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/info_card.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/info_row.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/public_private_chip.dart';
import 'package:talawa/views/after_auth_screens/events/widgets/section_title.dart';

/// EventInfoBody displays the body content of an event.
class EventInfoBody extends StatelessWidget {
  const EventInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EventInfoViewModel>(
      builder: (context, model, child) {
        final event = model.event;
        final theme = Theme.of(context);
        final isCreator = event.creator?.id == userConfig.currentUser.id;

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with title and actions
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        event.name ?? "Unknown event",
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                    if (isCreator)
                      IconButton(
                        onPressed: () => navigationService
                            .pushScreen(Routes.eventPageForm, arguments: event),
                        icon:
                            Icon(Icons.edit, color: theme.colorScheme.primary),
                      ),
                  ],
                ),

                const SizedBox(height: 8),
                Text(
                  "${AppLocalizations.of(context)!.strictTranslate("Created by")}: ${event.creator?.name ?? "Unknown creator"}",
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 16),
                InfoCard(
                  children: [
                    InfoRow(
                      icon: Icons.calendar_today,
                      text: '${event.startDate} - ${event.endDate}',
                      trailing:
                          PublicPrivateChip(isPublic: event.isPublic == true),
                    ),
                    const SizedBox(height: 8),
                    InfoRow(
                      icon: Icons.schedule,
                      text: "${event.startTime} - ${event.endTime}",
                      trailing: event.allDay == true
                          ? Chip(
                              label: Text(
                                AppLocalizations.of(context)!
                                    .strictTranslate("All day"),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              backgroundColor: theme.colorScheme.primary,
                              padding: EdgeInsets.zero,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            )
                          : null,
                    ),
                    const SizedBox(height: 8),
                    InfoRow(
                      icon: Icons.place,
                      text: event.location ?? "No location specified",
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Recurring event section
                if (event.isRecurringEventTemplate == true ||
                    event.recurring == true ||
                    event.recurrenceRule != null) ...[
                  const SectionTitle(title: "Recurring Event"),
                  InfoCard(
                    children: [
                      if (event.recurrenceRule != null) ...[
                        InfoRow(
                          icon: Icons.repeat,
                          text: _formatRecurrenceRule(
                              context, event.recurrenceRule!),
                        ),
                        const SizedBox(height: 8),
                      ],
                      if (event.progressLabel != null)
                        InfoRow(
                          icon: Icons.event_repeat,
                          text: event.progressLabel!,
                        ),
                      if (event.sequenceNumber != null &&
                          event.totalCount != null)
                        InfoRow(
                          icon: Icons.numbers,
                          text:
                              "Event ${event.sequenceNumber} of ${event.totalCount}",
                        ),
                      if (event.baseEvent != null)
                        InfoRow(
                          icon: Icons.event_note,
                          text:
                              "Part of: ${event.baseEvent!.name ?? 'Event series'}",
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                // Description
                const SectionTitle(title: "Description"),
                InfoCard(
                  children: [
                    Text(
                      event.description ?? "No description provided",
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Attendees
                const SectionTitle(title: "Attendees"),
                InfoCard(
                  children: [
                    if (model.isBusy)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (model.attendees.isEmpty)
                      Text(
                        AppLocalizations.of(context)!
                            .strictTranslate("No attendees yet"),
                        style: theme.textTheme.bodyMedium,
                      )
                    else
                      ...model.attendees.map(
                        (attendee) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InfoRow(
                            icon: Icons.person,
                            text:
                                '${attendee.firstName ?? ''} ${attendee.lastName ?? ''}'
                                    .trim(),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 16),

                // Venues
                if (event.venues?.isNotEmpty == true) ...[
                  const SectionTitle(title: "Venues"),
                  InfoCard(
                    children: event.venues!
                        .map(
                          (venue) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  venue.name ?? "Unnamed venue",
                                  style: theme.textTheme.titleMedium,
                                ),
                                if (venue != event.venues!.last)
                                  const Divider(),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ],
            ),
          ),
        );
      }, // Close Selector builder
    ); // Close Selector
  } // Close build method

  /// Formats recurrence rule for display.
  ///
  /// **params**:
  /// * `context`: BuildContext for localization.
  /// * `rule`: RecurrenceRule object to format.
  ///
  /// **returns**:
  /// * `String`: Formatted recurrence rule string.
  String _formatRecurrenceRule(BuildContext context, RecurrenceRule rule) {
    final interval = rule.interval ?? 1;
    final frequency = rule.frequency.toUpperCase();

    String text = "Repeats ";
    switch (frequency) {
      case "DAILY":
        text += interval == 1 ? "daily" : "every $interval days";
        break;
      case "WEEKLY":
        text += interval == 1 ? "weekly" : "every $interval weeks";
        if (rule.byDay?.isNotEmpty == true) {
          text += " on ${rule.byDay!.join(', ')}";
        }
        break;
      case "MONTHLY":
        text += interval == 1 ? "monthly" : "every $interval months";
        if (rule.byMonthDay?.isNotEmpty == true) {
          text += " on day ${rule.byMonthDay!.join(', ')}";
        }
        break;
      case "YEARLY":
        text += interval == 1 ? "yearly" : "every $interval years";
        if (rule.byMonth?.isNotEmpty == true) {
          text += " in ${rule.byMonth!.join(', ')}";
        }
        break;
      default:
        text += frequency.toLowerCase();
    }

    if (rule.count != null) {
      text += ", ${rule.count} times";
    } else if (rule.recurrenceEndDate != null) {
      text +=
          ", until ${DateFormat('MMM d, yyyy').format(rule.recurrenceEndDate!)}";
    }

    return text;
  }
}
