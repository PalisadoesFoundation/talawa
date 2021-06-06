//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/ui_scaling.dart';

//pages are imported here
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/events/registrant_list.dart';
import 'package:talawa/views/pages/events/task_list.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class EventDetail extends StatefulWidget {
  EventDetail({Key key, @required this.event}) : super(key: key);
  EventsModel event;

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    debugPrint(widget.event.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.event.title,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: SizeConfig.safeBlockVertical * 40,
            flexibleSpace: FlexibleSpaceBar(
              background: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: SizeConfig.safeBlockVertical * 40,
                  width: width,
                  color: UIData.primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      displayText(
                        "${AppLocalizations.of(context).translate("To Do")}: ${widget.event.description}",
                      ),
                      displayText(
                        "${AppLocalizations.of(context).translate("Held")}: ${widget.event.recurrance.toString()[0]}${widget.event.recurrance.toString().substring(1).toLowerCase()}",
                      ),
                      displayText(
                        "${AppLocalizations.of(context).translate("Next")}: ${DateFormat.yMMMd('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event.startTime))).toString()}",
                      ),
                      displayText(
                        "${AppLocalizations.of(context).translate("Where")}: ${widget.event.location.toString()}",
                      ),
                      displayText(
                        "${AppLocalizations.of(context).translate("From")}: ${'${DateFormat.jm('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event.startTime)))} to ${DateFormat.jm('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event.endTime)))}'}",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
              height: SizeConfig.safeBlockVertical * 7.5,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Material(
                color: UIData.secondaryColor,
                child: TabBar(
                  labelPadding: const EdgeInsets.all(0),
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Text(
                        AppLocalizations.of(context).translate('Tasks'),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        AppLocalizations.of(context).translate('Registrants'),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sliver: SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  TaskList(
                    event: widget.event,
                  ),
                  RegList(
                    event: widget.event,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget displayText(String text) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: SizeConfig.safeBlockVertical * 5.5,
      child: Text(
        text,
        style: TextStyle(
          fontSize: SizeConfig.safeBlockVertical * 2.5,
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
