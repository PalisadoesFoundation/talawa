import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/services/navigation_service.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/profile_page_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/profile_list_tile.dart';

import '../../../locator.dart';

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
        onModelReady: (model) => model.initialize(
            Provider.of<UserConfig>(context, listen: true).currentOrg),
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
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, right: 15),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            leading: model.user.values.first.image != null
                                ? CircleAvatar(
                                    radius: SizeConfig.screenHeight! * 0.068,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.5),
                                    backgroundImage: NetworkImage(
                                        model.user.values.first.image!),
                                  )
                                : CircleAvatar(
                                    radius: SizeConfig.screenHeight! * 0.068,
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.2),
                                    child: Text(
                                      model.user.values.first.firstName!
                                              .toString()
                                              .substring(0, 1)
                                              .toUpperCase() +
                                          model.user.values.first.lastName!
                                              .toString()
                                              .substring(0, 1)
                                              .toUpperCase(),
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                            title: Transform.translate(
                              offset:
                                  Offset(-SizeConfig.screenWidth! * 0.083, 0),
                              child: Text(
                                '${model.user.values.first.firstName!} ${model.user.values.first.lastName!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontSize: 18),
                              ),
                            ),
                            subtitle: Transform.translate(
                              offset:
                                  Offset(-SizeConfig.screenWidth! * 0.083, 0),
                              child: Text(
                                model.currentOrg.name!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                locator<NavigationService>()
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
                            height: SizeConfig.screenHeight! * 0.66,
                            child: Column(
                              children: [
                                const ProfileSettingsTile(
                                  icon: Icon(Icons.phonelink_setup),
                                  title: 'App Settings',
                                  subTitle: 'Language, dark mode, font size',
                                ),
                                ProfileSettingsTile(
                                  icon: Icon(
                                    Icons.people,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  title: 'Members',
                                  subTitle: 'See Organization-Name members',
                                ),
                                ProfileSettingsTile(
                                  icon: Icon(
                                    Icons.storage,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  title: 'Storage and data',
                                  subTitle: 'Caching, storage',
                                ),
                                GestureDetector(
                                  onTap: () {
                                    model.logout(context);
                                  },
                                  child: const ProfileSettingsTile(
                                    icon: Icon(Icons.logout),
                                    title: 'Log out',
                                    subTitle: 'Log out from Talawa',
                                  ),
                                ),
                                const ProfileSettingsTile(
                                  icon: Icon(Icons.help_outline),
                                  title: 'Help',
                                  subTitle: 'Reach out to us for help',
                                ),
                                const Spacer(),
                                Text(
                                  'from',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                Text(
                                  'PALISADOES',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenHeight! * 0.082,
                                )
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
