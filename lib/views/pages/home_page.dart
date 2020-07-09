import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/controllers/activity_controller.dart';
import 'package:talawa/controllers/auth_controller.dart';
import 'package:talawa/controllers/note_controller.dart';
import 'package:talawa/model/activity.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/views/widgets/common_drawer.dart';
import 'package:intl/intl.dart';

import 'package:talawa/controllers/user_controller.dart';
import 'package:talawa/model/user.dart';

import 'package:talawa/enums/connectivity_status.dart';

import 'package:talawa/views/widgets/navbar.dart';
import 'package:talawa/views/pages/events.dart';
import 'package:talawa/views/pages/newsfeed.dart';
import 'package:talawa/views/pages/addEventPage.dart';



class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _showSnackBar() {
    print("Show SnackBar Here");
    final snackBar = new SnackBar(content: new Text("Device Disconnected"));
    _scaffoldKey.currentState.showSnackBar(snackBar);
    return CircularProgressIndicator();
  }

  BuildContext _context;

Widget homeAppBar(scaffoldKey) {
    return AppBar(
      title: Text("Activities"),
      leading: Consumer2<AuthController, UserController>(
          builder: (context, authController, userController, child) {
        return FutureBuilder(
            future: userController.getUser(authController.currentUserId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User user = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          user.firstName.substring(0, 1).toUpperCase(),
                          style: TextStyle(fontSize: 25, color: Colors.white70),
                        ),
                      ),
                      onTap: () => scaffoldKey.currentState.openDrawer()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      }),

      backgroundColor: UIData.quitoThemeColor,
      elevation: 0.0,
    );
  }

  Stack homeBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image(
            image: AssetImage(UIData.quitoBackground),
            fit: BoxFit.fill,
          ),
        ),
        activityList(context),
      ],
    );
  }

  Widget activityList(_context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 11,
            child: Consumer2<ActivityController, AuthController>(
                builder: (context, activityController, authController, child) {
              return FutureBuilder<List<Activity>>(
                  future: activityController.getActivitiesByUser(
                      context, authController.currentUserId),
                  builder: (_context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (_context, index) {
                            Activity activity = snapshot.data[index];
                            return Column(
                              children: <Widget>[eventCard(activity, _context)],
                            );
                          },
                        );
                      } else {
                        return Center(
                            child: Text('No Activities',
                                style: TextStyle(color: Colors.grey)));
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  });
            })),
      ],
    );
  }

  Widget eventCard(Activity activity, _context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(_context, UIData.activityDetails,
              arguments: activity);
        },
        child: new Container(
          height: 135,
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        activity.title,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          DateFormat("MMMM d, y\nh:mm aaa")
                              .format(activity.datetime),
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }


  FloatingActionButton homeFAB(BuildContext _context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(_context, UIData.addActivityPage);
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: homeAppBar(_scaffoldKey),
      drawer: CommonDrawer(),
      body: homeBody(context),
      floatingActionButton: homeFAB(_context),
    );
  }
}