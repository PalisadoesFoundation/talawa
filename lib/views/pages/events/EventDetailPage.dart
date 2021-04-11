//flutter packages are called here
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

//pages are imported here
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/pages/events/registrantList.dart';
import 'package:talawa/views/pages/events/taskList.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class EventDetail extends StatefulWidget {
  Map event;
  EventDetail({Key key, @required this.event}) : super(key: key);

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
    var width = MediaQuery.of(context).size.width;
    print(widget.event);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.event['title'],
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: FittedBox(
                child: Container(
                  height: 300,
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
                        "Next: ${DateFormat.yMMMd('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event['startTime']))).toString()}",
                      ),
                      displayText(
                        "Where: ${widget.event['location'].toString()}",
                      ),
                      displayText(
                        "From: ${DateFormat.jm('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event['startTime']))).toString() + ' to ' + DateFormat.jm('en_US').format(DateTime.fromMicrosecondsSinceEpoch(int.parse(widget.event['endTime']))).toString()}",
                      ),
                    ],
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverStickyHeader(
            header: Container(
                height: 60.0,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: Material(
                  color: UIData.secondaryColor,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        icon: Text(
                          'Tasks',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          'Registrants',
                          style: TextStyle(color: Colors.white),
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
      decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 40,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
