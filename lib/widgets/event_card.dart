import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/size_config.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key? key, required this.event}) : super(key: key);
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: event.isSubscribed == 'true'
                ? BorderSide(
                    color: Theme.of(context).accentColor,
                    width: SizeConfig.screenWidth! * 0.008,
                  )
                : BorderSide.none,
          ),
          elevation: 3,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenHeight! * 0.11,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.5),
                // child: Image.network(
                //   'https://picsum.photos/id/50/200/300',
                //   fit: BoxFit.fill,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          event.title!,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const Spacer(),
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
                        )
                      ],
                    ),
                    Row(
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
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.044,
                        ),
                        const Icon(
                          Icons.place,
                          size: 12,
                        ),
                        Text(
                          event.location!,
                          style: Theme.of(context).textTheme.caption,
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
                        event.isPublic == 'true'
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
                        event.isPublic == 'true'
                            ? Text(
                                'public',
                                style: Theme.of(context).textTheme.caption,
                              )
                            : Text(
                                'private',
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
                        Text(
                          event.attendees!,
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
          child: event.isSubscribed == 'true'
              ? Container(
                  height: SizeConfig.screenHeight! * 0.041,
                  width: SizeConfig.screenWidth! * 0.277,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15))),
                  child: Center(
                    child: Text(
                      'Subscribed',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
