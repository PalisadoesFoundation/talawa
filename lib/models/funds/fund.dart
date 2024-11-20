import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/user/user_info.dart';

/// The `Fund` class represents a fund in the application.
class Fund {
  /// Constructs a `Fund` instance.
  ///
  /// [id] is the unique identifier of the fund.
  /// [organizationId] is the identifier of the organization to which the fund belongs.
  /// [name] is the name of the fund.
  /// [taxDeductible] indicates whether the fund is tax-deductible.
  /// [isDefault] indicates whether the fund is the default fund.
  /// [isArchived] indicates whether the fund is archived.
  /// [creatorId] is the identifier of the user who created the fund.
  /// [campaigns] is a list of campaign identifiers associated with the fund.
  /// [createdAt] is the timestamp of when the fund was created.
  /// [updatedAt] is the timestamp of when the fund was last updated.
  Fund({
    this.id,
    this.organizationId,
    this.name,
    this.taxDeductible,
    this.isDefault,
    this.isArchived,
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
      id: json['_id'] as String?,
      organizationId: json['organizationId'] as String?,
      name: json['name'] as String?,
      taxDeductible: json['taxDeductible'] as bool?,
      isDefault: json['isDefault'] as bool?,
      isArchived: json['isArchived'] as bool?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(
              json['creator'] as Map<String, dynamic>,
              fromOrg: true,
            ),
      campaigns: (json['campaigns'] as List<dynamic>?)
          ?.map((e) => e as Campaign)
          .toList(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  /// The unique identifier of the fund.
  final String? id;

  /// The identifier of the organization to which the fund belongs.
  final String? organizationId;

  /// The name of the fund.
  final String? name;

  /// Indicates whether the fund is tax-deductible.
  final bool? taxDeductible;

  /// Indicates whether the fund is the default fund.
  final bool? isDefault;

  /// Indicates whether the fund is archived.
  final bool? isArchived;

  /// The identifier of the user who created the fund.
  final User? creator;

  /// A list of campaign identifiers associated with the fund.
  final List<Campaign>? campaigns;

  /// The timestamp of when the fund was created.
  final DateTime? createdAt;

  /// The timestamp of when the fund was last updated.
  final DateTime? updatedAt;
}
