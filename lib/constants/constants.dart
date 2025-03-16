import 'package:talawa/models/language/language_model.dart';

/// This file contains the prototypes of all the supported languages and currencies used in the application.
///
/// A list of [Language] objects representing the languages supported by the application.
///
/// Each [Language] object contains the following properties:
/// * `countryCode`: The country code associated with the language.
/// * `langCode`: The language code representing the language.
/// * `langName`: The name of the language in its native script.
/// * `langSample`: A sample text phrase in the language, used for display purposes.
List<Language> languages = [
  Language(
    countryCode: 'US',
    langCode: 'en',
    langName: 'English',
    langSample: 'Welcome User',
  ),
  Language(
    countryCode: 'IN',
    langCode: 'hi',
    langName: 'हिंदी',
    langSample: 'स्वागत उपयोगकर्ता',
  ),
  Language(
    countryCode: 'CN',
    langCode: 'zh',
    langName: '中国人',
    langSample: '欢迎用户',
  ),
  Language(
    countryCode: 'FR',
    langCode: 'fr',
    langName: 'français',
    langSample: 'Bienvenue utilisateur',
  ),
  Language(
    countryCode: 'ES',
    langCode: 'es',
    langName: 'Española',
    langSample: 'Bienvenida usuario',
  ),
  Language(
    countryCode: 'JP',
    langCode: 'ja',
    langName: '日本',
    langSample: 'ようこそユーザー',
  ),
  Language(
    countryCode: 'GE',
    langCode: 'de',
    langName: 'Deutsch',
    langSample: 'Willkommen Benutzer',
  ),
  Language(
    countryCode: 'PE',
    langCode: 'pt',
    langName: 'português',
    langSample: 'Bem-vindo, usuário',
  ),
];

/// A list of supported currency codes used in the application.
///
/// Each currency code is represented as a string in the list. This list is used to ensure that the application
/// supports various currencies for transactions, conversions, or displays.
List<String> supportedCurrencies = [
  'AED',
  'ALL',
  'AMD',
  'ARS',
  'AUD',
  'AWG',
  'BBD',
  'BDT',
  'BMD',
  'BND',
  'BOB',
  'BSD',
  'BWP',
  'BZD',
  'CAD',
  'CHF',
  'CNY',
  'COP',
  'CRC',
  'CUP',
  'CZK',
  'DKK',
  'DOP',
  'DZD',
  'EGP',
  'ETB',
  'EUR',
  'FJD',
  'GBP',
  'GHS',
  'GIP',
  'GMD',
  'GTQ',
  'GYD',
  'HKD',
  'HNL',
  'HRK',
  'HTG',
  'HUF',
  'IDR',
  'ILS',
  'INR',
  'JMD',
  'KES',
  'KGS',
  'KHR',
  'KYD',
  'KZT',
  'LAK',
  'LBP',
  'LKR',
  'LRD',
  'LSL',
  'MAD',
  'MDL',
  'MKD',
  'MMK',
  'MNT',
  'MOP',
  'MUR',
  'MVR',
  'MWK',
  'MXN',
  'MYR',
  'NAD',
  'NGN',
  'NIO',
  'NOK',
  'NPR',
  'NZD',
  'PEN',
  'PGK',
  'PHP',
  'PKR',
  'QAR',
  'RUB',
  'SAR',
  'SCR',
  'SEK',
  'SGD',
  'SLL',
  'SOS',
  'SSP',
  'SVC',
  'SZL',
  'THB',
  'TTD',
  'TZS',
  'USD',
  'UYU',
  'UZS',
  'YER',
  'ZAR',
];

/// A class containing static constants representing the keys used to identify Hive boxes in the application.
///
/// These keys are used to open or access specific Hive boxes, which store various types of data such as user information,
/// organization details, and cached actions.
class HiveKeys {
  /// The key used to identify the Hive box that stores the current user information.
  static const userBoxKey = 'currentUser';

  /// The key used to identify the Hive box that stores the current organization's information.
  static const orgBoxKey = 'currentOrg';

  /// The key used to identify the Hive box that stores asymmetric keys for the user.
  static const asymetricKeyBoxKey = 'user_keys';

  /// The key used to identify the Hive box that stores URLs.
  static const urlBoxKey = 'url';

  /// The key used to identify the Hive box that stores the post feed data.
  static const postFeedKey = 'post_feed_key';

  /// The key used to identify the Hive box that stores the event feed data.
  static const eventFeedKey = 'event_feed_key';

  /// The key used to identify the Hive box that stores the offline action queue.
  static const offlineActionQueueKey = 'offline_action_queue';
}
