import 'package:intl/intl.dart';

/// Combines the given date and time strings into a single string.
///
/// **params**:
/// * `date`: The date string in a valid date format (e.g., 'YYYY-MM-DD').
/// * `time`: The time string in a valid time format (e.g., 'HH:MM:SS').
///
/// **returns**:
/// * `String`: A string that combines the `date` and `time`, separated by a space.
/// * Returns an empty string if either input is null or empty.
String combineDateTime(String? date, String? time) {
  if (date == null || time == null || date.isEmpty || time.isEmpty) {
    return '';
  }
  return '$date $time';
}

/// Splits the given UTC date and time string into separate date and time strings.
///
/// **params**:
/// * `dateTimeStr`: The UTC date and time string in a valid format.
///
/// **returns**:
/// * `Map<String, String>`: A map containing the separate date and time strings.
/// * Returns an empty map if the input is invalid or null.
Map<String, String> splitDateTimeUTC(String? dateTimeStr) {
  if (dateTimeStr == null || dateTimeStr.isEmpty) {
    return {};
  }

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
/// * Returns an empty map if the input is invalid or null.
Map<String, String> splitDateTimeLocal(String? dateTimeStr) {
  if (dateTimeStr == null || dateTimeStr.isEmpty) {
    return {};
  }

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
/// * Returns an empty string if the input is invalid or null.
String convertUTCToLocal(String? utcTime) {
  if (utcTime == null || utcTime.isEmpty) {
    return '';
  }

  try {
    final DateTime dateTime = DateTime.parse(utcTime).toLocal();
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime);
  } catch (e) {
    print('Timezone Error converting UTC to local: $e $utcTime');
    return '';
  }
}

/// Formats UTC time into local date and time string.
///
/// **params**:
/// * `utcTime`: The UTC time string in a valid format.
///
/// **returns**:
/// * `String`: The converted local time string.
String formatLocalCreated(String utcTime) {
  if (utcTime.isEmpty) {
    return '';
  }
  try {
    final localStr = convertUTCToLocal(utcTime);
    final parts = splitDateTimeLocal(localStr);
    return '${parts['date']} ${parts['time']}';
  } catch (e) {
    print('Error formatting local created time: $e $utcTime');
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
/// * Returns an empty string if the input is invalid or null.
String convertLocalToUTC(String? localTime) {
  if (localTime == null || localTime.isEmpty) {
    return '';
  }

  try {
    final DateTime dateTime = DateTime.parse(localTime).toUtc();
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime);
  } catch (e) {
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
  String Function(String?) convertFn,
  Map<String, String> Function(String?) splitFn,
) {
  obj.forEach((key, value) {
    final pairedFields =
        dateTimeFields['pairedFields']?.cast<Map<String, String>>();
    if (pairedFields != null) {
      for (final field in pairedFields) {
        if (key == field['dateField'] && obj.containsKey(field['timeField'])) {
          final dateValue = obj[field['dateField']];
          final timeValue = obj[field['timeField']];

          if (dateValue != null &&
              timeValue != null &&
              dateValue is String &&
              timeValue is String) {
            try {
              final combinedDateTime = combineDateTime(
                dateValue,
                timeValue,
              );

              final convertedDateTime = convertFn(combinedDateTime);
              final splitDateTime = splitFn(convertedDateTime);

              obj[field['dateField'] ?? ''] = splitDateTime['date'] ?? '';
              obj[field['timeField'] ?? ''] = splitDateTime['time'] ?? '';
            } catch (e) {
              // Keep original values if conversion fails
            }
          }
        }
      }
    }

    if (dateTimeFields['directFields']?.cast<String>().contains(key) ?? false) {
      if (value != null && value is String) {
        try {
          obj[key] = convertFn(value);
        } catch (e) {
          print('Error converting date field $key with value $value: $e');
          // Keep the original value if conversion fails
        }
      }
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
