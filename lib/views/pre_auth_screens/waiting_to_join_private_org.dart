import 'package:flutter/cupertino.dart';
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

class WaitingPage extends StatelessWidget {
  const WaitingPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WaitingViewModel>(
        onModelReady: (model) => model.initialise(),
        builder: (context, model, child) {
          return Scaffold(
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
                      key: const Key('Waiting'), currentPageIndex: 2),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        SizeConfig.screenWidth! * 0.06,
                        SizeConfig.screenHeight! * 0.01,
                        SizeConfig.screenWidth! * 0.06,
                        SizeConfig.screenHeight! * 0.01),
                    width: SizeConfig.screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomRichText(
                          key: const Key('UrlPageText'),
                          words: model.greeting,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.03,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .strictTranslate('Request Sent to'),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: model.pendingRequestOrg.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomListTile(
                            key: const Key('WaitingJoin'),
                            index: index,
                            type: TileType.org,
                            orgInfo: model.pendingRequestOrg[index],
                            onTapOrgInfo: (item) {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.0215,
                  ),
                  RaisedRoundedButton(
                    key: const Key('JoinOrg'),
                    buttonLabel: AppLocalizations.of(context)!
                        .strictTranslate('Join Organisation'),
                    onTap: model.joinOrg,
                    showArrow: true,
                    textColor: Theme.of(context).colorScheme.secondaryVariant,
                    backgroundColor: Theme.of(context)
                        .inputDecorationTheme
                        .focusedBorder!
                        .borderSide
                        .color,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.0215,
                  ),
                  RaisedRoundedButton(
                    key: const Key('Logout'),
                    buttonLabel: AppLocalizations.of(context)!
                        .strictTranslate('Log out'),
                    onTap: model.logout,
                    textColor: Theme.of(context)
                        .inputDecorationTheme
                        .focusedBorder!
                        .borderSide
                        .color,
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryVariant,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.0215,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
