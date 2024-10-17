import 'package:intl/intl.dart';

/// Combines the given date and time strings into a single string.
///
/// **params**:
/// * `date`: The date string in a valid date format (e.g., 'YYYY-MM-DD').
/// * `time`: The time string in a valid time format (e.g., 'HH:MM:SS').
///
/// **returns**:
/// * `String`: A string that combines the `date` and `time`, separated by a space.
String combineDateTime(String date, String time) {
  return '$date $time';
}

/// Splits the given UTC date and time string into separate date and time strings.
///
/// **params**:
/// * `dateTimeStr`: The UTC date and time string in a valid format.
///
/// **returns**:
/// * `Map<String, String>`: A map containing the separate date and time strings.
/// * Returns an empty map if the input is invalid.
Map<String, String> splitDateTimeUTC(String dateTimeStr) {
  try {
    final DateTime dateTime = DateTime.parse(dateTimeStr);
    return {
      'date': DateFormat('yyyy-MM-dd').format(dateTime),
      'time': DateFormat("HH:mm:ss.SSS'Z'").format(dateTime),
    };
  } catch (e) {
    print('Timezone Error parsing UTC date time: $e $dateTimeStr');
    return {};
  }
}

/// Splits the given local date and time string into separate date and time strings.
///
/// **params**:
/// * `dateTimeStr`: The local date and time string in a valid format.
///
/// **returns**:
/// * `Map<String, String>`: A map containing the separate date and time strings.
/// * Returns an empty map if the input is invalid.
Map<String, String> splitDateTimeLocal(String dateTimeStr) {
  try {
    final DateTime dateTime = DateTime.parse(dateTimeStr);
    return {
      'date': DateFormat('yyyy-MM-dd').format(dateTime),
      'time': DateFormat('HH:mm').format(dateTime),
    };
  } catch (e) {
    print('Timezone Error parsing local date time: $e $dateTimeStr');
    return {};
  }
}

/// Converts the given UTC time to local time.
///
/// **params**:
/// * `utcTime`: The UTC time string in a valid format.
///
/// **returns**:
/// * `String`: The converted local time string.
/// * Returns an empty string if the input is invalid.
String convertUTCToLocal(String utcTime) {
  try {
    final DateTime dateTime = DateTime.parse(utcTime).toLocal();
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime);
  } catch (e) {
    print('Timezone Error converting UTC to local: $e $utcTime');
    return '';
  }
}

/// Converts the given local time to UTC time.
///
/// **params**:
/// * `localTime`: The local time string in a valid format.
///
/// **returns**:
/// * `String`: The converted UTC time string.
/// * Returns an empty string if the input is invalid.
String convertLocalToUTC(String localTime) {
  try {
    final DateTime dateTime = DateTime.parse(localTime).toUtc();
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime);
  } catch (e) {
    print('Timezone Error converting local to UTC: $e $localTime');
    return '';
  }
}

/// Traverses a nested map and converts date and time fields to the desired format.
///
/// **params**:
/// * `obj`: The nested map to traverse and convert.
/// * `convertFn`: A function that converts a combined date and time string to the desired format.
/// * `splitFn`: A function that splits a converted date and time string into separate date and time strings.
///
/// **returns**:
///   None
void traverseAndConvertDates(
  Map<String, dynamic> obj,
  String Function(String) convertFn,
  Map<String, String> Function(String) splitFn,
) {
  obj.forEach((key, value) {
    final pairedFields =
        dateTimeFields['pairedFields']?.cast<Map<String, String>>();
    if (pairedFields != null) {
      for (final field in pairedFields) {
        if (key == field['dateField'] && obj.containsKey(field['timeField'])) {
          final combinedDateTime = combineDateTime(
            obj[field['dateField']] as String,
            obj[field['timeField']] as String,
          );

          final convertedDateTime = convertFn(combinedDateTime);

          final splitDateTime = splitFn(convertedDateTime);

          obj[field['dateField'] ?? ''] = splitDateTime['date'] ?? '';
          obj[field['timeField'] ?? ''] = splitDateTime['time'] ?? '';
        }
      }
    }

    if (dateTimeFields['directFields']?.cast<String>().contains(key) ?? false) {
      obj[key] = convertFn(value as String);
    }

    if (value is Map<String, dynamic>) {
      traverseAndConvertDates(value, convertFn, splitFn);
    } else if (value is List) {
      for (final item in value) {
        if (item is Map<String, dynamic>) {
          traverseAndConvertDates(item, convertFn, splitFn);
        }
      }
    }
  });
}

/// Contains information about the date and time fields used for conversion.
const dateTimeFields = {
  'directFields': [
    'createdAt',
    'birthDate',
    'updatedAt',
    'recurrenceStartDate',
    'recurrenceEndDate',
    'pluginCreatedBy',
    'dueDate',
    'completionDate',
    'startCursor',
    'endCursor',
  ],
  'pairedFields': [
    {'dateField': 'startDate', 'timeField': 'startTime'},
    {'dateField': 'endDate', 'timeField': 'endTime'},
  ],
};
