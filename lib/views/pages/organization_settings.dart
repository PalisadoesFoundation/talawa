import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/utils/uidata.dart';

import 'create_organization.dart';
import 'update_organization.dart';

class OrganizationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Organization Settings'),
        ),
        body: Container(
          child: Column(children: <Widget>[
            ListTile(
                title: Text(
                  'Create New Organization',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.add_circle,
                  color: UIData.secondaryColor,
                ),
                onTap: () {
                  pushNewScreen(
                    context,
                    withNavBar: false,
                    screen: CreateOrganization(),
                  );
                }),
            ListTile(
                title: Text(
                  'Update Organization',
                  style: TextStyle(fontSize: 18.0),
                ),
                leading: Icon(
                  Icons.compare_arrows,
                  color: UIData.secondaryColor,
                ),
                onTap: () {
                  pushNewScreen(
                    context,
                    withNavBar: false,
                    screen: UpdateOrganization(),
                  );
                }),
          ]),
        ));
  }
}
