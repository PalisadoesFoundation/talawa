import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/organization_list.dart';

/// This widget lets the user select new organizations.
///
/// There is a list tile which displays the organization selected by the user.
/// He/she needs to press the "continue" button to proceed.
class SelectOrganization extends StatefulWidget {
  const SelectOrganization({required Key key, required this.selectedOrgId})
      : super(key: key);

  /// Contains Integer value for selected org id.
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
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical!),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!
                        .strictTranslate("Choose an Organization"),
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                Expanded(child: OrganizationList(model: model)),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.0215,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
