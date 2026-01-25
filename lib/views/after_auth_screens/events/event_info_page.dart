import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
<<<<<<< HEAD
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
=======
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
>>>>>>> upstream/develop
import 'package:talawa/views/after_auth_screens/events/event_info_body.dart';
import 'package:talawa/views/after_auth_screens/events/manage_agenda_items_screen.dart';
import 'package:talawa/views/after_auth_screens/events/volunteer_groups_screen.dart';
import 'package:talawa/views/base_view.dart';

/// EventInfoPage returns a widget that has mutable state _EventInfoPageState.
class EventInfoPage extends StatefulWidget {
<<<<<<< HEAD
  const EventInfoPage({super.key, required this.args});

  /// Takes in Arguments for the Page.
  final Map<String, dynamic> args;
=======
  const EventInfoPage({super.key, required this.event});

  /// Takes in Arguments for the Page.
  final Event event;
>>>>>>> upstream/develop

  @override
  _EventInfoPageState createState() => _EventInfoPageState();
}

class _EventInfoPageState extends State<EventInfoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showFloatingActionButton = true;
<<<<<<< HEAD
=======
  late bool _isCreator;
>>>>>>> upstream/develop

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    // TabController length will depend on whether the user is the event creator
    final bool isCreator = (widget.args["event"] as Event).creator!.id ==
        userConfig.currentUser.id;
    final int tabCount = isCreator ? 3 : 2;

=======
    // Check if the user is the creator of the event
    _isCreator = widget.event.creator?.id == userConfig.currentUser.id;

    final int tabCount = _isCreator ? 3 : 2;
>>>>>>> upstream/develop
    _tabController = TabController(length: tabCount, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _showFloatingActionButton = _tabController.index == 0;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<EventInfoViewModel>(
<<<<<<< HEAD
      onModelReady: (model) => model.initialize(args: widget.args),
      builder: (context, model, child) {
        final bool isCreator = model.event.creator != null &&
            model.event.creator!.id == userConfig.currentUser.id;

=======
      onModelReady: (model) => model.initialize(widget.event),
      builder: (context, model, child) {
>>>>>>> upstream/develop
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('Event Details'),
            ),
            bottom: TabBar(
              key: const Key("tabBar"),
              controller: _tabController,
              tabs: [
                const Tab(
                  text: "Info",
<<<<<<< HEAD
                  key: Key('info_tag'),
                ),
                const Tab(
                  text: "Volunteers",
                  key: Key('volunteer_tag'),
                ),
                if (isCreator)
                  const Tab(
                    text: "Agendas",
                    key: Key('agenda_tag'),
=======
                ),
                const Tab(
                  text: "Volunteers",
                ),
                if (_isCreator)
                  const Tab(
                    text: "Agendas",
>>>>>>> upstream/develop
                  ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
<<<<<<< HEAD
              Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      expandedHeight: SizeConfig.screenWidth,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image.network(
                          'https://picsum.photos/id/26/200/300',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const EventInfoBody(),
                  ],
                ),
                floatingActionButton: _showFloatingActionButton
                    ? (model.event.creator != null &&
                            model.event.creator!.id !=
                                userConfig.currentUser.id)
                        ? FloatingActionButton.extended(
                            key: const Key("registerEventFloatingbtn"),
                            onPressed: () {
                              model.registerForEvent();
                            },
                            label: Text(
                              AppLocalizations.of(context)!
                                  .strictTranslate(model.fabTitle),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          )
                        : FloatingActionButton(
                            onPressed: () {
                              (widget.args["exploreEventViewModel"]
                                      as ExploreEventsViewModel)
                                  .deleteEvent(eventId: model.event.id!);
                            },
                            foregroundColor:
                                Theme.of(context).colorScheme.secondary,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: const Icon(Icons.delete),
                          )
                    : null,
              ),
              VolunteerGroupsScreen(event: model.event, model: model),
              if (isCreator) const ManageAgendaScreen(),
            ],
          ),
=======
              const CustomScrollView(
                slivers: [
                  EventInfoBody(),
                ],
              ),
              VolunteerGroupsScreen(event: model.event, model: model),
              if (_isCreator) const ManageAgendaScreen(),
            ],
          ),
          floatingActionButton: _showFloatingActionButton
              ? _isCreator
                  ? FloatingActionButton(
                      heroTag: "event_info_delete_fab",
                      onPressed: () {
                        // Use the EventInfoViewModel to handle deletion
                        model.deleteEvent();
                      },
                      foregroundColor: Theme.of(context).colorScheme.secondary,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(Icons.delete),
                    )
                  : FloatingActionButton.extended(
                      key: const Key("registerEventFloatingbtn"),
                      heroTag: "event_info_register_fab",
                      onPressed: () {
                        model.registerForEvent();
                      },
                      label: Text(
                        AppLocalizations.of(context)!
                            .strictTranslate(model.fabTitle),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
              : null,
>>>>>>> upstream/develop
        );
      },
    );
  }
}
