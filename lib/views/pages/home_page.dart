import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quito/controllers/projects_controller.dart';
import 'package:flutter_quito/model/project.dart';
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
                Icons.share,
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
        ));
  }

  Widget projectList() {
    ProjectController projectController = new ProjectController();
    return FutureBuilder<List<Project>>(
        future: projectController.getProjects(),
        builder: (_context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_context, index) {
                    Project project = snapshot.data[index];
                    return Column(
                      children: <Widget>[eventCard(project)],
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget eventCard(Project project) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(_context, UIData.projectDetails,
              arguments: project);
        },
        child: new Container(
          height: 140,
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        project.name,
                        style: TextStyle(fontSize: 25),
                      ),
                      Text('Nov 1 - ' + project.time,
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 90.0,
                        height: 45,
                        child: Stack(
                          //alignment:new Alignment(x, y)
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text('S',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                            ),
                            new Positioned(
                              left: 24.0,
                              child: new CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text('R',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0)),
                              ),
                            ),
                            new Positioned(
                              left: 48.0,
                              child: new CircleAvatar(
                                backgroundColor: Colors.blue,
                                child: Text('+3',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
