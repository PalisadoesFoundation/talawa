/// Model for the address of an organisation.
class Address {
  /// Constructs an Address object.
  Address({
    this.city,
    this.countryCode,
    this.dependentLocality,
    this.line1,
    this.line2,
    this.postalCode,
    this.sortingCode,
    this.state,
  });

  /// Factory method to construct an Address from a JSON object.
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String?,
      countryCode: json['countryCode'] as String?,
      dependentLocality: json['dependentLocality'] as String?,
      line1: json['line1'] as String?,
      line2: json['line2'] as String?,
      postalCode: json['postalCode'] as String?,
      sortingCode: json['sortingCode'] as String?,
      state: json['state'] as String?,
    );
  }

  /// The city of the address.
  final String? city;

  /// The country code of the address.
  final String? countryCode;

  /// The dependent locality of the address.
  final String? dependentLocality;

  /// The first line of the address.
  final String? line1;

  /// The second line of the address.
  final String? line2;

  /// The postal code of the address.
  final String? postalCode;

  /// The sorting code of the address.
  final String? sortingCode;

  /// The state of the address.
  final String? state;
}
