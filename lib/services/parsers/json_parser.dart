import 'dart:convert';

/// Parses a JSON string into a Map<String, dynamic>.
///
/// This function is designed to be used with Flutter's compute() function
/// to perform heavy JSON parsing operations in a separate isolate,
/// preventing UI thread blocking.
///
/// **params**:
/// * `jsonString`: The JSON string to parse
///
/// **returns**:
/// * `Map<String, dynamic>`: The parsed JSON map
///
/// **throws**:
/// * `FormatException`: If the JSON string is invalid
Map<String, dynamic> parseJsonToMap(String jsonString) {
  return json.decode(jsonString) as Map<String, dynamic>;
}

/// Parses a JSON string into a List<dynamic>.
///
/// This function is designed to be used with Flutter's compute() function
/// to perform heavy JSON parsing operations in a separate isolate.
///
/// **params**:
/// * `jsonString`: The JSON string to parse
///
/// **returns**:
/// * `List<dynamic>`: The parsed JSON list
///
/// **throws**:
/// * `FormatException`: If the JSON string is invalid
List<dynamic> parseJsonToList(String jsonString) {
  return json.decode(jsonString) as List<dynamic>;
}
