/// The `Venue` class represents a venue for events.
class Venue {
  /// Constructs a `Venue` instance.
  ///
  /// [id] is the unique identifier of the venue.
  /// [capacity] is the maximum number of people the venue can accommodate.
  /// [description] provides additional details about the venue.
  /// [imageUrl] is the URL of the venue's image.
  /// [name] is the name of the venue.
  /// [organizationId] is the identifier of the organization to which the venue belongs.
  Venue({
    this.id,
    this.capacity,
    this.description,
    this.imageUrl,
    this.name,
    this.organizationId,
  });

  /// Creates a `Venue` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the venue data.
  ///
  /// Returns an instance of `Venue`.
  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['_id'] as String?,
      capacity: json['capacity'] as int?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String? ?? '',
      name: json['name'] as String?,
      organizationId:
          (json['organization'] as Map<String, dynamic>?)?['_id'] as String?,
    );
  }

  /// The unique identifier of the venue.
  final String? id;

  /// The maximum number of people the venue can accommodate.
  final int? capacity;

  /// Provides additional details about the venue.
  final String? description;

  /// The URL of the venue's image.
  final String? imageUrl;

  /// The name of the venue.
  final String? name;

  /// The identifier of the organization to which the venue belongs.
  final String? organizationId;
}
