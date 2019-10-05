import 'package:flutter_quito/model/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuViewModel {
  // List<Menu> menuItems;
  // MenuViewModel({this.menuItems});

    Future<List<Menu>> getMenuItems() async {
    final response =
        await http.get('https://quito-api.herokuapp.com/projects/');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return (json.decode(response.body) as List)
            .map((data) => new Menu.fromJson(data))
            .toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
  
}
