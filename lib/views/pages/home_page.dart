import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quito/controllers/projects_controller.dart';
import 'package:flutter_quito/model/project.dart';
import 'package:flutter_quito/views/widgets/common_drawer.dart';
import 'package:flutter_quito/utils/uidata.dart';

class HomePage extends StatelessWidget {
  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    deviceSize = MediaQuery.of(context).size;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? homeIOS(context)
        : homeScaffold(context);
  }

  Widget homeScaffold(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: Scaffold(
            key: _scaffoldState,
            body: bodySliverList(),
            drawer: CommonDrawer()),
      );

  Widget bodySliverList() {
    // MenuBloc menuBloc = MenuBloc();
    ProjectController projectController = new ProjectController();
    return FutureBuilder<List<Project>>(
        future: projectController.getProjects(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
                  slivers: <Widget>[
                    appBar(),
                    bodyGrid(snapshot.data),
                  ],
                )
              : Center(child: CircularProgressIndicator());
        });
  }

  //appbar
  Widget appBar() => SliverAppBar(
        backgroundColor: Colors.black,
        pinned: true,
        elevation: 10.0,
        forceElevated: true,
        expandedHeight: 150.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: false,
          background: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: UIData.kitGradients)),
          ),
          title: Row(
            children: <Widget>[
              FlutterLogo(
                colors: Colors.purple,
                textColor: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(UIData.appName)
            ],
          ),
        ),
      );

  //bodygrid
  Widget bodyGrid(List<Project> project) => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(_context).orientation == Orientation.portrait
                  ? 2
                  : 3,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return menuStack(context, project[index]);
        }, childCount: project.length),
      );

  //menuStack
  Widget menuStack(BuildContext context, Project project) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, UIData.projectDetails, arguments: project);
        },
        splashColor: Colors.orange,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              menuImage(project),
              menuColor(),
              menuData(project),
            ],
          ),
        ),
      );

  //stack 1/3
  Widget menuImage(Project project) => Image.asset(
        project.image,
        fit: BoxFit.cover,
      );

  //stack 2/3
  Widget menuColor() => new Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 5.0,
          ),
        ]),
      );

  //stack 3/3
  Widget menuData(Project project) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            project.icon,
            color: Colors.white,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            project.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      );

  void _showModalBottomSheet(BuildContext context, Project project) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(15.0),
                    topRight: new Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
            )));
  }

  Widget iosCardBottom(Project project, BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 3.0, color: Colors.white),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        project.image,
                      ))),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              project.name,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 20.0,
            ),
            FittedBox(
              child: CupertinoButton(
                onPressed: () => _showModalBottomSheet(context, project),
                borderRadius: BorderRadius.circular(50.0),
                child: Text(
                  "Go",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: CupertinoColors.activeBlue),
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
      );

  Widget menuIOS(Project project, BuildContext context) {
    return Container(
      height: deviceSize.height / 2,
      decoration: ShapeDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3.0,
        margin: EdgeInsets.all(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            menuImage(project),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                project.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              height: 60.0,
              child: Container(
                width: double.infinity,
                color: project.menuColor,
                child: iosCardBottom(project, context),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bodyDataIOS(List<Project> data, BuildContext context) => SliverList(
        delegate: SliverChildListDelegate(
            data.map((project) => menuIOS(project, context)).toList()),
      );

  Widget homeBodyIOS(BuildContext context) {
    ProjectController projectController = new ProjectController();
    return FutureBuilder<List<Project>>(
        future: projectController.getProjects(),
        initialData: List(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? bodyDataIOS(snapshot.data, context)
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }

  Widget homeIOS(BuildContext context) => Theme(
        data: ThemeData(
          fontFamily: '.SF Pro Text',
        ).copyWith(canvasColor: Colors.transparent),
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                border: Border(bottom: BorderSide.none),
                backgroundColor: CupertinoColors.white,
                largeTitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(UIData.appName),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: CupertinoColors.black,
                        child: FlutterLogo(
                          size: 15.0,
                          colors: Colors.yellow,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              homeBodyIOS(context)
            ],
          ),
        ),
      );
}
