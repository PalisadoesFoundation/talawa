


# addUserBottomSheet method








void addUserBottomSheet
({required [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context, required [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.md) model})





<p>This function creates a modal material design bottom sheet.</p>
<p>to let the user add admin or members to an organization.
<strong>params</strong>:</p>
<ul>
<li><code>context</code>: BuildContext</li>
<li><code>model</code>: CreateEventViewModel</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void addUserBottomSheet({
  required BuildContext context,
  required CreateEventViewModel model,
}) {
  // Returns a Future that resolves to the value ("context") passed
  // to Navigator.pop
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Add Members",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      key: const Key('text_btn_ambs1'),
                      onPressed: () {
                        model.buildUserList();
                        Navigator.pop(context);
                      },
                      child: const Text("Done"),
                    ),
                    const Divider(),
                    FutureBuilder(
                      // an admin can access the list of the members in an organization
                      future: model.getCurrentOrgUsersList(),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<List<User>> snapshot,
                      ) {
                        if (snapshot.data == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return snapshot.data!.isEmpty
                              ? const Center(
                                  child: Text(
                                    "There aren't any members in this organization.",
                                  ),
                                )
                              // Displaying the list of the members
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
                                          "${snapshot.data![index].firstName!} ${snapshot.data![index].lastName!}",
                                        ),
                                        value: model.memberCheckedMap[
                                            snapshot.data![index].id],
                                        onChanged: (val) {
                                          setState(
                                            () {
                                              model.memberCheckedMap[snapshot
                                                  .data![index].id!] = val!;
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
```







