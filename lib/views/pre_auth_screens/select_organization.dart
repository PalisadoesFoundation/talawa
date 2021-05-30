import 'package:flutter/material.dart';
import 'package:talawa/constants/contants.dart';
import 'package:talawa/data_parsers/org_info.dart';
import 'package:talawa/widgets/join_org_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

import '../../services/size_config.dart';

class SelectOrganization extends StatefulWidget {
  const SelectOrganization({required Key key, required this.swipePage})
      : super(key: key);
  final Function swipePage;

  @override
  _SelectOrganizationState createState() => _SelectOrganizationState();
}

class _SelectOrganizationState extends State<SelectOrganization> {
  List<OrgInfo> selectedOrganizations = [];
  final ScrollController _controllerSelected = ScrollController();
  final ScrollController _controllerListedOrg = ScrollController();

  selectDeselectOrg(OrgInfo item) {
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
  }

  Widget showSelectedOrganizations() {
    return Expanded(
      flex: selectedOrganizations.isNotEmpty
          ? selectedOrganizations.length > 1
              ? 3
              : 1
          : 0,
      child: Scrollbar(
        controller: _controllerSelected,
        isAlwaysShown: true,
        interactive: true,
        child: ListView.separated(
          controller: _controllerSelected,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: selectedOrganizations.length,
          itemBuilder: (BuildContext context, int index) {
            return JoinOrgTile(
              index: index,
              item: organizations[index],
              onTap: (item) => selectDeselectOrg(item),
              showIcon: true,
              key: Key('OrgItem$index'),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Color(0xFFE5E5E5),
            );
          },
        ),
      ),
    );
  }

  Widget showOrganizationList() {
    return Expanded(
      flex: selectedOrganizations.isNotEmpty ? 6 : 1,
      child: Scrollbar(
        isAlwaysShown: true,
        interactive: true,
        controller: _controllerListedOrg,
        child: ListView.separated(
          controller: _controllerListedOrg,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: organizations.length,
          itemBuilder: (BuildContext context, int index) {
            return JoinOrgTile(
              index: index,
              item: organizations[index],
              onTap: (item) => selectDeselectOrg(item),
              key: Key('OrgSelItem$index'),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth! * 0.2, right: 20),
              child: const Divider(
                color: Color(0xFFE5E5E5),
                thickness: 1.5,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      showSelectedOrganizations(),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Divider(
          color: Colors.grey,
          thickness: 2.0,
        ),
      ),
      showOrganizationList(),
      SizedBox(
        height: SizeConfig.screenHeight! * 0.0215,
      ),
      RaisedRoundedButton(
        buttonLabel: 'Continue',
        onTap: () {
          if (selectedOrganizations.isNotEmpty) {
            widget.swipePage();
            print('tapped');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Select at least one organization to continue'),
              duration: Duration(milliseconds: 750),
            ));
          }
        },
        textColor: const Color(0xFF008A37),
        key: const Key('SignUpLoginDetailsButton'),
        backgroundColor: Colors.white,
      ),
      SizedBox(
        height: SizeConfig.screenHeight! * 0.0215,
      ),
    ]);
  }
}
