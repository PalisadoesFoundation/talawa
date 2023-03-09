// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

///This class creates an langauge model.
class Language {
  Language({
    required this.countryCode,
    required this.langCode,
    required this.langName,
    required this.langSample,
  });

  final String countryCode;
  final String langCode;
  final String langName;
  final String langSample;
}
