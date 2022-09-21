import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/widgets/custom_list_tile.dart';

class EventInfoBody extends StatelessWidget {
  const EventInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EventInfoViewModel>(context);
    final event = model.event;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.title!,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 26),
                ),
                const Icon(Icons.chat_bubble_outline)
              ],
            ),
            Text(
              "${AppLocalizations.of(context)!.strictTranslate("Created by")}: ${event.creator!.firstName} ${event.creator!.lastName}",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
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
                  "${event.startDate!} - ${event.endDate!}",
                  style: Theme.of(context).textTheme.caption,
                ),
                const Spacer(),
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
                event.isPublic!
                    ? Text(
                        AppLocalizations.of(context)!.strictTranslate('public'),
                        style: Theme.of(context).textTheme.caption,
                      )
                    : Text(
                        AppLocalizations.of(context)!
                            .strictTranslate('private'),
                        style: Theme.of(context).textTheme.caption,
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
                  Icons.schedule,
                  size: 12,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.025,
                ),
                Text(
                  "${event.startTime!} - ${event.endTime!}",
                  style: Theme.of(context).textTheme.caption,
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
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                ),
                const Spacer(),
                if (event.latitude != null && event.longitude != null)
                  GestureDetector(
                    onTap: () => navigationService
                        .pushScreen(Routes.mapScreen, arguments: {
                      "latitude": event.latitude,
                      "longitude": event.longitude,
                    }),
                    child: Text(
                      'View on map',
                      style: Theme.of(context).textTheme.caption!.copyWith(
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
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16),
            ),
            SizedBox(width: SizeConfig.screenWidth! * 0.013),
            Text(
              event.description!,
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.013),
            Text(
              AppLocalizations.of(context)!.strictTranslate("Admins"),
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.strictTranslate("Attendees"),
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontSize: 16),
                ),
                Text(
                  AppLocalizations.of(context)!.strictTranslate('See all'),
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: const Color(0xff4285F4)),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).colorScheme.onBackground,
              thickness: 2,
            ),
            if (model.isBusy)
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Center(child: CircularProgressIndicator()),
              )
            else
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
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
