import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/from_palisadoes.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

/// ProfilePage returns a widget that renders a page of user's profile.
class DemoProfilePage extends StatelessWidget {
  const DemoProfilePage({
    required Key key,
    this.homeModel,
  }) : super(key: key);

  /// MainScreenViewModel.
  ///
  final MainScreenViewModel? homeModel;

  @override
  Widget build(BuildContext context) {
    print(userConfig.loggedIn);
    return Scaffold(
      key: const Key('DemoProfilePage'),
      appBar: AppBar(
        backgroundColor: Colors.green,
        // Theme.of(context).primaryColor,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(Icons.menu),
          onPressed: () {
            MainScreenViewModel.scaffoldKey.currentState!.openDrawer();
          },
        ),
        key: const Key("ProfilePageAppBar"),
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Profile'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                // fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'open-sans',
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            key: const Key('settingIcon'),
            onPressed: () {
              print('came');
              navigationService.pushScreen(Routes.appSettings);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      // if data fetching is under process then renders Circular Progress Icon
      // else renders the widget.
      body: guestViewWidget(context),
    );
  }

  /// guestViewWidget, this widget is shown if user is not logged in.
  ///
  /// **params**:
  /// * `context`: Build context to perform context related operation
  ///
  /// **returns**:
  /// * `Widget`: Widget
  Widget guestViewWidget(BuildContext context) {
    return SingleChildScrollView(
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
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
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
              // Expanded(
              //   flex: 1,
              //   child: IconButton(
              //     icon: Icon(
              //       Icons.share,
              //       color:
              //           Theme.of(context).colorScheme.secondary,
              //     ),
              //     onPressed: () => model.invite(context),
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          RaisedRoundedButton(
            key: homeModel!.keySPDonateUs,
            buttonLabel: AppLocalizations.of(context)!.strictTranslate(
              'Donate to the Community',
            ),
            onTap: () {
              MainScreenViewModel.scaffoldKey.currentState?.openDrawer();
            },
            textColor: Theme.of(context)
                .inputDecorationTheme
                .focusedBorder!
                .borderSide
                .color,
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          ),
          SizedBox(
            height: 600,
            width: double.infinity,
            child: ContainedTabBarView(
              tabs: [
                const Tab(text: 'Posts'),
                const Tab(text: 'Events'),
                const Tab(text: 'Tasks'),
              ],
              views: [
                ColoredBox(
                  color: Theme.of(context).colorScheme.background,
                  child: GridView.count(
                    mainAxisSpacing: 5,
                    crossAxisCount: 3,
                    children: [
                      Image.asset('assets/images/pfp2.png'),
                      Image.asset('assets/images/pfp2.png'),
                      Image.asset('assets/images/pfp2.png'),
                      Image.asset('assets/images/pfp2.png'),
                      Image.asset('assets/images/pfp2.png'),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.background,
                ),
                Container(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.67,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.01,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),

                /// `Donation` acts as plugin. If visible is true the it will be always visible.
                /// even if it's uninstalled by the admin (for development purposes)
                //TODO: custom tile for Invitation.
                // CustomListTile(
                //   key: homeModel!.keySPInvite,
                //   index: 3,
                //   type: TileType.option,
                //   option: Options(
                //     icon: Icon(
                //       Icons.share,
                //       color:
                //           Theme.of(context).colorScheme.secondary,
                //       size: 30,
                //     ),
                //     // title
                //     title: AppLocalizations.of(context)!
                //         .strictTranslate('Invite'),
                //     // subtitle
                //     subtitle: AppLocalizations.of(context)!
                //         .strictTranslate('Invite to org'),
                //   ),
                //   // on tap call the invite function
                //   onTapOption: () => model.invite(context),
                // ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                // Custom tile for Logout option.
                //TODO: logout
                // CustomListTile(
                //   key: homeModel!.keySPLogout,
                //   index: 3,
                //   type: TileType.option,
                //   option: Options(
                //     icon: Icon(
                //       Icons.logout,
                //       color:
                //           Theme.of(context).colorScheme.secondary,
                //       size: 30,
                //     ),
                //     title: AppLocalizations.of(context)!
                //         .strictTranslate('Log out'),
                //     subtitle: AppLocalizations.of(context)!
                //         .strictTranslate('Log out from Talawa'),
                //   ),
                //   // on tap calls the logout function
                //   onTapOption: () => model.logout(context),
                // ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.05,
                ),
                FromPalisadoes(key: homeModel!.keySPPalisadoes),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
