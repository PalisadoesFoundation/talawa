import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/event_admin_fab.dart';

class EventInfoPage extends StatefulWidget {
  const EventInfoPage({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  _EventInfoPageState createState() => _EventInfoPageState();
}

class _EventInfoPageState extends State<EventInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
                AppLocalizations.of(context)!.strictTranslate('Event Details')),
            pinned: true,
            expandedHeight: SizeConfig.screenWidth,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://picsum.photos/id/26/200/300',
                fit: BoxFit.fill,
              ),
            ),
          ),
          _eventInfoBody()
        ],
      ),
      floatingActionButton:
          widget.event.creator!.id != userConfig.currentUser.id
              ? FloatingActionButton.extended(
                  onPressed: () {},
                  label: Text(
                    "Register",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Theme.of(context).accentColor),
                  ))
              : eventAdminFab(context: context, event: widget.event),
    );
  }

  Widget _eventInfoBody() {
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
                  widget.event.title!,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontSize: 26),
                ),
                const Icon(Icons.chat_bubble_outline)
              ],
            ),
            Row(
              children: [
                widget.event.creator!.firstName != null
                    ? Text(
                        "${AppLocalizations.of(context)!.strictTranslate("Created by")}: ${widget.event.creator!.firstName} ${widget.event.creator!.lastName}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.w600),
                      )
                    : Text(
                        "${AppLocalizations.of(context)!.strictTranslate("Created by")}: Luke Skywalker",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.w600),
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
                  Icons.calendar_today,
                  size: 13,
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.027,
                ),
                Text(
                  "${widget.event.startDate!} - ${widget.event.endDate!}",
                  style: Theme.of(context).textTheme.caption,
                ),
                const Spacer(),
                widget.event.isPublic!
                    ? Icon(
                        Icons.lock_open,
                        size: 13,
                        color: Theme.of(context).accentColor,
                      )
                    : Icon(
                        Icons.lock,
                        size: 13,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.027,
                ),
                widget.event.isPublic!
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
                  "${widget.event.startTime!} - ${widget.event.endTime!}",
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
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.88,
                  child: Text(
                    widget.event.location!,
                    style: Theme.of(context).textTheme.caption,
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
              widget.event.description!,
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
            CustomListTile(
                index: 0,
                key: const Key('Admins'),
                type: TileType.user,
                userInfo: userConfig.currentUser,
                onTapUserInfo: () {}),
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

            //  Needs to be replaced with actual event attendees
            ListView.builder(
                padding: const EdgeInsets.all(0.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return CustomListTile(
                      key: Key(
                          '${AppLocalizations.of(context)!.strictTranslate("Attendee")}$index'),
                      index: index,
                      type: TileType.user,
                      userInfo: userConfig.currentUser,
                      onTapUserInfo: () {});
                })
          ],
        ),
      ),
    );
  }
}
