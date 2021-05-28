import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/views/pre_auth_screens/select_organization.dart';
import 'package:talawa/views/pre_auth_screens/signup_details.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../../size_config.dart';
import '../../textstyles.dart';

class Signup extends StatefulWidget {
  const Signup({required Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late PageController controller;
  int currentPageIndex = 0;
  List<int> pages = [0, 1, 2];
  List<String> progressLabel = [
    'Select\nOrganization',
    'Enter Details',
    'Final',
  ];

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  void nextPage() {
    controller.nextPage(
        duration: const Duration(milliseconds: 1000), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print('here ${SizeConfig.screenHeight! * 0.15}');
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
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
                    style: languageDefaultStyle.copyWith(
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
                    key: Key('SelectOrganization'),
                  ),
                  SignUpDetails(
                    swipePage: nextPage,
                    key: Key('SignUpDetails'),
                  ),
                  SignUpDetails(
                    swipePage: nextPage,
                    key: Key('SignUpDetails3'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
