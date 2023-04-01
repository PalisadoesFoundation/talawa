// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/plugins/talawa_plugin_provider.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

/// ProfilePage returns a widget that renders a page of user's profile.
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    required Key key,
    this.homeModel,
  }) : super(key: key);
  final MainScreenViewModel? homeModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilePageViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          key: model.scaffoldKey,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              color: Theme.of(context).iconTheme.color,
              icon: const Icon(Icons.menu),
              onPressed: () =>
                  MainScreenViewModel.scaffoldKey.currentState!.openDrawer(),
            ),
            key: const Key("ProfilePageAppBar"),
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('Profile'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
          ),
          // if data fetching is under process then renders Circular Progress Icon
          // else renders the widget.
          body: model.isBusy
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.01,
                      ),
                      CustomListTile(
                        key: const Key('OptionEditProfile'),
                        index: 0,
                        type: TileType.option,
                        option: Options(
                          // Avatar
                          icon: CustomAvatar(
                            isImageNull: model.currentUser.image == null,
                            firstAlphabet:
                                model.currentUser.firstName!.substring(0, 1),
                            imageUrl: model.currentUser.image,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize,
                          ),
                          // display first and last name.
                          title:
                              '${model.currentUser.firstName!} ${model.currentUser.lastName!}',
                          // display email address
                          subtitle: model.currentUser.email!,
                          // button to edit the profile which redirects to edit profile page.
                          trailingIconButton: IconButton(
                            icon: Icon(
                              Icons.drive_file_rename_outline,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              navigationService.pushScreen("/editProfilePage");
                            },
                          ),
                        ),
                        onTapOption: () {},
                      ),
                      const Divider(
                        thickness: 1, // thickness of the line
                        indent:
                            20, // empty space to the leading edge of divider.
                        endIndent:
                            20, // empty space to the trailing edge of the divider.
                        color: Colors
                            .black26, // The color to use when painting the line.
                        height: 20, //
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.67,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.01,
                            ),
                            CustomListTile(
                              key: homeModel!.keySPAppSetting,
                              index: 0,
                              type: TileType.option,
                              option: Options(
                                icon: Icon(
                                  Icons.phonelink_setup,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 30,
                                ),
                                // title for App Settings.
                                title: AppLocalizations.of(context)!
                                    .strictTranslate('App Settings'),
                                // display language of the app.
                                subtitle:
                                    '${AppLocalizations.of(context)!.strictTranslate("Language")}, ${AppLocalizations.of(context)!.strictTranslate("dark mode")}, ${AppLocalizations.of(context)!.strictTranslate("font size")}',
                              ),
                              // button for the app setting which redirects to app setting page.
                              onTapOption: () {
                                navigationService
                                    .pushScreen("/appSettingsPage");
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.05,
                            ),
                            CustomListTile(
                              key: const Key('TasksByUser'),
                              index: 1,
                              type: TileType.option,
                              option: Options(
                                icon: Icon(
                                  Icons.task_outlined,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 30,
                                ),
                                // title for My Tasks tile
                                title: AppLocalizations.of(context)!
                                    .strictTranslate('My Tasks'),
                                // display subtitle
                                subtitle: AppLocalizations.of(context)!
                                    .strictTranslate(
                                  "View and edit all tasks created by you",
                                ),
                              ),
                              // on tag redirects to the user Tasks page.
                              onTapOption: () {
                                navigationService.pushScreen(Routes.userTasks);
                              },
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.05,
                            ),
                            // // Will be added later when we add the Help Section in Documentation.
                            // CustomListTile(
                            //   key: homeModel!.keySPHelp,
                            //   index: 1,
                            //   type: TileType.option,
                            //   option: Options(
                            //     icon: const Icon(
                            //       Icons.help_outline,
                            //       size: 30,
                            //     ),
                            //     title: AppLocalizations.of(context)!
                            //         .strictTranslate('Help'),
                            //     subtitle: AppLocalizations.of(context)!
                            //         .strictTranslate(
                            //       'Reach out to us for help',
                            //     ),
                            //   ),
                            //   onTapOption: () {},
                            // ),
                            /// `Donation` acts as plugin. If visible is true the it will be always visible.
                            /// even if it's uninstalled by the admin (for development purposes)
                            TalawaPluginProvider(
                              pluginName: "Donation",
                              visible: true,
                              child: Column(
                                children: [
                                  CustomListTile(
                                    key: homeModel!.keySPDonateUs,
                                    index: 2,
                                    type: TileType.option,
                                    option: Options(
                                      icon: Icon(
                                        Icons.monetization_on,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        size: 30,
                                      ),
                                      title: AppLocalizations.of(context)!
                                          .strictTranslate('Donate  Us'),
                                      subtitle: AppLocalizations.of(context)!
                                          .strictTranslate(
                                        'Help us to develop for you',
                                      ),
                                    ),
                                    onTapOption: () => donate(context, model),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight! * 0.05,
                                  ),
                                ],
                              ),
                            ),
                            // custom tile for Invitation.
                            CustomListTile(
                              key: homeModel!.keySPInvite,
                              index: 3,
                              type: TileType.option,
                              option: Options(
                                icon: Icon(
                                  Icons.share,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 30,
                                ),
                                // title
                                title: AppLocalizations.of(context)!
                                    .strictTranslate('Invite'),
                                // subtitle
                                subtitle: AppLocalizations.of(context)!
                                    .strictTranslate('Invite to org'),
                              ),
                              // on tap call the invite function
                              onTapOption: () => model.invite(context),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.05,
                            ),
                            // Custom tile for Logout option.
                            CustomListTile(
                              key: homeModel!.keySPLogout,
                              index: 3,
                              type: TileType.option,
                              option: Options(
                                icon: Icon(
                                  Icons.logout,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 30,
                                ),
                                title: AppLocalizations.of(context)!
                                    .strictTranslate('Log out'),
                                subtitle: AppLocalizations.of(context)!
                                    .strictTranslate('Log out from Talawa'),
                              ),
                              // on tap calls the logout function
                              onTapOption: () => model.logout(context),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight! * 0.05,
                            ),
                            FromPalisadoes(key: homeModel!.keySPPalisadoes),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }

  // donate widget, this widget is used in donate custom tile.
  void donate(BuildContext context, ProfilePageViewModel model) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            model.attachListener(setState);
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: SizedBox(
                height: model.bottomSheetHeight,
                child: Scaffold(
                  // background color set to Primary
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  // header
                  appBar: AppBar(
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    toolbarHeight: SizeConfig.screenHeight! * 0.15,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      // display title
                      child: Text(
                        'Donating to \n${model.currentOrg.name}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 24),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 8.0,
                          top: SizeConfig.screenHeight! * 0.01,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: model.popBottomSheet,
                        ),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    // SingleChildScrollView is a box in which a single widget can be scrolled.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
                        Text(
                          'Please Select and amount',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // looping through and renders button for donation amounts.
                            children: List.generate(
                              3,
                              (index) => model.dominationButton(
                                model.denomination[index],
                                context,
                                setState,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
                        Text(
                          'Or',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Input custom amount',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
                        // containers for custom amount
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth! * 0.05,
                          ),
                          child: TextField(
                            controller: model.donationAmount,
                            focusNode: model.donationField,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            autofillHints: const <String>[AutofillHints.email],
                            enableSuggestions: true,
                            style: Theme.of(context).textTheme.titleLarge,
                            onChanged: (text) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .translate("Enter donation amount"),
                              labelText: AppLocalizations.of(context)!
                                  .translate("Enter custom donation amount"),
                              labelStyle:
                                  Theme.of(context).textTheme.titleMedium,
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  model.changeCurrency(context, setState);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        model.donationCurrency,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      const Icon(
                                        Icons.arrow_drop_down_circle_outlined,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            ///required fields for donation transaction
                            late final String userId;
                            late final String orgId;
                            late final String nameOfOrg;
                            late final String nameOfUser;
                            late final String payPalId;
                            late final double amount;
                            orgId = model.currentOrg.id!;
                            userId = model.currentUser.id!;
                            nameOfUser =
                                "${model.currentUser.firstName!} ${model.currentUser.lastName!}";
                            nameOfOrg = model.currentOrg.name!;

                            amount = double.parse(model.donationAmount.text);
                            final request = BraintreeDropInRequest(
                              tokenizationKey:
                                  '<YOUR_BRAINTREE_SANDBOX_API_KEY>',
                              collectDeviceData: true,
                              paypalRequest: BraintreePayPalRequest(
                                amount: model.donationAmount.text,
                                displayName: "Talawa",
                              ),
                              cardEnabled: true,
                            );

                            final BraintreeDropInResult? result =
                                await BraintreeDropIn.start(request);
                            if (result != null) {
                              ///saving the donation in server
                              late final GraphQLClient client =
                                  graphqlConfig.clientToQuery();

                              ///getting transaction id from `brainTree` API
                              payPalId = result.paymentMethodNonce.nonce;

                              final QueryResult donationResult =
                                  await client.mutate(
                                MutationOptions(
                                  document: gql(
                                    queries.createDonation(
                                      userId,
                                      orgId,
                                      nameOfOrg,
                                      nameOfUser,
                                      payPalId,
                                      amount,
                                    ),
                                  ),
                                ),
                              );
                              if (donationResult.hasException) {
                                model.showSnackBar(
                                  "Error occurred while making a donation",
                                );
                              }

                              /// hiding the donation UI once it is successful
                              model.popBottomSheet();
                              model.showSnackBar(
                                'Donation Successful,Thanks for the support !',
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              // if the donation amount entered or selected is empty then renders grey color
                              // else render primary color
                              model.donationAmount.text.isEmpty
                                  ? Colors.grey
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: Text(
                            'DONATE',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ).then((value) => model.updateSheetHeight());
  }
}
