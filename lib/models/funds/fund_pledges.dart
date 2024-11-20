import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';

/// The `Pledge` class represents a pledge for a fundraising campaign in the application.
class Pledge {
  /// Constructs a `Pledge` instance.
  ///
  /// [id] is the unique identifier of the pledge.
  /// [campaigns] is a list of campaign identifiers associated with the pledge.
  /// [users] is a list of user identifiers associated with the pledge.
  /// [startDate] is the start date of the pledge.
  /// [endDate] is the end date of the pledge.
  /// [amount] is the amount pledged.
  /// [currency] is the currency of the pledged amount.
  /// [createdAt] is the timestamp of when the pledge was created.
  /// [updatedAt] is the timestamp of when the pledge was last updated.
  Pledge({
    this.id,
    this.campaigns,
    this.pledgers,
    this.startDate,
    this.endDate,
    this.amount,
    this.currency,
    this.createdAt,
    this.updatedAt,
  });

  /// Creates a `Pledge` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the pledge data.
  ///
  /// Returns an instance of `Pledge`.
  factory Pledge.fromJson(Map<String, dynamic> json) {
    return Pledge(
      id: json['_id'] as String?,
      campaigns: (json['campaigns'] as List<dynamic>?)
          ?.map((e) => e as Campaign)
          .toList(),
      pledgers: json['users'] == null
          ? null
          : (json['users'] as List<dynamic>?)
              ?.map(
                (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
              )
              .toList(),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'] as String)
          : null,
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'] as String)
          : null,
      amount: json['amount'] as int?,
      currency: json['currency'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  /// The unique identifier of the pledge.
  final String? id;

  /// A list of campaign identifiers associated with the pledge.
  final List<Campaign>? campaigns;

  /// A list of user identifiers associated with the pledge.
  final List<User>? pledgers;

  /// The start date of the pledge.
  final DateTime? startDate;

  /// The end date of the pledge.
  final DateTime? endDate;

  /// The amount pledged.
  final int? amount;

  /// The currency of the pledged amount.
  final String? currency;

  /// The timestamp of when the pledge was created.
  final DateTime? createdAt;

  /// The timestamp of when the pledge was last updated.
  final DateTime? updatedAt;
}
