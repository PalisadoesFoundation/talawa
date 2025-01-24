




build method - ExpandableAgendaItemTile class - agenda\_item\_tile library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/agenda\_item\_tile.dart](../../widgets_agenda_item_tile/widgets_agenda_item_tile-library.html)
3. [ExpandableAgendaItemTile](../../widgets_agenda_item_tile/ExpandableAgendaItemTile-class.html)
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

If a widget's [build](../../widgets_agenda_item_tile/ExpandableAgendaItemTile/build.html) method is to depend on anything else, use a
[StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) instead.

See also:

* [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html), which contains the discussion on performance considerations.

## Implementation

```
@override
Widget build(BuildContext context) {
  return Card(
    color: const Color.fromARGB(255, 70, 69, 69),
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: ExpansionTile(
      leading: ReorderableDragStartListener(
        key: const Key('reorder_icon'),
        index: item.sequence! - 1,
        child: const Icon(Icons.drag_handle),
      ),
      title: Text(
        item.title!,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            key: Key("edit_agenda_item${item.id}"),
            icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
            onPressed: onEdit,
          ),
          IconButton(
            key: Key("delete_agenda_item${item.id}"),
            icon: const Icon(Icons.delete, color: Colors.red, size: 20),
            onPressed: onDelete,
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                children: (item.categories ?? []).map((category) {
                  return Chip(
                    label: Text(
                      category.name!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    padding: const EdgeInsets.all(4),
                  );
                }).toList(),
              ),
              const SizedBox(height: 8),
              const Text(
                'Description:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(item.description ?? ''),
              const SizedBox(height: 8),
              const Text(
                'Duration:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(item.duration ?? ''),
              const SizedBox(height: 8),
              if ((item.urls ?? []).isNotEmpty) ...[
                const Text(
                  'URLs:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (item.urls ?? []).map((url) {
                    return Text(
                      url,
                      style: const TextStyle(fontSize: 14),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
              ],
              if ((item.attachments ?? []).isNotEmpty) ...[
                const Text(
                  'Attachments:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: item.attachments!.length,
                  itemBuilder: (context, index) {
                    final base64String = item.attachments![index];
                    try {
                      final imageData = base64Decode(base64String);
                      return GestureDetector(
                        onTap: () => _showFullScreenImage(context, imageData),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            imageData,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      );
                    } catch (e) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.attachment,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [agenda\_item\_tile](../../widgets_agenda_item_tile/widgets_agenda_item_tile-library.html)
3. [ExpandableAgendaItemTile](../../widgets_agenda_item_tile/ExpandableAgendaItemTile-class.html)
4. build method

##### ExpandableAgendaItemTile class





talawa
1.0.0+1






