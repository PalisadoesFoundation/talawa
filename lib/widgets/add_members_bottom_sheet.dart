import 'package:flutter/material.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

class EventBottomSheet {
  void addUserBottomSheet(
      {required BuildContext context,
      required CreateEventViewModel model,
      required bool isAdmin}) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(isAdmin ? "Add Admins" : "Add Members",
                          style: const TextStyle(fontSize: 16)),
                      TextButton(
                          onPressed: () {
                            model.buildUserList(isAdmin: isAdmin);
                            Navigator.pop(context);
                          },
                          child: const Text("Done")),
                      const Divider(),
                      FutureBuilder(
                          future:
                              model.getCurrentOrgUsersList(isAdmin: isAdmin),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<User>> snapshot) {
                            if (snapshot.data == null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return snapshot.data!.isEmpty
                                  ? const Center(
                                      child: Text(
                                          "There aren't any members in this organization."))
                                  : Flexible(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                            checkColor: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            activeColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            title: Text(
                                                "${snapshot.data![index].firstName!} ${snapshot.data![index].lastName!}"),
                                            value: isAdmin
                                                ? model.adminCheckedMap[
                                                    snapshot.data![index].id]
                                                : model.memberCheckedMap[
                                                    snapshot.data![index].id],
                                            onChanged: (val) {
                                              setState(
                                                () {
                                                  if (isAdmin) {
                                                    model.adminCheckedMap[
                                                        snapshot.data![index]
                                                            .id!] = val!;
                                                  } else {
                                                    model.memberCheckedMap[
                                                        snapshot.data![index]
                                                            .id!] = val!;
                                                  }
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    );
                            }
                          })
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }
}
