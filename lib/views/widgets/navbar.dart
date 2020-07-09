import 'package:flutter/material.dart';
import 'package:talawa/utils/uidata.dart';

class NavBar extends StatefulWidget {
  final PageController pageController;
  int currentIndex;
  NavBar({Key key, @required this.currentIndex, @required this.pageController}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (val) {
        widget.currentIndex = val;
        widget.pageController.jumpToPage(val);        
        setState(() {});
      },
     items: [
        BottomNavigationBarItem(
          backgroundColor: UIData.quitoThemeColor,
          title: Text("Home"),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          backgroundColor: UIData.quitoThemeColor,
          title: Text("Groups"),
          icon: Icon(Icons.group),
        ),
        BottomNavigationBarItem(
          backgroundColor: UIData.quitoThemeColor,
          title: Text("Organizations"),
          icon: Icon(Icons.business),
        ),
        BottomNavigationBarItem(
          backgroundColor: UIData.quitoThemeColor,
          title: Text("Events"),
          icon: Icon(Icons.calendar_today),
        ),
                BottomNavigationBarItem(
          backgroundColor: UIData.quitoThemeColor,
          title: Text("Profiles"),
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}

