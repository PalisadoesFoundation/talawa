import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_card.dart';

///UserEvents to show events created by user in cureent organisation .
class UserEvents extends StatefulWidget {
  const UserEvents({
    required Key key,
  }) : super(key: key);

  @override
  State<UserEvents> createState() => _UserEventsState();
}

class _UserEventsState extends State<UserEvents>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseView<ExploreEventsViewModel>(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          body: model.isBusy
              ? const Center(child: CircularProgressIndicator())
              : model.userEvents.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You have no event in this organization',
                            style: TextStyle(
                              fontSize: SizeConfig.screenHeight! * 0.0275,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              navigationService.pushScreen(
                                "/createEventPage",
                              );
                            },
                            child: const Text('Create your first event'),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      key: const Key('UserEventsList'),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.userEvents.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              navigationService.pushScreen(
                                "/eventInfo",
                                arguments: {
                                  "event": model.events[index],
                                  "exploreEventViewModel": model,
                                },
                              );
                            },
                            child: EventCard(
                              event: model.userEvents[index],
                              isSearchItem: false,
                            ),
                          );
                        },
                      ),
                    ),
        );
      },
    );
  }
}
