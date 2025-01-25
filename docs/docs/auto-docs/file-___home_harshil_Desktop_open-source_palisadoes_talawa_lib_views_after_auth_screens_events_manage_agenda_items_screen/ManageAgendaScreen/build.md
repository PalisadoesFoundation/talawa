




build method - ManageAgendaScreen class - manage\_agenda\_items\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/manage\_agenda\_items\_screen.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_agenda_items_screen/)
3. [ManageAgendaScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_agenda_items_screen/ManageAgendaScreen-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  final model = Provider.of<EventInfoViewModel>(context);
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: model.agendaItems.isEmpty
                ? Center(
                    child: Text(
                      'No agenda items yet',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                    ),
                  )
                : ReorderableListView.builder(
                    itemCount: model.agendaItems.length,
                    onReorder: (oldIndex, newIndex) {
                      model.reorderAgendaItems(oldIndex, newIndex);
                    },
                    itemBuilder: (context, index) {
                      final item = model.agendaItems[index];
                      return ExpandableAgendaItemTile(
                        key: Key("agenda_item$index"),
                        item: item,
                        onEdit: () async {
                          final bool? wasUpdated = await Navigator.push<bool>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditAgendaItemPage(
                                agendaItem: item,
                                categories: model.categories,
                              ),
                            ),
                          );
                          // Refresh agenda items only if changes were made
                          if (wasUpdated == true) {
                            await model.fetchAgendaItems();
                          }
                        },
                        onDelete: () async {
                          await model.deleteAgendaItem(item.id!);
                          if (context.mounted) {
                            DelightToastBar(
                              autoDismiss: true,
                              snackbarDuration: const Duration(seconds: 2),
                              builder: (context) {
                                return ToastCard(
                                  title: const Text(
                                    "Agenda item removed",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  leading: const Icon(
                                    Icons.error_outline,
                                    color: Colors.redAccent,
                                  ),
                                  color: Colors.black.withOpacity(0.8),
                                );
                              },
                            ).show(context);
                          }
                        },
                      );
                    },
                  ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.011),
          ElevatedButton.icon(
            key: const Key('add_item_btn'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateAgendaItemPage(model: model),
                ),
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text('Add Agenda Item'),
          ),
        ],
      ),
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [manage\_agenda\_items\_screen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_agenda_items_screen/)
3. [ManageAgendaScreen](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_after_auth_screens_events_manage_agenda_items_screen/ManageAgendaScreen-class.html)
4. build method

##### ManageAgendaScreen class





talawa
1.0.0+1






