import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/event_info_body.dart';
import 'package:talawa/views/base_view.dart';
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
                title: Text(AppLocalizations.of(context)!
                    .strictTranslate('Event Details')),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () => SocialShare.shareOptions(
                      'https://cyberwake.github.io/applink/eventInvite?setUrl=${GraphqlConfig.orgURI}&selectOrg=${userConfig.currentOrg.id!}&eventId=${model.event.id}',
                    ),
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
              const EventInfoBody()
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
