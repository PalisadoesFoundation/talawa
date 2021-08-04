import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/signup_progress_indicator.dart';

class SelectOrganization extends StatefulWidget {
  const SelectOrganization({required Key key, required this.selectedOrgId})
      : super(key: key);
  final String selectedOrgId;

  @override
  _SelectOrganizationState createState() => _SelectOrganizationState();
}

class _SelectOrganizationState extends State<SelectOrganization> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SelectOrganizationViewModel>(
        onModelReady: (model) => model.initialise(widget.selectedOrgId),
        builder: (context, model, child) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    navigationService.pop();
                  },
                ),
              ),
              body: Padding(
                  padding:
                      EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 6),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SignupProgressIndicator(
                            key: const Key('SelectOrg'), currentPageIndex: 0),
                        model.selectedOrganization.id != '-1'
                            ? Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .strictTranslate('Selected Organization'),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              )
                            : const SizedBox(),
                        model.selectedOrganization.id != '-1'
                            ? CustomListTile(
                                index: model.organizations
                                    .indexOf(model.selectedOrganization),
                                type: TileType.org,
                                orgInfo: model.selectedOrganization,
                                onTapOrgInfo: (item) => model.selectOrg(item),
                                key: const Key('OrgSelItem'),
                                showIcon: false,
                              )
                            : const SizedBox(),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Divider(
                            color: Colors.grey,
                            thickness: 2.0,
                          ),
                        ),
                        Expanded(child: model.showOrganizationList()),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.0215,
                        ),
                        RaisedRoundedButton(
                          buttonLabel: AppLocalizations.of(context)!
                              .strictTranslate('Continue'),
                          onTap: model.onTapContinue,
                          textColor: const Color(0xFF008A37),
                          key: const Key('SignUpLoginDetailsButton'),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.0215,
                        ),
                      ])));
        });
  }
}
