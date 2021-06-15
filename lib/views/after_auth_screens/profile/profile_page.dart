import 'package:flutter/material.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/profile_view_models/profile_page_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';
import 'package:talawa/widgets/from_palisadoes.dart';
import 'package:talawa/widgets/profile_list_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, this.drawerKey}) : super(key: key);
  final GlobalKey<ScaffoldState>? drawerKey;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilePageViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => widget.drawerKey!.currentState!.openDrawer(),
              ),
              key: const Key("ProfilePageAppBar"),
              title: Text(
                'Profile',
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
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListTile(
                            dense: true,
                            leading: CustomAvatar(
                              isImageNull: model.currentUser.image == null,
                              firstAlphabet:
                                  model.currentUser.firstName!.substring(0, 1),
                              imageUrl: model.currentUser.image,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .fontSize,
                            ),
                            title: Text(
                              '${model.currentUser.firstName!} ${model.currentUser.lastName!}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(fontSize: 18),
                            ),
                            subtitle: Text(
                              model.currentUser.email!,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                navigationService
                                    .pushScreen("/editProfilePage");
                              },
                              child: Icon(
                                Icons.drive_file_rename_outline,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: SizeConfig.screenHeight! * 0.63,
                            child: Column(
                              children: [
                                const ProfileSettingsTile(
                                  icon: Icon(Icons.phonelink_setup),
                                  title: 'App Settings',
                                  subTitle: 'Language, dark mode, font size',
                                ),
                                const ProfileSettingsTile(
                                  icon: Icon(Icons.help_outline),
                                  title: 'Help',
                                  subTitle: 'Reach out to us for help',
                                ),
                                ProfileSettingsTile(
                                  icon: Icon(
                                    Icons.monetization_on,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  title: 'Donate Us',
                                  subTitle: 'Help us to develop for you',
                                ),
                                GestureDetector(
                                  onTap: () => model.logout(context),
                                  child: ProfileSettingsTile(
                                    icon: Icon(
                                      Icons.logout,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    title: 'Log out',
                                    subTitle: 'Log out from Talawa',
                                  ),
                                ),
                                const Spacer(),
                                const FromPalisadoes(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}
