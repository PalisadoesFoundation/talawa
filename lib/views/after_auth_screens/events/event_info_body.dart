import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

/// EventInfoBody returns a stateless widget which describes the body of a particular event.
class EventInfoBody extends StatelessWidget {
  const EventInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                          event.name!,
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
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.027,
                ),
                // If event type is public then renders 'public'
                // else renders 'private' text translated into the app language.

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
  }
}
