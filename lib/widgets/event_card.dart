import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';

class EventCard extends StatelessWidget {
  const EventCard(
      {Key? key,
      required this.event,
      this.eventTitleHighlightedText,
      this.eventTitleNormalText,
      required this.isSearchItem})
      : super(key: key);
  final Event event;
  final String? eventTitleHighlightedText;
  final String? eventTitleNormalText;
  final bool isSearchItem;
  @override
  Widget build(BuildContext context) {
    final bool isRegistered = event.isRegistered ?? false;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side:
                  isRegistered && userConfig.currentUser.id != event.creator!.id
                      ? BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: SizeConfig.screenWidth! * 0.008,
                        )
                      : BorderSide.none,
            ),
            elevation: 3,
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 2.5,
                  child: Container(
                    height: SizeConfig.screenHeight! * 0.11,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        image: const DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topCenter,
                          image: NetworkImage(
                              'https://picsum.photos/id/1022/200/300'),
                        )),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: SizeConfig.screenWidth! * 0.48,
                              child: isSearchItem
                                  ? RichText(
                                      text: TextSpan(
                                          text: eventTitleHighlightedText,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                          children: [
                                            TextSpan(
                                                text: eventTitleNormalText,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline5!
                                                    .copyWith(
                                                        color: Colors.grey))
                                          ]),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                    )
                                  : Text(event.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5)),
                          const Spacer(),
                          const Icon(
                            Icons.calendar_today,
                            size: 13,
                          ),
                          const Spacer(),
                          Text(
                            "${event.startDate!} - ${event.endDate!}",
                            style: Theme.of(context).textTheme.caption,
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.006,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            size: 12,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.015,
                          ),
                          Text(
                            "${event.startTime!} - ${event.endTime!}",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.place,
                            size: 12,
                          ),
                          SizedBox(
                            child: Text(
                              event.location!.substring(
                                  0, min(event.location!.length, 20)),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.013,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.55,
                            child: Text(
                              event.description!,
                              style: Theme.of(context).textTheme.caption,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              maxLines: 3,
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.007,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          userConfig.currentUser.id == event.creator!.id
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      size: 13,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    SizedBox(
                                      width: SizeConfig.screenWidth! * 0.013,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .strictTranslate('Created'),
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const Spacer(),
                          event.isPublic!
                              ? Icon(
                                  Icons.lock_open,
                                  size: 13,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : Icon(
                                  Icons.lock,
                                  size: 13,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.013,
                          ),
                          event.isPublic!
                              ? Text(
                                  AppLocalizations.of(context)!
                                      .strictTranslate('public'),
                                  style: Theme.of(context).textTheme.caption,
                                )
                              : Text(
                                  AppLocalizations.of(context)!
                                      .strictTranslate('private'),
                                  style: Theme.of(context).textTheme.caption,
                                ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.027,
                          ),
                          const Icon(
                            Icons.people_outline,
                            size: 13,
                            color: Color(0xff4285F4),
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.013,
                          ),
                          event.attendees != null
                              ? Text(
                                  event.attendees!,
                                  style: Theme.of(context).textTheme.caption,
                                )
                              : Text(
                                  '10',
                                  style: Theme.of(context).textTheme.caption,
                                )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: SizeConfig.screenHeight! * 0.007,
            right: SizeConfig.screenWidth! * 0.013,
            child:
                isRegistered && userConfig.currentUser.id != event.creator!.id
                    ? Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!
                                  .strictTranslate("Registered"),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
          )
        ],
      ),
    );
  }
}
