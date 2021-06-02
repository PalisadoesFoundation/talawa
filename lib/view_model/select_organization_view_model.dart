import 'package:flutter/material.dart';
import 'package:talawa/constants/constants.dart';
import 'package:talawa/enums/view_state.dart';
import 'package:talawa/models/org_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/join_org_tile.dart';

import '../locator.dart';

class SelectOrganizationViewModel extends BaseModel {
  late OrgInfo selectedOrganization = OrgInfo(id: '-1');
  final ScrollController controller = ScrollController();

  initialise(String initialData) {
    if (initialData.contains('-1')) {
      print('here');
      organizations.forEach((element) {
        if (element.id == initialData) {
          selectedOrganization = element;
        }
      });
    }
  }

  selectOrg(OrgInfo item) {
    setState(ViewState.busy);
    selectedOrganization = item;
    setState(ViewState.idle);
  }

  onTapContinue() {
    if (selectedOrganization.id != '-1') {
      locator<NavigationService>()
          .pushScreen('/signupDetails', arguments: selectedOrganization.id);
      print('tapped');
    } else {
      locator<NavigationService>().showSnackBar(
          'Select one organization to continue',
          duration: const Duration(milliseconds: 750));
    }
  }

  Widget showOrganizationList() {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        interactive: true,
        controller: controller,
        child: ListView.separated(
          controller: controller,
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
}
