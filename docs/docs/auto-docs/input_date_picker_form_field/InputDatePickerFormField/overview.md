# Overview for `InputDatePickerFormField`

## Description

A [TextFormField] configured to accept and validate a date entered by a user.

 When the field is saved or submitted, the text will be parsed into a
 [DateTime] according to the ambient locale's compact date format. If the
 input text doesn't parse into a date, the [errorFormatText] message will
 be displayed under the field.

 [firstDate], [lastDate], and [selectableDayPredicate] provide constraints on
 what days are valid. If the input date isn't in the date range or doesn't pass
 the given predicate, then the [errorInvalidText] message will be displayed
 under the field.

 See also:

  * [showDatePicker], which shows a dialog that contains a Material Design
    date picker which includes support for text entry of dates.
  * [MaterialLocalizations.parseCompactDate], which is used to parse the text
    input into a [DateTime].

## Dependencies

- StatefulWidget

## Members

- **initialDate**: `DateTime?`
  If provided, it will be used as the default value of the field.

- **firstDate**: `DateTime`
  The earliest allowable [DateTime] that the user can input.

- **lastDate**: `DateTime`
  The latest allowable [DateTime] that the user can input.

- **onDateSubmitted**: `ValueChanged&lt;DateTime&gt;?`
  An optional method to call when the user indicates they are done editing
 the text in the field. Will only be called if the input represents a valid
 [DateTime].

- **onDateSaved**: `ValueChanged&lt;DateTime&gt;?`
  An optional method to call with the final date when the form is
 saved via [FormState.save]. Will only be called if the input represents
 a valid [DateTime].

- **selectableDayPredicate**: `SelectableDayPredicate?`
  Function to provide full control over which [DateTime] can be selected.

- **errorFormatText**: `String?`
  The error text displayed if the entered date is not in the correct format.

- **errorInvalidText**: `String?`
  The error text displayed if the date is not valid.

 A date is not valid if it is earlier than [firstDate], later than
 [lastDate], or doesn't pass the [selectableDayPredicate].

- **fieldHintText**: `String?`
  The hint text displayed in the [TextField].

 If this is null, it will default to the date format string. For example,
 'mm/dd/yyyy' for en_US.

- **fieldLabelText**: `String?`
  The label text displayed in the [TextField].

 If this is null, it will default to the words representing the date format
 string. For example, 'Month, Day, Year' for en_US.

- **keyboardType**: `TextInputType?`
  The keyboard type of the [TextField].

 If this is null, it will default to [TextInputType.datetime]

- **autofocus**: `bool`
  

- **acceptEmptyDate**: `bool`
  Determines if an empty date would show [errorFormatText] or not.

 Defaults to false.

 If true, [errorFormatText] is not shown when the date input field is empty.

- **focusNode**: `FocusNode?`
  

- **calendarDelegate**: `CalendarDelegate&lt;DateTime&gt;`
  

## Constructors

### Unnamed Constructor
Creates a [TextFormField] configured to accept and validate a date.

 If the optional [initialDate] is provided, then it will be used to populate
 the text field. If the [fieldHintText] is provided, it will be shown.

 If [initialDate] is provided, it must not be before [firstDate] or after
 [lastDate]. If [selectableDayPredicate] is provided, it must return `true`
 for [initialDate].

 [firstDate] must be on or before [lastDate].

