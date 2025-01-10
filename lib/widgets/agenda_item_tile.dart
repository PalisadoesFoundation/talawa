import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:talawa/models/events/event_agenda_item.dart';

/// A widget that displays an expandable agenda item tile.
class ExpandableAgendaItemTile extends StatelessWidget {
  const ExpandableAgendaItemTile({
    super.key,
    required this.item,
    required this.onEdit,
    required this.onDelete,
  });

  /// Agenda Item whose data to be displayed.
  final EventAgendaItem item;

  /// edit callback for the agenda item.
  final VoidCallback onEdit;

  /// on delete callback for agenda item.
  final VoidCallback onDelete;

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

  /// show Image in full screen mode.
  ///
  /// **params**:
  /// * `context`: context for the image
  /// * `imageData`: data of the Image that is to be viewed
  ///
  /// **returns**:
  ///   None
  void _showFullScreenImage(BuildContext context, Uint8List imageData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: ColoredBox(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 4,
                child: Image.memory(
                  imageData,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
