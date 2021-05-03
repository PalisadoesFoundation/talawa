//flutter imported function
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

//files are imported here
import 'package:provider/provider.dart';
import 'package:talawa/utils/gql_client.dart';
import 'package:talawa/utils/ui_scaling.dart';
import '../../../utils/uidata.dart';
import 'reg_eventstab.dart';
import 'user_taskstab.dart';

// ignore: must_be_immutable
class MemberDetail extends StatefulWidget {
  MemberDetail(
      {Key key,
      @required this.member,
      @required this.color,
      this.admins,
      this.creatorId})
      : super(key: key);

  final List admins;
  final String creatorId;
  Map member;
  Color color;

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

  String getPrivilege(String id) {
    if (widget.creatorId.compareTo(id) == 0) {
      return 'Creator';
    }
    for (int i = 0; i < widget.admins.length; i++) {
      if (widget.admins[i]['_id'] == id) {
        return 'Admin';
      }
    }
    return 'Member';
  }

  //main build starts here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'User Info',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: CustomScrollView(slivers: [
          SliverAppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: SizeConfig.safeBlockVertical * 31.25,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(children: [
                  widget.member['image'] == null
                      ? defaultUserImg()
                      : userImg(widget.member['image'].toString()),
                  Card(
                      child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 5),
                    alignment: Alignment.centerLeft,
                    height: SizeConfig.safeBlockVertical * 3.75,
                    child: Text('User email: ${widget.member['email']}'),
                  )),
                  Card(
                      child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        left: SizeConfig.safeBlockHorizontal * 5),
                    alignment: Alignment.centerLeft,
                    height: SizeConfig.safeBlockVertical * 3.75,
                    child: Text(
                      'User Privileges: ' +
                          getPrivilege(widget.member['_id'].toString()),
                      key: Key('Privilege'),
                    ),
                  )),
                ]),
              )),
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
                          'Registered Events',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )),
            sliver: SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  UserTasks(
                    member: widget.member,
                  ),
                  RegisteredEvents(
                    member: widget.member,
                  ),
                ],
              ),
            ),
          ),
        ]));
  }

  //widget to get the user image
  Widget userImg(String link) {
    return Container(
      height: SizeConfig.safeBlockVertical * 21.25,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                  link),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(alignment: AlignmentDirectional.bottomStart, children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: Image.network(
                Provider.of<GraphQLConfiguration>(context).displayImgRoute +
                    link,
              ),
            ),
          ),
        ),
        Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black45, Colors.transparent]),
            ),
            padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
            height: SizeConfig.safeBlockVertical * 5,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.member['firstName'].toString() +
                    ' ' +
                    widget.member['lastName'].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ))
      ]),
    );
  }

  //this is widget for default user image
  Widget defaultUserImg() {
    return Container(
      height: SizeConfig.safeBlockVertical * 21.25,
      width: MediaQuery.of(context).size.width,
      color: widget.color,
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
              height: SizeConfig.safeBlockVertical * 16.25,
              child: Icon(
                Icons.person,
                size: SizeConfig.safeBlockVertical * 12.25,
                color: Colors.white54,
              )),
          Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black45, Colors.transparent]),
              ),
              padding:
                  EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
              height: SizeConfig.safeBlockVertical * 5,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.member['firstName'].toString() +
                      ' ' +
                      widget.member['lastName'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
