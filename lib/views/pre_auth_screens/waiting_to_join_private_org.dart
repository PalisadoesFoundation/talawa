// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/pre_auth_view_models/waiting_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/widgets/signup_progress_indicator.dart';

/// This class returns a widget which shows the request sent by the user to join a private organization.
class WaitingPage extends StatelessWidget {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WaitingViewModel>(
      onModelReady: (model) => model.initialise(context),
      builder: (context, model, child) {
        return Scaffold(
          key: const Key('WaitingPageScaffold'),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
          ),
          body: Container(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignupProgressIndicator(
                  key: const Key('Waiting'),
                  currentPageIndex: 2,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                    SizeConfig.screenWidth! * 0.06,
                    SizeConfig.screenHeight! * 0.01,
                    SizeConfig.screenWidth! * 0.06,
                    SizeConfig.screenHeight! * 0.01,
                  ),
                  width: SizeConfig.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Greeting text
                      CustomRichText(
                        key: const Key('WaitingPageText'),
                        words: model.greeting,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.03,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .strictTranslate('Request Sent to'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                //Information of the organization to which the request is sent.
                Expanded(
                  child: ListView.builder(
                    key: const Key('PendingRequestList'),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: model.pendingRequestOrg.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomListTile(
                        key: const Key('WaitingJoin'),
                        index: index,
                        type: TileType.org,
                        orgInfo: model.pendingRequestOrg[index],
                        onTapOrgInfo: (item) {},
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.0215,
                ),
                //Join organization button
                RaisedRoundedButton(
                  key: const Key('JoinOrg'),
                  buttonLabel: AppLocalizations.of(context)!
                      .strictTranslate('Join Organisation'),
                  onTap: model.joinOrg,
                  showArrow: true,
                  textColor: Theme.of(context).colorScheme.secondaryContainer,
                  backgroundColor: Theme.of(context)
                      .inputDecorationTheme
                      .focusedBorder!
                      .borderSide
                      .color,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.0215,
                ),
                //Logout button
                RaisedRoundedButton(
                  key: const Key('Logout'),
                  buttonLabel:
                      AppLocalizations.of(context)!.strictTranslate('Log out'),
                  onTap: model.logout,
                  textColor: Theme.of(context)
                      .inputDecorationTheme
                      .focusedBorder!
                      .borderSide
                      .color,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                ),
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
