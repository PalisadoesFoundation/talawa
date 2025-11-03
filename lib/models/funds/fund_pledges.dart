import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';

/// The `Pledge` class represents a pledge for a fundraising campaign in the application.
class Pledge {
  /// Constructs a `Pledge` instance.
  ///
  /// [id] is the unique identifier of the pledge.
  /// [amount] is the amount pledged.
  /// [pledger] is the user who made the pledge.
  /// [campaign] is the campaign associated with the pledge.
  /// [startDate] is the start date of the pledge.
  /// [endDate] is the end date of the pledge.
  Pledge({
    this.id,
    this.amount,
    this.pledger,
    this.campaign,
    this.startDate,
    this.endDate,
    this.note,
    this.currency,
    this.creator,
  });

  /// Creates a `Pledge` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the pledge data.
  ///
  /// Returns an instance of `Pledge`.
  factory Pledge.fromJson(Map<String, dynamic> json) {
    final Campaign? campaign = json['campaign'] != null
        ? Campaign.fromJson(json['campaign'] as Map<String, dynamic>)
        : null;
    return Pledge(
      id: json['id'] as String?,
      amount: json['amount'] as int?,
      pledger: json['pledger'] != null
          ? User.fromJson(json['pledger'] as Map<String, dynamic>)
          : null,
      campaign: campaign,
      startDate: campaign?.startDate,
      endDate: campaign?.endDate,
      note: json['note'] as String?,
      creator: json['creator'] != null
          ? User.fromJson(
              json['creator'] as Map<String, dynamic>,
            )
          : null,
      currency: campaign?.currency,
    );
  }

  /// The unique identifier of the pledge.
  final String? id;

  /// The amount pledged.
  final int? amount;

  /// The user who created the pledge.
  final User? creator;

  /// The user who made the pledge.
  final User? pledger;

  /// The note associated with the pledge.
  final String? note;

  /// The campaign associated with the pledge.
  final Campaign? campaign;

  /// The start date of the pledge (from campaign).
  final DateTime? startDate;

  /// The currency in which the pledge was made.
  final String? currency;

  /// The end date of the pledge (from campaign).
  final DateTime? endDate;
}
