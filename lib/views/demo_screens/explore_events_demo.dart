import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/main_screen_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/explore_event_dialogue.dart';
import 'package:talawa/widgets/event_card.dart';

/// Shows the list of events with options to categorize them.
class DemoExploreEvents extends StatelessWidget {
  const DemoExploreEvents({
    required Key key,
    this.homeModel,
  }) : super(key: key);

  /// [homeModal] is a type of [MainScreenViewModel] which provides methods to handle the data for this component.
  final MainScreenViewModel? homeModel;

  @override
  Widget build(BuildContext context) {
    final model = locator<ExploreEventsViewModel>();
    return Scaffold(
      appBar: AppBar(
        // AppBar returns widget for the header.
        backgroundColor: Theme.of(context).primaryColor,
        key: const Key("ExploreEventsAppBar"),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Explore Events'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        leading: IconButton(
          // returns a button of menu icon to redirect to home.
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(Icons.menu),
          onPressed: () =>
              MainScreenViewModel.scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.screenWidth! * 0.027,
            ),
            // if the events is not empty then renders button for searching the events else renders just a box.
            // child: model.events.isNotEmpty
            //     ? IconButton(
            //         onPressed: () {
            //           showSearch(
            //             context: context,
            //             delegate: EventSearch(
            //               eventList: model.events,
            //               exploreEventsViewModel: model,
            //             ),
            //           );
            //         },
            //         icon: const Icon(Icons.search, size: 20),
            //       )
            //     : const SizedBox(),
            child: const SizedBox(),
          ),
        ],
      ),
      // if the model is still fetching the events list then renders the Circular Progress Indicator
      // else render refresh icon along with the list of searched events for exploration.
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth! * 0.010,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Card(
                          color: Theme.of(context).colorScheme.onPrimary,
                          elevation: 2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            //width: SizeConfig.screenWidth! * 0.45,
                            child: DropdownButtonHideUnderline(
                              child: dropDownList(model, context),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              // on tap open the Explore Event Dialog.
                              context: context,
                              builder: (_) {
                                return const ExploreEventDialog(
                                  key: Key('ExploreEvents'),
                                );
                              },
                            );
                          },
                          child: Card(
                            key: homeModel?.keySEDateFilter,
                            color: Theme.of(context).colorScheme.onPrimary,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                              ),
                              // width: SizeConfig.screenWidth! * 0.30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff524F4F),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .strictTranslate(
                                      "Add Date",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: Theme.of(context).colorScheme.onPrimary,
                          child: IconButton(
                            onPressed: () {
                              navigationService.pushScreen(
                                Routes.calendar,
                                arguments: model.events,
                              );
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.027,
                  ),
                  // if the events model is empty then renders a box with text as "Empty List"
                  // else renders lists of the all event tile.
                  model.events.isEmpty
                      ? SizedBox(
                          height: SizeConfig.screenHeight! * 0.5,
                          child: Center(
                            child: Text(model.emptyListMessage),
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.events.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                navigationService.pushScreen(
                                  "/eventInfo",
                                  arguments: {
                                    "event": model.events[index],
                                    "exploreEventViewModel": model,
                                  },
                                );
                              },
                              child: EventCard(
                                event: model.events[index],
                                isSearchItem: false,
                              ),
                            );
                          },
                        ),
                ],
=======
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/date_time_picker.dart';

/// Calendar demo screen with multiple view options and sample events.
class DemoExploreEvents extends StatefulWidget {
  const DemoExploreEvents({super.key});

  @override
  State<DemoExploreEvents> createState() => DemoExploreEventsState();
}

class DemoExploreEventsState extends State<DemoExploreEvents> {
  /// The current calendar view.
  CalendarView calendarView = CalendarView.month;

  /// The calendar controller.
  final CalendarController calendarController = CalendarController();

  /// The date range picker controller.
  final DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  @override
  void dispose() {
    calendarController.dispose();
    dateRangePickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.strictTranslate("Explore Events"),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            Scaffold.maybeOf(context)?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final pickedDate =
                  await customDatePicker(initialDate: DateTime.now());
              dateRangePickerController.selectedDate = pickedDate;
              calendarController.displayDate = pickedDate;
            },
            icon: const Icon(Icons.date_range, color: Colors.white),
          ),
          calendarViewSelection(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCalendar(
              view: calendarView,
              headerHeight: 60,
              viewHeaderHeight: 60,
              controller: calendarController,
              dataSource: DemoAppointmentDataSource(getDemoEvents()),
              onViewChanged: onViewChanged,
              onTap: onCalendarTap,
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                showAgenda: true,
                agendaViewHeight: 200,
>>>>>>> upstream/develop
              ),
            ),
          ),
        ],
      ),
<<<<<<< HEAD

      floatingActionButton: FloatingActionButton.extended(
        key: homeModel?.keySEAdd,
        heroTag: "AddEventFab",
        backgroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () {
          navigationService.pushScreen(
            "/createEventPage",
          );
        },
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
        ),
        label: Text(
          AppLocalizations.of(context)!.strictTranslate("Event"),
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }

  /// Shows a list of dropdown taken from  `model` and `context`.
  ///
  /// **params**:
  /// * `model`: contains the events data
  /// * `context`: the overall context of UI
  ///
  /// **returns**:
  /// * `Widget`: the dropdown
  Widget dropDownList(ExploreEventsViewModel model, BuildContext context) {
    return DropdownButton<String>(
      key: homeModel?.keySECategoryMenu,
      value: model.chosenValue,
      isExpanded: true,
      items: <String>[
        'All Events',
        'Created Events',
        'Registered Events',
        'Public Events',
        'Private Events',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            AppLocalizations.of(context)!.strictTranslate(value),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
        );
      }).toList(),
      onChanged: (value) {
        model.choseValueFromDropdown(value!);
      },
    );
  }
=======
    );
  }

  /// Handles calendar view changes.
  ///
  /// **params**:
  /// * `viewChangedDetails`: The details of the view change event.
  ///
  /// **returns**:
  ///   None
  void onViewChanged(ViewChangedDetails viewChangedDetails) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dateRangePickerController.selectedDate =
          viewChangedDetails.visibleDates[0];
      dateRangePickerController.displayDate =
          viewChangedDetails.visibleDates[0];
    });
  }

  /// Handles calendar tap events.
  ///
  /// **params**:
  /// * `details`: The details of the calendar tap event.
  ///
  /// **returns**:
  ///   None
  void onCalendarTap(CalendarTapDetails details) {
    if (details.appointments != null && details.appointments!.isNotEmpty) {
      final Appointment appointment =
          details.appointments!.first as Appointment;
      showEventDetails(appointment);
    }
  }

  /// Shows event details in a dialog.
  ///
  /// **params**:
  /// * `appointment`: The appointment to show details for.
  ///
  /// **returns**:
  ///   None
  void showEventDetails(Appointment appointment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(appointment.subject),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    "${formatTime(appointment.startTime)} - ${formatTime(appointment.endTime)}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (appointment.location != null) ...[
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        appointment.location!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
              if (appointment.notes != null) ...[
                const Row(
                  children: [
                    Icon(Icons.notes, size: 16),
                    SizedBox(width: 8),
                    Text("Description:"),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  appointment.notes!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child:
                  Text(AppLocalizations.of(context)!.strictTranslate("Close")),
            ),
          ],
        );
      },
    );
  }

  /// Calendar view selection popup menu.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `PopupMenuButton<String>`: A popup menu for calendar view selection.
  PopupMenuButton<String> calendarViewSelection() {
    final List<String> views = ["Month", "Schedule"];
    return PopupMenuButton<String>(
      icon: const Icon(Icons.view_agenda, color: Colors.white),
      itemBuilder: (context) {
        return <PopupMenuEntry<String>>[
          for (final view in views)
            PopupMenuItem(
              value: view,
              child: Text(view),
            ),
        ];
      },
      onSelected: (value) {
        setState(() {
          switch (value) {
            case "Month":
              calendarView = CalendarView.month;
            case "Schedule":
              calendarView = CalendarView.schedule;
            default:
          }
          // Update the calendar controller's view
          calendarController.view = calendarView;
        });
      },
    );
  }

  /// Generates demo events for the calendar.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `List<Appointment>`: A list of demo appointments for the calendar.
  List<Appointment> getDemoEvents() {
    final List<Appointment> appointments = <Appointment>[];
    final DateTime today = DateTime.now();
    final colors = [
      Colors.green,
      Colors.blue,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.pink,
    ];

    // Sample events
    final List<Map<String, dynamic>> sampleEvents = [
      {
        'title': 'Community Meeting',
        'description':
            'Monthly community gathering to discuss upcoming projects and initiatives.',
        'location': 'Main Hall',
        'startHours': 2,
        'duration': 2,
        'dayOffset': 1,
        'isAllDay': false,
      },
      {
        'title': 'Volunteer Training',
        'description':
            'Training session for new volunteers joining our organization.',
        'location': 'Training Room A',
        'startHours': 3,
        'duration': 3,
        'dayOffset': 3,
        'isAllDay': false,
      },
      {
        'title': 'Fundraising Event',
        'description':
            'Annual fundraising gala to support our community programs.',
        'location': 'Grand Ballroom',
        'startHours': 0,
        'duration': 24,
        'dayOffset': 5,
        'isAllDay': true,
      },
      {
        'title': 'Youth Workshop',
        'description':
            'Interactive workshop for youth development and skill building.',
        'location': 'Activity Center',
        'startHours': 4,
        'duration': 2,
        'dayOffset': 7,
        'isAllDay': false,
      },
      {
        'title': 'Board Meeting',
        'description':
            'Quarterly board meeting to review progress and plan future activities.',
        'location': 'Conference Room',
        'startHours': 1,
        'duration': 3,
        'dayOffset': 10,
        'isAllDay': false,
      },
      {
        'title': 'Community Service',
        'description':
            'Weekly community service project - park cleanup and beautification.',
        'location': 'Central Park',
        'startHours': 2,
        'duration': 4,
        'dayOffset': 14,
        'isAllDay': false,
      },
    ];

    for (int i = 0; i < sampleEvents.length; i++) {
      final event = sampleEvents[i];
      final startTime = today
          .add(Duration(days: event['dayOffset'] as int))
          .add(Duration(hours: event['startHours'] as int));
      final endTime = startTime.add(Duration(hours: event['duration'] as int));

      appointments.add(
        Appointment(
          startTime: startTime,
          endTime: endTime,
          subject: event['title'] as String,
          color: colors[i % colors.length],
          location: event['location'] as String,
          notes: event['description'] as String,
          isAllDay: event['isAllDay'] as bool,
        ),
      );
    }

    return appointments;
  }

  /// Formats time for display.
  ///
  /// **params**:
  /// * `dateTime`: The DateTime object to format.
  ///
  /// **returns**:
  /// * `String`: A formatted time string.
  String formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute;
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '${displayHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }
}

/// Demo data source for the calendar.
class DemoAppointmentDataSource extends CalendarDataSource {
  DemoAppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
>>>>>>> upstream/develop
}
