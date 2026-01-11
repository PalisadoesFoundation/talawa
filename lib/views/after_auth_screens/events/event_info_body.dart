import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/recurrence_rule_model.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';

/// EventInfoBody displays the body content of an event.
class EventInfoBody extends StatelessWidget {
  const EventInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<EventInfoViewModel>(context).event;
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
                    icon: Icon(Icons.edit, color: theme.colorScheme.primary),
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
            _InfoCard(
              children: [
                _InfoRow(
                  icon: Icons.calendar_today,
                  text: '${event.startDate} - ${event.endDate}',
                  trailing:
                      _PublicPrivateChip(isPublic: event.isPublic == true),
                ),
                const SizedBox(height: 8),
                _InfoRow(
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
                _InfoRow(
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
              const _SectionTitle(title: "Recurring Event"),
              _InfoCard(
                children: [
                  if (event.recurrenceRule != null) ...[
                    _InfoRow(
                      icon: Icons.repeat,
                      text:
                          _formatRecurrenceRule(context, event.recurrenceRule!),
                    ),
                    const SizedBox(height: 8),
                  ],
                  if (event.progressLabel != null)
                    _InfoRow(
                      icon: Icons.event_repeat,
                      text: event.progressLabel!,
                    ),
                  if (event.sequenceNumber != null && event.totalCount != null)
                    _InfoRow(
                      icon: Icons.numbers,
                      text:
                          "Event ${event.sequenceNumber} of ${event.totalCount}",
                    ),
                  if (event.baseEvent != null)
                    _InfoRow(
                      icon: Icons.event_note,
                      text:
                          "Part of: ${event.baseEvent!.name ?? 'Event series'}",
                    ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            // Description
            const _SectionTitle(title: "Description"),
            _InfoCard(
              children: [
                Text(
                  event.description ?? "No description provided",
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Attendees
            const _SectionTitle(title: "Attendees"),
            _InfoCard(
              children: [
                if (Provider.of<EventInfoViewModel>(context).isBusy)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (Provider.of<EventInfoViewModel>(context)
                    .attendees
                    .isEmpty)
                  Text(
                    AppLocalizations.of(context)!
                        .strictTranslate("No attendees yet"),
                    style: theme.textTheme.bodyMedium,
                  ),
              ],
            ),

            const SizedBox(height: 16),

            // Venues
            if (event.venues?.isNotEmpty == true) ...[
              const _SectionTitle(title: "Venues"),
              _InfoCard(
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
                            if (venue != event.venues!.last) const Divider(),
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
  }

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
      case "WEEKLY":
        text += interval == 1 ? "weekly" : "every $interval weeks";
        if (rule.byDay?.isNotEmpty == true) {
          text += " on ${rule.byDay!.join(', ')}";
        }
      case "MONTHLY":
        text += interval == 1 ? "monthly" : "every $interval months";
        if (rule.byMonthDay?.isNotEmpty == true) {
          text += " on day ${rule.byMonthDay!.join(', ')}";
        }
      case "YEARLY":
        text += interval == 1 ? "yearly" : "every $interval years";
        if (rule.byMonth?.isNotEmpty == true) {
          text += " in ${rule.byMonth!.join(', ')}";
        }
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

/// Widget for section titles.
class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  /// The title text.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        AppLocalizations.of(context)!.strictTranslate(title),
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

/// Widget for info cards.
class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.children});

  /// The child widgets.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

/// Widget for info rows with icons.
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    this.trailing,
  });

  /// The icon to display.
  final IconData icon;

  /// The text to display.
  final String text;

  /// Optional trailing widget.
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

/// Widget for public/private event indicator.
class _PublicPrivateChip extends StatelessWidget {
  const _PublicPrivateChip({required this.isPublic});

  /// Whether the event is public.
  final bool isPublic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isPublic ? Icons.lock_open : Icons.lock,
          size: 14,
          color: isPublic
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 4),
        Text(
          AppLocalizations.of(context)!
              .strictTranslate(isPublic ? 'public' : 'private'),
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
