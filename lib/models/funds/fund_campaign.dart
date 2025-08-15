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
    this.goalAmount,
    this.currency,
    this.pledges,
    this.pledgedAmount,
  });

  /// Creates a `Campaign` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the campaign data.
  ///
  /// Returns an instance of `Campaign`.
  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'] as String?,
      fundId: json['fund'] != null
          ? (json['fund'] as Map<String, dynamic>)['id'] as String?
          : json['fundId'] as String?,
      name: json['name'] as String?,
      startDate: json['startAt'] != null
          ? DateTime.tryParse(json['startAt'] as String)
          : null,
      endDate: json['endAt'] != null
          ? DateTime.tryParse(json['endAt'] as String)
          : null,
      goalAmount: (json['goalAmount'] is int)
          ? (json['goalAmount'] as int).toDouble()
          : json['goalAmount'] as double?,
      currency: json['currencyCode'] as String? ?? json['currency'] as String?,
      pledges:
          (json['pledges'] as List<dynamic>?)?.map((e) => e as Pledge).toList(),
      pledgedAmount: (json['pledgedAmount'] is int)
          ? (json['pledgedAmount'] as int).toDouble()
          : json['pledgedAmount'] as double? ?? 0.0,
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
  final double? goalAmount;

  /// Total amount of money pledged under the fund campaign.
  final double? pledgedAmount;

  /// The currency used for the campaign.
  final String? currency;

  /// A list of pledge identifiers associated with the campaign.
  final List<Pledge>? pledges;
}
