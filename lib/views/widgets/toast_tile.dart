import 'package:flutter/material.dart';

class ToastTile extends StatelessWidget {
  final bool success;
  final String msg;
  ToastTile({this.success,this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: success?Colors.green:Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
        ],
      ),
    );
  }
}
