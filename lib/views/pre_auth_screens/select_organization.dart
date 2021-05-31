import 'package:flutter/material.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/data_parsers/org_info.dart';
import 'package:talawa/widgets/join_org_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/services/size_config.dart';

class SelectOrganization extends StatefulWidget {
  const SelectOrganization(
      {required Key key, required this.swipePage, required this.selectedOrgId})
      : super(key: key);
  final String selectedOrgId;
  final Function swipePage;

  @override
  _SelectOrganizationState createState() => _SelectOrganizationState();
}

class _SelectOrganizationState extends State<SelectOrganization> {
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');
  final ScrollController _controllerListedOrg = ScrollController();

  selectOrg(OrgInfo item) {
    setState(() {
      selectedOrganization = item;
    });
  }

  Widget showOrganizationList() {
    return Expanded(
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
              onTap: (item) => selectOrg(item),
              key: Key('OrgSelItem$index'),
              showIcon: true,
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
  void initState() {
    if (widget.selectedOrgId.contains('-1')) {
      print('here');
      organizations.forEach((element) {
        if (element.id == widget.selectedOrgId) {
          selectedOrganization = element;
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      selectedOrganization.id != '-1'
          ? JoinOrgTile(
              index: 0,
              item: selectedOrganization,
              onTap: (item) => selectOrg(item),
              key: const Key('OrgSelItem'),
              showIcon: true,
            )
          : const SizedBox(),
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
          if (selectedOrganization.id != '-1') {
            widget.swipePage();
            print('tapped');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Select one organization to continue'),
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
