import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/data_parsers/org_info.dart';
import 'package:talawa/data_parsers/user_info.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/widgets/join_org_tile.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';
import 'package:talawa/widgets/rich_text.dart';

import '../../locator.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pendingRequestOrg = [
      OrgInfo(
          id: '1',
          name: 'Organization 1',
          creatorInfo: User(
            id: '1',
            firstName: 'Rutvik',
            lastName: 'Chandla',
          ),
          isPublic: false),
    ];
    final text = [
      {
        'text': "Please wait for ",
        'textStyle': Theme.of(context).textTheme.headline5
      },
      {
        'text': "Org Name ",
        'textStyle':
            Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24)
      },
      {
        'text': "to accept your invitation. ",
        'textStyle': Theme.of(context).textTheme.headline5
      },
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                words: text,
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
        Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: pendingRequestOrg.length,
                itemBuilder: (BuildContext context, int index) {
                  return JoinOrgTile(
                      key: Key('WaitingJoin$index'),
                      index: index,
                      item: pendingRequestOrg[index],
                      onTap: (item) {});
                })),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.06,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
              RaisedRoundedButton(
                buttonLabel: 'Join an Public Organization',
                onTap: () {
                  if (true) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('In Progress'),
                      duration: Duration(milliseconds: 750),
                    ));
                  }
                },
                textColor: Colors.white,
                key: const Key('Join More'),
                backgroundColor: const Color(0xFF008A37),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.0215,
              ),
              RaisedRoundedButton(
                buttonLabel: 'Log out',
                onTap: () {
                  locator<NavigationService>()
                      .removeAllAndPush('/setUrl', '/selectLang');
                },
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
      ],
    );
  }
}
