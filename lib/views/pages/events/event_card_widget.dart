import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:talawa/model/events.dart';
import 'package:talawa/services/app_localization.dart';
import 'package:talawa/utils/uidata.dart';
import 'package:talawa/view_models/page_view_model/events_page_view_model.dart';
import 'package:talawa/views/pages/events/add_event_page.dart';
import 'event_detail_page.dart';

Widget eventCard(int index, EventPageViewModel model, BuildContext context) {
  return Container(
    child: Column(
      children: [
        ExpansionTile(
          title: Text(
            model.displayEvents[index].title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            model.displayEvents[index].description,
            style: const TextStyle(color: Colors.black54),
          ),
          trailing: popUpMenue(model.displayEvents[index], model, context),
          children: <Widget>[
            model.displayEvents[index].isPublic
                ? menueText('This event is Public', context)
                : menueText('This event is Private', context),
            model.displayEvents[index].isRegistered
                ? menueText('You Are Registered', context)
                : menueText('You Are Not Registered', context),
            ListTile(
              trailing: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(UIData.secondaryColor),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const StadiumBorder()),
                ),
                onPressed: () {
                  pushNewScreen(
                    context,
                    withNavBar: true,
                    screen: EventDetail(event: model.displayEvents[index]),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).translate("More"),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        // ),
        const Divider(
          height: 0,
          thickness: 1,
        )
      ],
    ),
  );
}

Widget menueText(String text, BuildContext context) {
  return ListTile(
      title: Text(
    AppLocalizations.of(context).translate(text),
    style: TextStyle(color: Colors.grey[700]),
  ));
}

Widget popUpMenue(
    EventsModel event, EventPageViewModel model, BuildContext context) {
  return PopupMenuButton<int>(
    onSelected: (val) async {
      if (val == 1) {
        return model.register(context, event.id);
      } else if (val == 2) {
        return model.addEventTask(context, event.id);
      } else if (val == 3) {
        return model.editEvent(context, event);
      } else if (val == 4) {
        return model.deleteEvent(context, event);
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
      PopupMenuItem<int>(
          value: 1,
          child: ListTile(
            leading: const Icon(Icons.playlist_add_check, color: Colors.grey),
            title: Text(
              AppLocalizations.of(context).translate('Register For Event'),
              style: const TextStyle(color: Colors.black),
            ),
          )),
      PopupMenuItem<int>(
          value: 2,
          child: ListTile(
            leading: const Icon(Icons.note_add, color: Colors.grey),
            title: Text(
              AppLocalizations.of(context)
                  .translate('Add a Task to this Event'),
              style: const TextStyle(color: Colors.black),
            ),
          )),
      // ignore: sdk_version_ui_as_code
      if (event.creator.id == model.userID) ...[
        PopupMenuItem<int>(
            value: 3,
            child: ListTile(
              leading: const Icon(Icons.edit, color: Colors.grey),
              title: Text(
                AppLocalizations.of(context).translate('Edit this event'),
                style: const TextStyle(color: Colors.black),
              ),
            )),
        PopupMenuItem<int>(
          value: 4,
          child: ListTile(
            leading: const Icon(Icons.delete, color: Colors.grey),
            title: Text(
              AppLocalizations.of(context).translate('Delete This Event'),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    ],
  );
}

Widget eventFab(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: UIData.secondaryColor,
    onPressed: () {
      pushNewScreen(
        context,
        withNavBar: true,
        screen: const AddEvent(),
      );
    },
    child: const Icon(
      Icons.add,
      color: Colors.white,
    ),
  );
}
