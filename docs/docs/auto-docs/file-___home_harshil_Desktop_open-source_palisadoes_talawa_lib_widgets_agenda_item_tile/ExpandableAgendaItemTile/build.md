




build method - ExpandableAgendaItemTile class - agenda\_item\_tile library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/agenda\_item\_tile.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_agenda_item_tile/)
3. [ExpandableAgendaItemTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_agenda_item_tile/ExpandableAgendaItemTile-class.html)
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
2. [agenda\_item\_tile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_agenda_item_tile/)
3. [ExpandableAgendaItemTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_agenda_item_tile/ExpandableAgendaItemTile-class.html)
4. build method

##### ExpandableAgendaItemTile class





talawa
1.0.0+1






