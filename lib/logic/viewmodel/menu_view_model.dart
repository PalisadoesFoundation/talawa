import 'package:flutter_quito/model/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_quito/utils/uidata.dart';
import 'package:flutter/material.dart';

class MenuViewModel {
  List<Menu> menuItems;

  MenuViewModel({this.menuItems});

  getMenuItems() {
    return menuItems = <Menu>[
      Menu(
          name: "Profile",
          menuColor: Color(0xff050505),
          icon: Icons.person,
          image: UIData.profileImage,
          items: ["View Profile", "Profile 2", "Profile 3", "Profile 4"]),
      Menu(
          name: "Shopping",
          menuColor: Color(0xffc8c4bd),
          icon: Icons.shopping_cart,
          image: UIData.shoppingImage,
          items: [
            "Shopping List",
            "Shopping Details",
            "Product Details",
            "Shopping 4"
          ]),
      Menu(
          name: "Login",
          menuColor: Color(0xffc7d8f4),
          icon: Icons.send,
          image: UIData.loginImage,
          items: ["Login With OTP", "Login 2", "Sign Up", "Login 4"]),
      Menu(
          name: "Timeline",
          menuColor: Color(0xff7f5741),
          icon: Icons.timeline,
          image: UIData.timelineImage,
          items: ["Feed", "Tweets", "Timeline 3", "Timeline 4"]),
      Menu(
          name: "Dashboard",
          menuColor: Color(0xff261d33),
          icon: Icons.dashboard,
          image: UIData.dashboardImage,
          items: ["Dashboard 1", "Dashboard 2", "Dashboard 3", "Dashboard 4"]),
      Menu(
          name: "Settings",
          menuColor: Color(0xff2a8ccf),
          icon: Icons.settings,
          image: UIData.settingsImage,
          items: ["Device Settings", "Settings 2", "Settings 3", "Settings 4"]),
      Menu(
          name: "No Item",
          menuColor: Color(0xffe19b6b),
          icon: Icons.not_interested,
          image: UIData.blankImage,
          items: ["No Search Result", "No Internet", "No Item 3", "No Item 4"]),
      Menu(
          name: "Payment",
          menuColor: Color(0xffddcec2),
          icon: Icons.payment,
          image: UIData.paymentImage,
          items: ["Credit Card", "Payment Success", "Payment 3", "Payment 4"]),
    ];
  }
  //   getMenuItems(){
  //     fetchMenuItems().then((value) {
  //       menuItems = value;
  //     });
  //     return menuItems;
  //   }
  //   Future<List<Menu>> fetchMenuItems() async {
  //   final response =
  //       await http.get('https://quito-api.herokuapp.com/projects/');

  //   if (response.statusCode == 200) {
  //     // If the call to the server was successful, parse the JSON.
  //     return (json.decode(response.body) as List)
  //           .map((data) => new Menu.fromJson(data))
  //           .toList();
  //     // return Menu.fromJson(json.decode(response.body));
  //   } else {
  //     // If that call was not successful, throw an error.
  //     throw Exception('Failed to load post');
  //   }
  // }
  
}
