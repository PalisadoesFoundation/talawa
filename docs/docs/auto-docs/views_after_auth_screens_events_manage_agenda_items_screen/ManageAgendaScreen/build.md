




build method - ManageAgendaScreen class - manage\_agenda\_items\_screen library - Dart API







menu

1. [talawa](../../index.html)
2. [views/after\_auth\_screens/events/manage\_agenda\_items\_screen.dart](../../views_after_auth_screens_events_manage_agenda_items_screen/views_after_auth_screens_events_manage_agenda_items_screen-library.html)
3. [ManageAgendaScreen](../../views_after_auth_screens_events_manage_agenda_items_screen/ManageAgendaScreen-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @override

[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
build(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)
override

Describes the part of the user interface represented by this widget.

The framework calls this method when this widget is inserted into the tree
in a given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) and when the dependencies of this widget change
(e.g., an [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) referenced by this widget changes). This
method can potentially be called in every frame and should not have any side
effects beyond building a widget.

The framework replaces the subtree below this widget with the widget
returned by this method, either by updating the existing subtree or by
removing the subtree and inflating a new subtree, depending on whether the
widget returned by this method can update the root of the existing
subtree, as determined by calling [Widget.canUpdate](https://api.flutter.dev/flutter/widgets/Widget/canUpdate.html).

Typically implementations return a newly created constellation of widgets
that are configured with information from this widget's constructor and
from the given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html).

The given [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) contains information about the location in the
tree at which this widget is being built. For example, the context
provides the set of inherited widgets for this location in the tree. A
given widget might be built with multiple different [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)
arguments over time if the widget is moved around the tree or if the
widget is inserted into the tree in multiple places at once.

The implementation of this method must only depend on:

* the fields of the widget, which themselves must not change over time,
  and
* any ambient state obtained from the `context` using
  [BuildContext.dependOnInheritedWidgetOfExactType](https://api.flutter.dev/flutter/widgets/BuildContext/dependOnInheritedWidgetOfExactType.html).

If a widget's [build](../../views_after_auth_screens_events_manage_agenda_items_screen/ManageAgendaScreen/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

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
2. [manage\_agenda\_items\_screen](../../views_after_auth_screens_events_manage_agenda_items_screen/views_after_auth_screens_events_manage_agenda_items_screen-library.html)
3. [ManageAgendaScreen](../../views_after_auth_screens_events_manage_agenda_items_screen/ManageAgendaScreen-class.html)
4. build method

##### ManageAgendaScreen class





talawa
1.0.0+1






