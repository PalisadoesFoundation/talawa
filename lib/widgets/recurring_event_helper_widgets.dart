import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/widgets/date_time_picker.dart';

/// Builds a rectangle with custom properties.
class CustomRectangle extends StatelessWidget {
  const CustomRectangle({
    super.key,
    required this.child,
  });

  /// widget that is wrapped with CustomRectangle.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final repeatEveryBoxDecoration = BoxDecoration(
      border: Border.all(
        color: Theme.of(context).textTheme.bodyLarge!.color!,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
    );
    return Container(
      decoration: repeatEveryBoxDecoration,
      child: Center(child: child),
    );
  }
}

/// Builds a TextField with custom properties.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxTextLength,
    required this.textEditingController,
    this.readOnly = false,
    this.enabled,
  });

  /// Max textLength the text field allows.
  final int? maxTextLength;

  /// Controller of textField.
  final TextEditingController textEditingController;

  /// Indicates whether text field is enabled.
  final bool? enabled;

  /// Indicates whether text field is read only.
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final outLineBorder = OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).textTheme.bodyLarge!.color!),
    );
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.15,
      child: TextField(
        maxLength: maxTextLength,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: textEditingController,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: outLineBorder,
          focusedBorder: outLineBorder,
          border: outLineBorder,
          disabledBorder: outLineBorder,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
        enabled: enabled,
        readOnly: readOnly,
      ),
    );
  }
}

/// Recurrence Frequency selection widget.
class RecurrenceFrequencyDropdown extends StatefulWidget {
  const RecurrenceFrequencyDropdown({
    super.key,
    required this.model,
    required this.onSelected,
    required this.options,
    required this.selectedOption,
  });

  /// Instance of create event view model.
  final CreateEventViewModel model;

  /// Callback to be executed when selected value changes.
  final void Function(String)? onSelected;

  /// Options to be shown in dropdown.
  final List<String> options;

  /// Selected option.
  final String selectedOption;

  @override
  _RecurrenceFrequencyDropdownState createState() =>
      _RecurrenceFrequencyDropdownState();
}

class _RecurrenceFrequencyDropdownState
    extends State<RecurrenceFrequencyDropdown> {
  @override
  Widget build(BuildContext context) {
    return CustomRectangle(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopupMenuButton<String>(
                offset: const Offset(0, 40),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    for (int i = 0; i < widget.options.length; i++)
                      PopupMenuItem<String>(
                        value: widget.options[i],
                        child: Text(widget.options[i]),
                      ),
                  ];
                },
                onSelected: widget.onSelected,
                tooltip: 'Select option',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.selectedOption,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Event ending configuration options.
class EventEndOptions extends StatefulWidget {
  const EventEndOptions({super.key, required this.model});

  /// Instance of create event view model.
  final CreateEventViewModel model;

  @override
  State<EventEndOptions> createState() => _EventEndOptionsState();
}

class _EventEndOptionsState extends State<EventEndOptions> {
  /// Event end types.
  List<String> eventEndTypes = [
    EventEndTypes.never,
    EventEndTypes.on,
    EventEndTypes.after,
  ];

  /// Custom inline width.
  static const inlineWidth = SizedBox(
    width: 8,
  );

  @override
  void initState() {
    if (widget.model.eventEndType == EventEndTypes.never) {
      widget.model.recurrenceEndDate = null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        radioButton(
          key: const Key('neverRadioButton'),
          child: const Text(EventEndTypes.never),
          index: 0,
        ),
        radioButton(
          key: const Key('onRadioButton'),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(EventEndTypes.on),
              inlineWidth,
              CustomRectangle(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    key: const Key('dateSelectorCalendar'),
                    // button to select the date and time of an event.
                    onPressed: () async {
                      // initially pickedDate is initialised with current end time.
                      final pickedDate = await customDatePicker(
                        initialDate: DateTime.now(),
                      );
                      setState(() {
                        widget.model.recurrenceEndDate = pickedDate;
                        widget.model.eventEndType = EventEndTypes.on;
                      });
                    },
                    icon: Text(
                      DateFormat("MMM d, yyyy").format(
                        widget.model.recurrenceEndDate ?? DateTime.now(),
                      ),
                      style: widget.model.eventEndType == EventEndTypes.on
                          ? TextStyle(color: Theme.of(context).dividerColor)
                          : TextStyle(
                              color: Theme.of(context)
                                  .dividerColor
                                  .withAlpha((0.4 * 255).toInt()),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          index: 1,
        ),
        radioButton(
          key: const Key('afterRadioButton'),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(EventEndTypes.after),
              inlineWidth,
              CustomRectangle(
                child: SizedBox(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                      border: InputBorder.none,
                      hintText: '1',
                    ),
                    enabled: widget.model.eventEndType == EventEndTypes.after,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        widget.model.count = int.parse(value);
                      } else {
                        widget.model.count = 1;
                      }
                    },
                  ),
                ),
              ),
              inlineWidth,
              const Text('occurrence(s)'),
            ],
          ),
          index: 2,
        ),
      ],
    );
  }

  /// Custom radio button to select event ending eventEndType.
  ///
  /// **params**:
  /// * `key`: Uniquely identifies the radioButton.
  /// * `child`: RadioListTile widget.
  /// * `index`: index of [eventEndType].
  /// * `inputAction`: Call back to be executed when clicked on radio button.
  ///
  /// **returns**:
  /// * `Theme`: custom theme.
  Theme radioButton({
    required Key key,
    required Widget child,
    required int index,
  }) {
    return Theme(
      key: key,
      data: Theme.of(context).copyWith(focusColor: Colors.transparent),
      child: RadioListTile<String>(
        title: child,
        value: eventEndTypes[index],
        groupValue: widget.model.eventEndType,
        onChanged: (value) {
          setState(() {
            widget.model.eventEndType = value!;
            if (value == EventEndTypes.never) {
              widget.model.count = null;
              widget.model.recurrenceEndDate = null;
            } else if (value == EventEndTypes.on) {
              widget.model.recurrenceEndDate = DateTime.now();
              widget.model.count = null;
            } else if (value == EventEndTypes.after) {
              widget.model.recurrenceEndDate = null;
            }
          });
        },
      ),
    );
  }
}
