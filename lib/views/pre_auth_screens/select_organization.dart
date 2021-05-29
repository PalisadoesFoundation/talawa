import 'package:flutter/material.dart';
import 'package:talawa/constants/contants.dart';
import 'package:talawa/data_parsers/org_info.dart';
import 'package:talawa/data_parsers/user_info.dart';

import '../../size_config.dart';

class SelectOrganization extends StatefulWidget {
  const SelectOrganization({required Key key, required this.swipePage})
      : super(key: key);
  final Function swipePage;

  @override
  _SelectOrganizationState createState() => _SelectOrganizationState();
}

class _SelectOrganizationState extends State<SelectOrganization> {
  List<OrgInfo> selectedOrganizations = [];

  Widget showSelectedOrganizations() {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: selectedOrganizations.length,
      itemBuilder: (BuildContext context, int index) {
        return orgInfoTile(index, selectedOrganizations[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xFFE5E5E5),
        );
      },
    );
  }

  Widget showOrganizationList() {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: organizations.length,
      itemBuilder: (BuildContext context, int index) {
        return orgInfoTile(index, organizations[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xFFE5E5E5),
        );
      },
    );
  }

  Widget orgInfoTile(int index, OrgInfo item) {
    return ListTile(
      onTap: () {
        setState(() {
          bool present = false;
          selectedOrganizations.forEach((org) {
            if (org.id == item.id) {
              present = true;
            }
          });
          if (present) {
            selectedOrganizations.remove(item);
          } else {
            selectedOrganizations.add(item);
          }
        });
      },
      leading: const CircleAvatar(
        radius: 25,
      ),
      title: Text(item.name!),
      subtitle: Text(
          'Creator: ${item.creatorInfo!.firstName!} ${item.creatorInfo!.lastName!}'),
      // ignore: sized_box_for_whitespace
      trailing: Container(
        width: SizeConfig.screenWidth! * 0.125,
        child: Column(
          children: [
            Icon(
              item.isPublic! ? Icons.lock_open : Icons.lock,
              color: item.isPublic!
                  ? const Color(0xFF34AD64)
                  : const Color(0xffFABC57),
            ),
            Text(item.isPublic! ? 'Public' : 'Private')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
      Column(
        children: [
          showSelectedOrganizations(),
        ],
      ),
      const Divider(
        color: Colors.black,
        thickness: 2.0,
      ),
      Column(
        children: [showOrganizationList()],
      )
    ]);
  }
}
