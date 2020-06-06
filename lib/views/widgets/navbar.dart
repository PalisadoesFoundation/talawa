import 'package:flutter/material.dart';
import 'package:navigation_rail/navigation_rail.dart';

import 'package:talawa/utils/uidata.dart';
class NavBar extends StatefulWidget {
  final int currentIndex;
  NavBar({Key key, @required this.currentIndex}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Row( 
       children: [NavRail(
      currentIndex: widget.currentIndex,
      onTap: (val) {
        if (val == 0) {
          Navigator.pushNamed(context, UIData.addActivityPage);
        }
        if (val == 1) {
          Navigator.pushNamed(context, UIData.addActivityPage);
        }        
        if (val == 2) {
          Navigator.pushNamed(context, UIData.addActivityPage);
        }        
        if (val == 3) {
          Navigator.pushNamed(context, UIData.addActivityPage);
        }        
        if (val == 4) {
          Navigator.pushNamed(context, UIData.addActivityPage);
        } 
      },
      tabs: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text("Home"),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text("Groups"),
          icon: Icon(Icons.group),
        ),
        BottomNavigationBarItem(
          title: Text("Organizations"),
          icon: Icon(Icons.business),
        ),
        BottomNavigationBarItem(
          title: Text("Events"),
          icon: Icon(Icons.calendar_today),
        ),
                BottomNavigationBarItem(
          title: Text("Profiles"),
          icon: Icon(Icons.person),
        ),
      ],
    ),
    Expanded(child: PageView(
      scrollDirection: Axis.vertical,
      children: []),)
      ]
    );
  }
}