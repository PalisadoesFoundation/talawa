::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [widgets/add_members_bottom_sheet.dart](../../widgets_add_members_bottom_sheet/)
3.  [EventBottomSheet](../../widgets_add_members_bottom_sheet/EventBottomSheet-class.html)
4.  addUserBottomSheet method

::: self-name
addUserBottomSheet
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="widgets_add_members_bottom_sheet/EventBottomSheet-class-sidebar.html" below-sidebar=""}
<div>

# [addUserBottomSheet]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [addUserBottomSheet]{.name}({

1.  [required
    [[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}, ]{#addUserBottomSheet-param-context
    .parameter}
2.  [required
    [[CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}, ]{#addUserBottomSheet-param-model
    .parameter}

})
:::

::: {.section .desc .markdown}
This function creates a modal material design bottom sheet.

to let the user add admin or members to an organization. **params**:

-   `context`: BuildContext
-   `model`: CreateEventViewModel

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [add_members_bottom_sheet](../../widgets_add_members_bottom_sheet/)
3.  [EventBottomSheet](../../widgets_add_members_bottom_sheet/EventBottomSheet-class.html)
4.  addUserBottomSheet method

##### EventBottomSheet class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
