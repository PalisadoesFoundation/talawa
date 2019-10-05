// import 'dart:async';

// import 'package:flutter_quito/logic/viewmodel/menu_view_model.dart';
// import 'package:flutter_quito/model/menu.dart';

// class MenuBloc {
//   final _menuVM = MenuViewModel();
//   final menuController = StreamController<List<Menu>>();

//   Stream<List<Menu>> get menuItems => menuController.stream;
//   void _init() async {
//     List<Menu> data = await getMenuItems();
//     menuController.add(data);
//   }

//   MenuBloc() {
//     menuItems = new Menu();
//     menuController.add(_menuVM.getMenuItems());
//   }
// }
