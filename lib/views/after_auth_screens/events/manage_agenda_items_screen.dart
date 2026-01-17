import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/create_agenda_item_page.dart';
import 'package:talawa/views/after_auth_screens/events/edit_agenda_item_page.dart';
import 'package:talawa/widgets/agenda_item_tile.dart';

/// Agenda section screen to manage agendas.
class ManageAgendaScreen extends StatelessWidget {
  const ManageAgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<EventInfoViewModel, List<EventAgendaItem>>(
      selector: (_, model) => model.agendaItems,
      builder: (context, agendaItems, child) {
        final model = context.read<EventInfoViewModel>();
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: agendaItems.isEmpty
                      ? Center(
                          child: Text(
                            'No agenda items yet',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
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
                                final bool? wasUpdated =
                                    await Navigator.push<bool>(
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
                                await model.deleteAgendaItem(item.id ?? '');
                                if (context.mounted) {
                                  DelightToastBar(
                                    autoDismiss: true,
                                    snackbarDuration:
                                        const Duration(seconds: 2),
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
                                        color: Colors.black
                                            .withAlpha((0.8 * 255).toInt()),
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
                        builder: (context) =>
                            CreateAgendaItemPage(model: model),
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
      },
    );
  }
}
