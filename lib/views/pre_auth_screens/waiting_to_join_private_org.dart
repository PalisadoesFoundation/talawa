import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/waiting_view_model.dart';
import 'package:talawa/widgets/join_org_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';
import 'package:talawa/widgets/signup_progress_bar.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/views/base_view.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignupProgressBar(
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
                          'Request Sent to',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  JoinOrgTile(
                      key: const Key('WaitingJoin'),
                      index: 0,
                      item: model.pendingRequestOrg,
                      onTap: (item) {}),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth! * 0.06,
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          RaisedRoundedButton(
                            buttonLabel: 'Join an Public Organization',
                            onTap: () {
                              if (true) {
                                locator<NavigationService>()
                                    .pushScreen('/selectOrg');
                              }
                            },
                            textColor: Colors.white,
                            key: const Key('Join More'),
                            backgroundColor: const Color(0xFF008A37),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.043,
                          ),
                          RaisedRoundedButton(
                            buttonLabel: 'Log out',
                            onTap: model.logout,
                            textColor: const Color(0xFF008A37),
                            key: const Key('Logout'),
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.0215,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
