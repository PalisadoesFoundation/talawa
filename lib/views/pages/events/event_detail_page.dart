//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:talawa/utils/ui_scaling.dart';

//pages are imported here
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/events/registrant_list.dart';
import 'package:talawa/views/pages/events/task_list.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class EventDetail extends StatefulWidget {
  EventDetail({Key key, @required this.event}) : super(key: key);
  Map event;

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    print(widget.event);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.event['title'].toString(),
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
                        "To Do: ${widget.event['description'].toString()}",
                      ),
                      displayText(
                        "Held: ${widget.event['recurrance'][0]}${widget.event['recurrance'].substring(1).toLowerCase()}",
                      ),
                      displayText(
                        "Next: ${DateFormat.yMMMd('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event['startTime'].toString()))).toString()}",
                      ),
                      displayText(
                        "Where: ${widget.event['location'].toString()}",
                      ),
                      displayText(
                        "From: ${'${DateFormat.jm('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event['startTime'].toString())))} to ${DateFormat.jm('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event['endTime'].toString())))}'}",
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
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Material(
                  color: UIData.secondaryColor,
                  child: TabBar(
                    labelPadding: const EdgeInsets.all(0),
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    tabs: [
                      const Tab(
                        icon: const Text(
                          'Tasks',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Tab(
                        icon: const Text(
                          'Registrants',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )),
            sliver: SliverFillRemaining(
              child: Container(
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
          ),
        ],
      ),
    );
  }

  Widget displayText(String text) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: SizeConfig.safeBlockVertical * 5.5,
      child: Text(
        text,
        style: TextStyle(
            fontSize: SizeConfig.safeBlockVertical * 2.5, color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
