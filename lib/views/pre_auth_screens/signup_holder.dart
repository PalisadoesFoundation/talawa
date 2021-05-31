import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/views/pre_auth_screens/signup_details.dart';
import 'package:talawa/views/pre_auth_screens/waiting_to_join_private_org.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../services/size_config.dart';

class Signup extends StatefulWidget {
  const Signup(
      {required Key key, required this.tab, required this.selectedOrgId})
      : super(key: key);
  final int tab;
  final String selectedOrgId;
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late PageController controller;
  late int currentPageIndex;
  late String selectedOrg;
  List<int> pages = [0, 1, 2];
  List<String> progressLabel = [
    'Select\nOrganization',
    'Enter Details',
    'Final',
  ];

  @override
  void initState() {
    controller = PageController(initialPage: widget.tab);
    currentPageIndex = widget.tab;
    selectedOrg = widget.selectedOrgId;
    super.initState();
  }

  void nextPage() {
    controller.nextPage(
        duration: const Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentPageIndex == 0) {
          return true;
        } else {
          if (currentPageIndex != 2 && selectedOrg == "-1") {
            controller.animateToPage(currentPageIndex - 1,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.ease);
            return false;
          } else {
            if (selectedOrg != "-1") {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Cannot change Organization for invitation link'),
                duration: Duration(milliseconds: 750),
              ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Wait for confirmation'),
                duration: Duration(milliseconds: 750),
              ));
            }
            return false;
          }
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              locator<NavigationService>().pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: SizeConfig.screenHeight! * 0.15,
                child: Timeline.tileBuilder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  builder: TimelineTileBuilder.connected(
                    contentsBuilder: (_, index) => Text(
                      progressLabel[index],
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: index <= currentPageIndex
                              ? const Color(0xFF008A37)
                              : const Color(0xFF737373)),
                      textAlign: TextAlign.center,
                    ),
                    connectorBuilder: (_, index, __) {
                      return SolidLineConnector(
                          space: 30,
                          color: index < currentPageIndex
                              ? const Color(0xFF008A37)
                              : const Color(0xFF737373));
                    },
                    indicatorBuilder: (_, index) {
                      return DotIndicator(
                        size: 25,
                        color: index <= currentPageIndex
                            ? const Color(0xFF008A37)
                            : const Color(0xFF737373),
                        child: index < currentPageIndex
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 20,
                              )
                            : const SizedBox(),
                      );
                    },
                    itemExtentBuilder: (_, __) =>
                        MediaQuery.of(context).size.width / 3,
                    itemCount: pages.length,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  children: [
                    SelectOrganization(
                      swipePage: nextPage,
                      key: const Key('SelectOrganization'),
                      selectedOrgId: selectedOrg,
                    ),
                    SignUpDetails(
                      swipePage: nextPage,
                      key: const Key('SignUpDetails'),
                    ),
                    const WaitingPage(
                      key: Key('WaitingToJoin'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
