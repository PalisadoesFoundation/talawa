import 'package:talawa/models/funds/fund_pledges.dart';

/// The `Campaign` class represents a fundraising campaign in the application.
class Campaign {
  /// Constructs a `FundraisingCampaign` instance.
  ///
  /// [id] is the unique identifier of the campaign.
  /// [fundId] is the identifier of the fund to which the campaign belongs.
  /// [name] is the name of the campaign.
  /// [startDate] is the start date of the campaign.
  /// [endDate] is the end date of the campaign.
  /// [fundingGoal] is the funding goal of the campaign.
  /// [currency] is the currency used for the campaign.
  /// [pledges] is a list of pledge identifiers associated with the campaign.
  /// [createdAt] is the timestamp of when the campaign was created.
  /// [updatedAt] is the timestamp of when the campaign was last updated.
  Campaign({
    this.id,
    this.fundId,
    this.name,
    this.startDate,
    this.endDate,
    this.fundingGoal,
    this.currency,
    this.pledges,
    this.createdAt,
    this.updatedAt,
  });

  /// Creates a `Campaign` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the campaign data.
  ///
  /// Returns an instance of `Campaign`.
  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['_id'] as String?,
      fundId: json['fundId'] as String?,
      name: json['name'] as String?,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : null,
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      fundingGoal: (json['fundingGoal'] is int)
          ? (json['fundingGoal'] as int).toDouble()
          : json['fundingGoal'] as double?,
      currency: json['currency'] as String?,
      pledges:
          (json['pledges'] as List<dynamic>?)?.map((e) => e as Pledge).toList(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  /// The unique identifier of the campaign.
  final String? id;

  /// The identifier of the fund to which the campaign belongs.
  final String? fundId;

  /// The name of the campaign.
  final String? name;

  /// The start date of the campaign.
  final DateTime? startDate;

  /// The end date of the campaign.
  final DateTime? endDate;

  /// The funding goal of the campaign.
  final double? fundingGoal;

  /// The currency used for the campaign.
  final String? currency;

  /// A list of pledge identifiers associated with the campaign.
  final List<Pledge>? pledges;

  /// The timestamp of when the campaign was created.
  final DateTime? createdAt;

  /// The timestamp of when the campaign was last updated.
  final DateTime? updatedAt;
}
