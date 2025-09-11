import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';

/// The `Fund` class represents a fund in the application.
class Fund {
  /// Constructs a `Fund` instance.
  ///
  /// [id] is the unique identifier of the fund.
  /// [name] is the name of the fund.
  /// [taxDeductible] indicates whether the fund is tax-deductible.
  /// [campaigns] is a list of campaign identifiers associated with the fund.
  /// [createdAt] is the timestamp of when the fund was created.
  /// [updatedAt] is the timestamp of when the fund was last updated.
  Fund({
    this.id,
    this.name,
    this.taxDeductible,
    this.creator,
    this.campaigns,
    this.createdAt,
    this.updatedAt,
  });

  /// Creates a `Fund` instance from a JSON object.
  ///
  /// The [json] parameter is a map containing the fund data.
  ///
  /// Returns an instance of `Fund`.
  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
      id: json['id'] as String?,
      name: json['name'] as String?,
      taxDeductible: json['isTaxDeductible'] as bool?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(
              json['creator'] as Map<String, dynamic>,
              fromOrg: true,
            ),
      campaigns: (json['campaigns'] as List<dynamic>?)
          ?.map((e) => Campaign.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'] as String)
          : null,
    );
  }

  /// The unique identifier of the fund.
  final String? id;

  /// The name of the fund.
  final String? name;

  /// Indicates whether the fund is tax-deductible.
  final bool? taxDeductible;

  /// The identifier of the user who created the fund.
  final User? creator;

  /// A list of campaigns associated with the fund.
  final List<Campaign>? campaigns;

  /// The timestamp of when the fund was created.
  final DateTime? createdAt;

  /// The timestamp of when the fund was last updated.
  final DateTime? updatedAt;
}
