import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

/// ProfilePage returns a widget that renders a page of user's profile.
class DemoProfilePage extends StatelessWidget {
  const DemoProfilePage({
    super.key,
    this.homeModel,
  });

  /// MainScreenViewModel.
  final MainScreenViewModel? homeModel;

  @override
  Widget build(BuildContext context) {
    print(userConfig.loggedIn);
    return Scaffold(
      // Using the key from the constructor instead of defining a new one
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.maybeOf(context)?.openDrawer();
          },
        ),
        key: const Key("DemoProfilePageAppBar"),
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Profile'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                fontFamily: 'open-sans',
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            key: const Key('settingIcon'),
            onPressed: () {
              navigationService.pushScreen(Routes.appSettings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        // Match AppBar color for the top portion
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomAvatar(
                        isImageNull: true,
                        firstAlphabet: "U",
                        imageUrl: null,
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        maxRadius: 30,
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'open-sans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              RaisedRoundedButton(
                key: const Key('DonateUsButton'),
                buttonLabel: AppLocalizations.of(context)!.strictTranslate(
                  'Donate to the Community',
                ),
                onTap: () {
                  Scaffold.maybeOf(context)?.openDrawer();
                },
                textColor: Theme.of(context)
                    .inputDecorationTheme
                    .focusedBorder!
                    .borderSide
                    .color,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
              ),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: ContainedTabBarView(
                  tabs: [
                    Tab(
                      text: AppLocalizations.of(context)!
                          .strictTranslate('Posts'),
                    ),
                  ],
                  views: [
                    Container(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
