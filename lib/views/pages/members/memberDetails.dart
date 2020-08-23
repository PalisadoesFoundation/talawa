import 'package:flutter/material.dart';

import '../../../utils/uidata.dart';
import 'memberRegEvents.dart';
import 'userTasks.dart';

class MemberDetail extends StatefulWidget {
  Map member;
  Color color;
  MemberDetail({Key key, @required this.member, @required this.color})
      : super(key: key);

  @override
  _MemberDetailState createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                    height: 130,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white54,
                    )),
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black45, Colors.transparent]),
                    ),
                    padding: EdgeInsets.only(left: 20),
                    height: 40,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.member['firstName'].toString() +
                            ' ' +
                            widget.member['lastName'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ))
              ],
            ),
            color: widget.color,
          ),
          Card(
              child: Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 30,
            child: Text('User email: ' + widget.member['email'].toString()),
          )),
          Card(
              child: Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 30,
            child: Text('User Privilages:'),
          )),
          Container(
              height: 70.0,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
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
                        'Registered Events',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                UserTasks(),
                RegisterdEvents(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
