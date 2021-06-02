import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/explore_events_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/event_card.dart';

class ExploreEvents extends StatefulWidget {
  const ExploreEvents({required Key key}) : super(key: key);

  @override
  _ExploreEventsState createState() => _ExploreEventsState();
}

class _ExploreEventsState extends State<ExploreEvents> {
  String _chosenValue = 'My Events';

  @override
  Widget build(BuildContext context) {
    return BaseView<ExploreEventsViewModel>(
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                key: const Key("ExploreEventsAppBar"),
                elevation: 0.0,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  'Explore Events',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: SizeConfig.screenWidth! * 0.027,
                    ),
                    child: const Icon(
                      Icons.search,
                      size: 20,
                    ),
                  )
                ],
              ),
              body: model.isBusy
                  ? const CircularProgressIndicator()
                  : SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * 0.027),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  elevation: 2,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    width: SizeConfig.screenWidth! * 0.55,
                                    child: DropdownButtonHideUnderline(
                                        child: dropDownList()),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return const ExploreEventDialog(
                                              key: Key('ExploreEvents'));
                                        });
                                  },
                                  child: Card(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    child: SizedBox(
                                      height: SizeConfig.screenHeight! * 0.068,
                                      width: SizeConfig.screenWidth! * 0.27,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.calendar_today,
                                            color: Color(0xff524F4F),
                                            size: 19,
                                          ),
                                          const Text(
                                            "22 May",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.027,
                            ),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: model.events.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return EventCard(
                                    event: model.events[index],
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
                ),
                label: Text(
                  "Event",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).accentColor),
                ),
              ),
            ));
  }

  Widget dropDownList() {
    return DropdownButton<String>(
      value: _chosenValue,
      items: <String>[
        'My Events',
        'Public Events',
        'Private Events',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Theme.of(context).accentColor),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _chosenValue = value.toString();
        });
      },
    );
  }
}
