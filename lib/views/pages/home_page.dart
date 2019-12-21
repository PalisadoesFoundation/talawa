import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quito/controllers/activity_controller.dart';
import 'package:flutter_quito/model/activity.dart';
import 'package:flutter_quito/utils/uidata.dart';

class HomePage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  BuildContext _context;

  // Widget build(BuildContext context) {
  //   _context = context;
  //   return homeScaffold(context);
  // }
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: new AppBar(
        title: Image(
          image: AssetImage(UIData.quitoLogo),
          height: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            color: Colors.black,
            onPressed: () {},
            tooltip: 'Share',
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image(
              image: AssetImage(UIData.quitoBackground),
              fit: BoxFit.fill,
            ),
          ),
          projectList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(_context, UIData.addActivityPage);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget projectList() {
    ActivityController activityController = new ActivityController();
    return FutureBuilder<List<Activity>>(
        future: activityController.getProjects(),
        builder: (_context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_context, index) {
                    if(snapshot.data.length > 0){
                      
                    }
                    Activity activity = snapshot.data[index];
                    return Column(
                      children: <Widget>[eventCard(activity)],
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget eventCard(Activity activity) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(_context, UIData.activityDetails,
              arguments: activity);
        },
        child: new Container(
          height: 125,
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
                        activity.name,
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(activity.date + '\n' + activity.time,
                          style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 18,
                              ),
                              activity.users.length > 9
                                  ? Text('+9',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0))
                                  : Text(activity.users.length.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0)),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
