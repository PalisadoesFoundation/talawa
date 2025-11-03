import 'package:flutter/material.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/select_organization_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/organization_list.dart';

/// JoinOrganisationAfterAuth returns a widget for page to join the organization just after user authentication.
class JoinOrganisationAfterAuth extends StatelessWidget {
  const JoinOrganisationAfterAuth({super.key, required this.orgId});

  /// org identifier.
  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectOrganizationViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          key: const Key('JoinOrgScreen'),
          // header for the widget
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)!
                  .strictTranslate('Join Organisation'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
              ),
              Expanded(
                child: OrganizationList(model: model),
              ),
              // SizedBox(
              //   height: SizeConfig.screenHeight! * 0.0215,
              // ),
            ],
          ),
        );
      },
    );
  }
}
