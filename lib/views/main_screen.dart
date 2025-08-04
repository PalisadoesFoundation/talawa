import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/mainscreen_navigation_args.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_drawer.dart';

/// This widget is responsible for displaying the main screen of the application.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.mainScreenArgs});

  /// Holds data for the MainScreenArgs model, providing information to MainScreen.
  final MainScreenArgs mainScreenArgs;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainScreenViewModel>(
      onModelReady: (model) {
        model.initialise(
          context,
          fromSignUp: widget.mainScreenArgs.fromSignUp,
          mainScreenIndex: widget.mainScreenArgs.mainScreenIndex,
          demoMode: widget.mainScreenArgs.toggleDemoMode,
        );
      },
      builder: (context, model, child) {
        // Setup navigation items and pages for the bottom navigation bar
        model.setupNavigationItems(context);
        return Scaffold(
          key: model.scaffoldKey,
          drawer: CustomDrawer(
            homeModel: model,
            key: const Key("Custom Drawer"),
          ),
          body: Stack(
            children: [
              IndexedStack(
                index: model.currentPageIndex,
                children: model.pages,
              ),
              widget.mainScreenArgs.toggleDemoMode
                  ? Positioned(
                      bottom: 0, // Adjust this value as per your UI
                      left: 0,
                      right: 0,
                      child: InkWell(
                        key: const Key('banner'),
                        onTap: () => navigationService
                            .pushScreen(Routes.setUrlScreen, arguments: ''),
                        child: Container(
                          height: 30.0, // Set the desired height of the banner
                          color: Theme.of(context)
                              .canvasColor, // Change color as needed
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppLocalizations.of(context)!
                                        .strictTranslate(
                                      'For complete access, please',
                                    ),
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(context)!
                                        .strictTranslate(
                                      'join an organization.',
                                    ),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: model.currentPageIndex,
            onTap: model.onTabTapped,
            selectedItemColor: const Color(0xff34AD64),
            items: model.navBarItems,
          ),
        );
      },
    );
  }
}
