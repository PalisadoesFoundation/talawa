import 'package:flutter/material.dart';

class MemberListTile extends StatelessWidget {
  const MemberListTile(
      {Key? key,
      required this.userImageUrl,
      required this.firstName,
      required this.lastName})
      : super(key: key);
  final String userImageUrl;
  final String firstName;
  final String lastName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.withOpacity(0.5),
      ),
      title: Text(
        '$firstName $lastName',
        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
      ),
    );
  }
}
