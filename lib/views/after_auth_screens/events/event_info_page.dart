import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_body.dart';
import 'package:talawa/views/after_auth_screens/events/manage_agenda_items_screen.dart';
import 'package:talawa/views/after_auth_screens/events/volunteer_groups_screen.dart';
import 'package:talawa/views/base_view.dart';

/// EventInfoPage returns a widget that has mutable state _EventInfoPageState.
class EventInfoPage extends StatefulWidget {
  const EventInfoPage({super.key, required this.args});

  /// Takes in Arguments for the Page.
  final Map<String, dynamic> args;

  @override
  _EventInfoPageState createState() => _EventInfoPageState();
}

class _EventInfoPageState extends State<EventInfoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _showFloatingActionButton = true;

  @override
  void initState() {
    super.initState();
    // TabController length will depend on whether the user is the event creator
    final bool isCreator = (widget.args["event"] as Event).creator?.id ==
        userConfig.currentUser.id;
    final int tabCount = isCreator ? 3 : 2;

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
      onModelReady: (model) => model.initialize(args: widget.args),
      builder: (context, model, child) {
        final bool isCreator = model.event.creator != null &&
            model.event.creator?.id == userConfig.currentUser.id;

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
                  ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
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
                            model.event.creator?.id !=
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
                                  .deleteEvent(eventId: model.event.id ?? "");
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
        );
      },
    );
  }
}
