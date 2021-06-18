import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

class JoinOrganisationAfterAuth extends StatelessWidget {
  const JoinOrganisationAfterAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectOrganizationViewModel>(
        onModelReady: (model) => model.initialise('-1'),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Join Organisation',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: CupertinoSearchTextField(
                    focusNode: model.searchFocus,
                    controller: model.searchController,
                    onChanged: (value) => model.setState(ViewState.idle),
                    suffixMode: OverlayVisibilityMode.always,
                    style: Theme.of(context).textTheme.headline5,
                    suffixIcon: const Icon(
                      CupertinoIcons.xmark_circle_fill,
                      size: 25,
                    ),
                    onSuffixTap: () {
                      model.searchController.clear();
                      model.organizations = [];
                      model.searchFocus.unfocus();
                      model.searching = false;
                      model.setState(ViewState.idle);
                    },
                  ),
                ),
                model.selectedOrganization.id != '-1'
                    ? Container(
                        color: Theme.of(context)
                            .colorScheme
                            .secondaryVariant
                            .withOpacity(0.2),
                        child: CustomListTile(
                          index: model.organizations
                              .indexOf(model.selectedOrganization),
                          type: TileType.org,
                          orgInfo: model.selectedOrganization,
                          onTapOrgInfo: (item) => model.selectOrg(item),
                          key: const Key('OrgSelItem'),
                          showIcon: true,
                        ),
                      )
                    : const SizedBox(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                  ),
                ),
                Expanded(
                    child: model.searching
                        ? model.showSearchList(model.searchController.text)
                        : model.showOrganizationList()),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.0215,
                ),
                model.selectedOrganization.id != '-1'
                    ? Column(
                        children: [
                          RaisedRoundedButton(
                            buttonLabel: 'Join selected organisation',
                            onTap: model.onTapJoin,
                            textColor: const Color(0xFF008A37),
                            key: const Key('JoinSelectedOrgButton'),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.0215,
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          );
        });
  }
}
