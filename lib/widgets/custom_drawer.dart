import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/widgets_view_models/custom_drawer_view_model.dart';
import 'package:talawa/views/base_view.dart';
import 'package:talawa/widgets/custom_avatar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CustomDrawerViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return Container(
            width: SizeConfig.screenWidth! * 0.6,
            alignment: Alignment.centerLeft,
            child: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserAccountsDrawerHeader(
                        currentAccountPicture: CustomAvatar(
                          isImageNull: model.selectedOrg.image == null,
                          imageUrl: model.selectedOrg.image,
                          orgFirstAlphabet:
                              model.selectedOrg.name!.substring(0, 1),
                        ),
                        accountName: Text(model.selectedOrg.name!),
                        accountEmail: const Text("Selected Organization"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 8.0),
                        child: Text(
                          "Switch Organization",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      SizedBox(
                        height: 270,
                        child: Scrollbar(
                          controller: model.controller,
                          isAlwaysShown: true,
                          child: ListView.builder(
                            controller: model.controller,
                            padding: EdgeInsets.zero,
                            itemCount: model.switchAbleOrg.length,
                            // itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                onTap: () =>
                                    model.switchOrg(model.switchAbleOrg[index]),
                                leading: CustomAvatar(
                                  isImageNull:
                                      model.switchAbleOrg[index].image == null,
                                  imageUrl: model.switchAbleOrg[index].image,
                                  orgFirstAlphabet: model
                                      .switchAbleOrg[index].name!
                                      .substring(0, 1),
                                  fontSize: 18,
                                ),
                                title: Text(
                                  model.switchAbleOrg[index].name!,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Divider(),
                      const ListTile(
                        leading: Icon(
                          Icons.add,
                          size: 30,
                        ),
                        title: Text("Join new Organization"),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.logout,
                          size: 30,
                        ),
                        title: Text("Leave Current Organization"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'from',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PALISADOES',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal! * 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
