import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/services/size_config.dart';
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
    required this.maxTextLength,
    required this.textEditingController,
  });

  /// Max textLength the text field allows.
  final int maxTextLength;

  /// Controller of textField.
  final TextEditingController textEditingController;

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
        controller: textEditingController,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: outLineBorder,
          focusedBorder: outLineBorder,
          border: outLineBorder,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

/// Recurrence Frequency selection widget.
class RecurrenceFrequencyDropdown extends StatefulWidget {
  @override
  _RecurrenceFrequencyDropdownState createState() =>
      _RecurrenceFrequencyDropdownState();
}

class _RecurrenceFrequencyDropdownState
    extends State<RecurrenceFrequencyDropdown> {
  /// Frequency options.
  List<String> options = ['day', 'week', 'month', 'year'];

  late String _selectedOption = 'week';

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          for (int i = 0; i < options.length; i++)
            PopupMenuItem<String>(
              value: options[i],
              child: Text(options[i]),
            ),
        ];
      },
      onSelected: (String value) {
        setState(() {
          _selectedOption = value;
        });
      },
      tooltip: 'Select option',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_selectedOption),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}

/// Event ending configuration options.
class EventEndOptions extends StatefulWidget {
  const EventEndOptions({super.key});

  @override
  State<EventEndOptions> createState() => _EventEndOptionsState();
}

class _EventEndOptionsState extends State<EventEndOptions> {
  /// Event ending frequency.
  static List<String> frequency = [
    'Never',
    'On',
    'After',
  ];
  String _selectedFrequency = frequency[0];
  DateTime _endDate = DateTime.now();
  final TextEditingController _repeatFrequencyTextController =
      TextEditingController();

  /// Custom inline width.
  static const inlineWidth = SizedBox(
    width: 8,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        radioButton(const Key('neverRadioButton'), Text(frequency[0]), 0),
        radioButton(
          const Key('onRadioButton'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(frequency[1]),
              inlineWidth,
              CustomRectangle(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    key: const Key('dateSelectorCalendar'),
                    // button to select the date and time of an event.
                    onPressed: () async {
                      // initially pickedDate is initialised with current end time.
                      final pickedDate =
                          await customDatePicker(initialDate: _endDate);
                      setState(() {
                        _endDate = pickedDate;
                      });
                    },
                    icon: Text(formatDate(_endDate.toString().split(" ")[0])),
                  ),
                ),
              ),
            ],
          ),
          1,
        ),
        radioButton(
          const Key('afterRadioButton'),
          Row(
            children: [
              Text(frequency[2]),
              inlineWidth,
              CustomTextField(
                maxTextLength: 3,
                textEditingController: _repeatFrequencyTextController,
              ),
              inlineWidth,
              const Text('occurrence'),
            ],
          ),
          2,
        ),
      ],
    );
  }

  /// Custom radio button to select event ending frequency.
  ///
  /// **params**:
  /// * `key`: Uniquely identifies the radioButton.
  /// * `child`: RadioListTile widget.
  /// * `index`: index of [frequency].
  ///
  /// **returns**:
  /// * `Theme`: custom theme.
  Theme radioButton(Key key, Widget child, int index) {
    return Theme(
      key: key,
      data: Theme.of(context).copyWith(focusColor: Colors.transparent),
      child: RadioListTile<String>(
        title: child,
        value: frequency[index],
        groupValue: _selectedFrequency,
        onChanged: (value) {
          setState(() {
            _selectedFrequency = value!;
          });
        },
      ),
    );
  }

  /// Formats input date into [MMM d, yyyy] format.
  ///
  /// **params**:
  /// * `inputDate`: Unformatted date.
  ///
  /// **returns**:
  /// * `String`: formatted date.
  String formatDate(String inputDate) {
    final DateTime dateTime = DateTime.parse(inputDate);
    return DateFormat("MMM d, yyyy").format(dateTime);
  }
}
