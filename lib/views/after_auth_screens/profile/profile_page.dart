import 'package:flutter/material.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/options/options.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/custom_list_tile.dart';
import 'package:talawa/widgets/from_palisadoes.dart';

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
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
            ),
          ),
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
                          icon: CustomAvatar(
                            isImageNull: model.currentUser.image == null,
                            firstAlphabet:
                                model.currentUser.firstName!.substring(0, 1),
                            imageUrl: model.currentUser.image,
                            fontSize:
                                Theme.of(context).textTheme.headline6!.fontSize,
                          ),
                          title:
                              '${model.currentUser.firstName!} ${model.currentUser.lastName!}',
                          subtitle: model.currentUser.email!,
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
                      const Divider(),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.63,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomListTile(
                              key: homeModel!.keySPAppSetting,
                              index: 0,
                              type: TileType.option,
                              option: Options(
                                icon: const Icon(
                                  Icons.phonelink_setup,
                                  size: 30,
                                ),
                                title: AppLocalizations.of(context)!
                                    .strictTranslate('App Settings'),
                                subtitle:
                                    '${AppLocalizations.of(context)!.strictTranslate("Language")}, ${AppLocalizations.of(context)!.strictTranslate("dark mode")}, ${AppLocalizations.of(context)!.strictTranslate("font size")}',
                              ),
                              onTapOption: () {
                                navigationService
                                    .pushScreen("/appSettingsPage");
                              },
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
                            CustomListTile(
                              key: homeModel!.keySPDonateUs,
                              index: 2,
                              type: TileType.option,
                              option: Options(
                                icon: Icon(
                                  Icons.monetization_on,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 30,
                                ),
                                title: AppLocalizations.of(context)!
                                    .strictTranslate('Donate Us'),
                                subtitle: AppLocalizations.of(context)!
                                    .strictTranslate(
                                  'Help us to develop for you',
                                ),
                              ),
                              onTapOption: () => donate(context, model),
                            ),
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
                                title: AppLocalizations.of(context)!
                                    .strictTranslate('Invite'),
                                subtitle: AppLocalizations.of(context)!
                                    .strictTranslate('Invite to org'),
                              ),
                              onTapOption: () => model.invite(context),
                            ),
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
                              onTapOption: () => model.logout(context),
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

  donate(BuildContext context, ProfilePageViewModel model) {
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
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  appBar: AppBar(
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    toolbarHeight: SizeConfig.screenHeight! * 0.15,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Donating to \n${model.currentOrg.name}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
                        Text(
                          'Please Select and amount',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Input custom amount',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: SizeConfig.screenWidth! * 0.05,
                        ),
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
                            style: Theme.of(context).textTheme.headline6,
                            onChanged: (text) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .translate("Enter donation amount"),
                              labelText: AppLocalizations.of(context)!
                                  .translate("Enter custom donation amount"),
                              labelStyle: Theme.of(context).textTheme.subtitle1,
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
                                            .headline5,
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
                          onPressed: () =>
                              model.showSnackBar('Donation not supported yet'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              model.donationAmount.text.isEmpty
                                  ? Colors.grey
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: Text(
                            'DONATE',
                            style: Theme.of(context).textTheme.button,
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
