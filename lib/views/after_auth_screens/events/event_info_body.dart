import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

/// EventInfoBody returns a stateless widget which describes the body of a particular event.
=======
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
>>>>>>> upstream/develop
class EventInfoBody extends StatelessWidget {
  const EventInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // fetching the event data from model
    final model = Provider.of<EventInfoViewModel>(context);
    final event = model.event;
    // Slivers are special-purpose widgets that can be combined using a
    //CustomScrollView to create custom scroll effects. A SliverToBoxAdapter
    //is a basic sliver that creates a bridge back to one of the usual box-based widgets.
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: SizeConfig.safeBlockHorizontal! * 15,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          // event title
                          event.title!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: SizeConfig.screenWidth! * 0.002,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (model.event.creator!.id == userConfig.currentUser.id)
                          ? IconButton(
                              onPressed: () => navigationService.pushScreen(
                                "/editEventPage",
                                arguments: model.event,
                              ),
                              icon: const Icon(Icons.edit),
                            )
                          : Container(),
                      const Icon(Icons.chat_bubble_outline),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              // Display event creator full name.
              "${AppLocalizations.of(context)!.strictTranslate("Created by")}: ${event.creator!.firstName} ${event.creator!.lastName}",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.011,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 13,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.027,
                ),
                Text(
                  // Display start and end date of the Event.
                  "${event.startDate} - ${event.endDate}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                // If event type is public then renders lock_open icon else renders lock icon.
                event.isPublic!
                    ? Icon(
                        Icons.lock_open,
                        size: 13,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : Icon(
                        Icons.lock,
                        size: 13,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.027,
                ),
                // If event type is public then renders 'public'
                // else renders 'private' text translated into the app language.
                event.isPublic!
                    ? Text(
                        AppLocalizations.of(context)!.strictTranslate('public'),
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    : Text(
                        AppLocalizations.of(context)!
                            .strictTranslate('private'),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.011,
            ),
            if (event.startTime != null && event.endTime != null)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // display schedule icon with the start and end date of the time.
                  const Icon(
                    Icons.schedule,
                    size: 12,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.025,
                  ),
                  Text(
                    "${event.startTime} - ${event.endTime}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.011,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.place,
                  size: 12,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.027,
                ),
                Text(
                  event.location!,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                ),
                const Spacer(),
              ],
            ),
            const Divider(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.013,
            ),
            Text(
              AppLocalizations.of(context)!.strictTranslate("Description"),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16),
            ),
            SizedBox(width: SizeConfig.screenWidth! * 0.013),
            Text(
              // Display the Description of the event if not null.
              event.description!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.013),
            Text(
              AppLocalizations.of(context)!.strictTranslate("Admins"),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
              thickness: 2,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: event.admins!.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomListTile(
                  key: Key(
                    '${AppLocalizations.of(context)!.strictTranslate("Admins")}$index',
                  ),
                  index: index,
                  type: TileType.user,
                  userInfo: event.admins![index],
                  onTapUserInfo: () {},
                );
              },
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.013,
            ),
            Text(
              AppLocalizations.of(context)!.strictTranslate("Attendees"),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16),
            ),
            Divider(
              color: Theme.of(context).colorScheme.onSurface,
              thickness: 2,
            ),
            if (model.isBusy)
              // if the model is still fetching the attendees details then display Circular Progress Indicator Icon.
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Center(child: CircularProgressIndicator()),
              )
            else
              // else if the model fetched the attendees details successfully
              //then renders all the attendees in ListView.
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: model.attendees.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomListTile(
                    key: Key(
                      'Attendee$index',
                    ),
                    index: index,
                    type: TileType.attendee,
                    attendeeInfo: model.attendees[index],
                    onTapAttendeeInfo: () {},
                  );
                },
              ),
          ],
        ),
      ),
    );
=======
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
        text += interval > 1
            ? "every $interval ${frequency.toLowerCase()}s"
            : frequency.toLowerCase();
    }

    if (rule.count != null) {
      text += ", ${rule.count} times";
    } else if (rule.recurrenceEndDate != null) {
      text +=
          ", until ${DateFormat('MMM d, yyyy').format(rule.recurrenceEndDate!)}";
    }

    return text;
>>>>>>> upstream/develop
  }
}
