import 'package:flutter/material.dart';

class SearchTextInputWidget extends StatelessWidget {
  final Function onChanged;
  final TextEditingController controller;
  final String hintText;
  // ignore: sort_constructors_first
  const SearchTextInputWidget(
      {Key key, this.onChanged, this.controller, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChanged(value);
      },
      controller: controller,
      textAlign: TextAlign.left,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.white, width: 0.0),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(Icons.search, color: Colors.black),
          ),
          hintText: hintText),
    );
  }
}
