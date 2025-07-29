import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_braintree/flutter_braintree.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/profile/user_event.dart';
import 'package:talawa/views/after_auth_screens/profile/user_feed.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/raised_round_edge_button.dart';

/// ProfilePage returns a widget that renders a page of user's profile.
class ProfilePage extends StatelessWidget {
  const ProfilePage({
    required Key key,
    this.homeModel,
  }) : super(key: key);

  /// represents MainScreenViewModel.
  final MainScreenViewModel? homeModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilePageViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          key: model.scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0.0,
            centerTitle: true,
            leading: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.maybeOf(context)?.openDrawer(),
            ),
            key: const Key("ProfilePageAppBar"),
            title: Text(
              AppLocalizations.of(context)!.strictTranslate('Profile'),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
            ),
            actions: [
              IconButton(
                key: const Key('settingIcon'),
                onPressed: () {
                  navigationService.pushScreen(Routes.appSettings);
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // if data fetching is under process then renders Circular Progress Icon
          // else renders the widget.
          body: model.isBusy
              ? const CircularProgressIndicator()
              : RefreshIndicator(
                  onRefresh: () async => model.initialize(),
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
                                  key: const Key('profilepic'),
                                  isImageNull: model.currentUser.image == null,
                                  firstAlphabet:
                                      (model.currentUser.name?.isNotEmpty ==
                                              true)
                                          ? model.currentUser.name!
                                              .substring(0, 1)
                                              .toUpperCase()
                                          : '?',
                                  imageUrl: model.currentUser.image,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .fontSize,
                                  maxRadius: SizeConfig.screenHeight! * 0.02,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  model.currentUser.name ?? 'Unknown User',
                                  style: TextStyle(
                                    fontSize: SizeConfig.screenHeight! * 0.025,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                key: const Key('inviteicon'),
                                icon: Icon(
                                  Icons.share,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                onPressed: () => model.invite(context),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                        Column(
                          children: [
                            RaisedRoundedButton(
                              key: homeModel!.keySPDonateUs,
                              buttonLabel:
                                  AppLocalizations.of(context)!.strictTranslate(
                                'Donate to the Community',
                              ),
                              onTap: () => donate(context, model),
                              textColor: Theme.of(context)
                                  .inputDecorationTheme
                                  .focusedBorder!
                                  .borderSide
                                  .color,
                              backgroundColor:
                                  Theme.of(context).colorScheme.tertiary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.68,
                          width: double.infinity,
                          child: ContainedTabBarView(
                            tabs: [
                              Tab(
                                text: AppLocalizations.of(context)!
                                    .strictTranslate(
                                  'Posts',
                                ),
                                key: const Key('UserpostTab'),
                              ),
                              Tab(
                                text: AppLocalizations.of(context)!
                                    .strictTranslate(
                                  'Events',
                                ),
                                key: const Key('UserEventsTab'),
                              ),
                            ],
                            views: [
                              const UserFeed(key: Key("UserFeed")),
                              const UserEvents(key: Key("UserEvents")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  /// donate widget, this widget is used in donate custom tile.
  ///
  /// **params**:
  /// * `context`: Build context to perform context related operation
  /// * `model`: Viewmodel
  ///
  /// **returns**:
  ///   None
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
                        '${AppLocalizations.of(context)!.strictTranslate('Donating to')}\n${model.currentOrg.name}',
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
                      ),
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
                          AppLocalizations.of(context)!
                              .strictTranslate('Please select any amount'),
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
                          AppLocalizations.of(context)!.strictTranslate(
                            'Or',
                          ),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .strictTranslate('Input custom amount'),
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
                            key: const Key('custom_amt'),
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
                                key: const Key('currency_btn'),
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
                                      ),
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
                          key: const Key('DONATE'),
                          onPressed: () {
                            ///required fields for donation transaction
                            // late final String userId;
                            // late final String orgId;
                            // late final String nameOfOrg;
                            // late final String nameOfUser;
                            // late final String payPalId;
                            // late final double amount;
                            // orgId = model.currentOrg.id!;
                            // userId = model.currentUser.id!;
                            // nameOfUser =
                            //     "${model.currentUser.firstName!} ${model.currentUser.lastName!}";
                            // nameOfOrg = model.currentOrg.name!;

                            // amount = double.parse(model.donationAmount.text);
                            // final request = BraintreeDropInRequest(
                            //   tokenizationKey:
                            //       '<YOUR_BRAINTREE_SANDBOX_API_KEY>',
                            //   collectDeviceData: true,
                            //   paypalRequest: BraintreePayPalRequest(
                            //     amount: model.donationAmount.text,
                            //     displayName: "Talawa",
                            //   ),
                            //   cardEnabled: true,
                            // );

                            // final BraintreeDropInResult? result =
                            //     await BraintreeDropIn.start(request);
                            // if (result != null) {
                            //   ///saving the donation in server
                            //   late final GraphQLClient client =
                            //       graphqlConfig.clientToQuery();

                            //   ///getting transaction id from `brainTree` API
                            //   payPalId = result.paymentMethodNonce.nonce;

                            //   final QueryResult donationResult =
                            //       await client.mutate(
                            //     MutationOptions(
                            //       document: gql(
                            //         queries.createDonation(
                            //           userId,
                            //           orgId,
                            //           nameOfOrg,
                            //           nameOfUser,
                            //           payPalId,
                            //           amount,
                            //         ),
                            //       ),
                            //     ),
                            //   );
                            //   if (donationResult.hasException) {
                            //     model.showSnackBar(
                            //       "Error occurred while making a donation",
                            //     );
                            //   }

                            //   /// hiding the donation UI once it is successful
                            //   model.popBottomSheet();
                            //   model.showSnackBar(
                            //     'Donation Successful,Thanks for the support !',
                            //   );
                            // }
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              // if the donation amount entered or selected is empty then renders grey color
                              // else render primary color
                              model.donationAmount.text.isEmpty
                                  ? Colors.grey
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.strictTranslate(
                              'DONATE',
                            ),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
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
