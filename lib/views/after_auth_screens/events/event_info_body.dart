import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

/// EventInfoBody returns a stateless widget which describes the body of a particular event.
class EventInfoBody extends StatelessWidget {
  const EventInfoBody({Key? key}) : super(key: key);

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
                  "${event.startDate!} - ${event.endDate!}",
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
                  "${event.startTime!} - ${event.endTime!}",
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
                // If the event location is not null then display the location
                //on the map with the reference of latitude and longitude provided for the event.
                if (event.latitude != null && event.longitude != null)
                  GestureDetector(
                    onTap: () => navigationService.pushScreen(
                      Routes.mapScreen,
                      arguments: {
                        "latitude": event.latitude,
                        "longitude": event.longitude,
                      },
                    ),
                    child: Text(
                      'View on map',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 3,
                    ),
                  ),
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
              color: Theme.of(context).colorScheme.onBackground,
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
              color: Theme.of(context).colorScheme.onBackground,
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
                itemCount: model.registrants.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomListTile(
                    key: Key(
                      '${AppLocalizations.of(context)!.strictTranslate("Attendee")}$index',
                    ),
                    index: index,
                    type: TileType.user,
                    userInfo: model.registrants[index],
                    onTapUserInfo: () {},
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}
