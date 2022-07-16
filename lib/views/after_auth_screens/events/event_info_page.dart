import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_share/social_share.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/event_admin_fab.dart';

class EventInfoPage extends StatefulWidget {
  const EventInfoPage({Key? key, required this.args}) : super(key: key);
  final Map<String, dynamic> args;
  @override
  _EventInfoPageState createState() => _EventInfoPageState();
}

class _EventInfoPageState extends State<EventInfoPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EventInfoViewModel>(
      onModelReady: (model) => model.initialize(args: widget.args),
      builder: (context, model, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  AppLocalizations.of(context)!
                      .strictTranslate('Event Details'),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      SocialShare.shareOptions(
                        'https://cyberwake.github.io/applink/eventInvite?setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}&eventId=${model.event.id}',
                      );
                    },
                  ),
                ],
                pinned: true,
                expandedHeight: SizeConfig.screenWidth,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://picsum.photos/id/26/200/300',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const _EventInfoBody()
            ],
          ),
          floatingActionButton: model.event.creator!.id !=
                  userConfig.currentUser.id
              ? FloatingActionButton.extended(
                  onPressed: () {
                    model.registerForEvent();
                  },
                  label: Text(model.fabTitle,
                      style: Theme.of(context).textTheme.bodyText2),
                )
              : eventAdminFab(
                  context: context,
                  event: model.event,
                  exploreEventsViewModel: widget.args["exploreEventViewModel"]
                      as ExploreEventsViewModel,
                ),
        );
      },
    );
  }
}

class _EventInfoBody extends StatelessWidget {
  const _EventInfoBody({Key? key}) : super(key: key);

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
