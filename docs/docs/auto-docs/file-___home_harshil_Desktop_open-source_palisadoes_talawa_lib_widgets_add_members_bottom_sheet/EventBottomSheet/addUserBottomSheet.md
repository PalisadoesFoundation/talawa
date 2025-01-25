




addUserBottomSheet method - EventBottomSheet class - add\_members\_bottom\_sheet library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/add\_members\_bottom\_sheet.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_add_members_bottom_sheet/)
3. [EventBottomSheet](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_add_members_bottom_sheet/EventBottomSheet-class.html)
4. addUserBottomSheet method

addUserBottomSheet


dark\_mode

light\_mode




# addUserBottomSheet method


void
addUserBottomSheet({

1. required dynamic context,
2. required dynamic model,

})

This function creates a modal material design bottom sheet.

to let the user add admin or members to an organization.
**params**:

* `context`: BuildContext
* `model`: CreateEventViewModel

**returns**:
None


## Implementation

```
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
                    Text(
                      AppLocalizations.of(context)!
                          .strictTranslate("Add Members"),
                      style: const TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      key: const Key('text_btn_ambs1'),
                      onPressed: () {
                        model.buildUserList();
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.strictTranslate('Done'),
                      ),
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
                                            .surface,
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
                    ),
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

 


1. [talawa](../../index.html)
2. [add\_members\_bottom\_sheet](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_add_members_bottom_sheet/)
3. [EventBottomSheet](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_add_members_bottom_sheet/EventBottomSheet-class.html)
4. addUserBottomSheet method

##### EventBottomSheet class





talawa
1.0.0+1






