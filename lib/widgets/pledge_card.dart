import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/utils/app_localization.dart';

/// Pledge card.
class PledgeCard extends StatelessWidget {
  const PledgeCard({
    super.key,
    required this.pledge,
    required this.onUpdate,
    required this.onDelete,
  });

  /// Instance of the pledge to be displayed.
  final Pledge pledge;

  /// Update callback function.
  final VoidCallback onUpdate;

  /// Delete callback function.
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color.fromARGB(255, 21, 99, 25),
              Colors.green.shade300,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.strictTranslate('Pledge'),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 36, 36, 36),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (pledge.pledger != null)
                    Chip(
                      avatar: CircleAvatar(
                        backgroundImage: pledge.pledger?.image != null
                            ? NetworkImage(pledge.pledger!.image!)
                            : null,
                        backgroundColor: pledge.pledger?.image == null
                            ? Colors.blue
                            : Colors.transparent,
                        child: pledge.pledger!.image == null
                            ? const Icon(
                                Icons.person_3,
                                size: 18,
                              )
                            : null,
                      ),
                      label: Text(
                        pledge.pledger?.name ??
                            AppLocalizations.of(context)!
                                .strictTranslate('Unknown Pledger'),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.strictTranslate('Note'),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        pledge.note ??
                            AppLocalizations.of(context)!
                                .strictTranslate('No note provided'),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Pledged'),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '${pledge.currency ?? 'USD'} ${pledge.amount?.toStringAsFixed(2) ?? '0.00'}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.green),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Donated'),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '${pledge.currency ?? 'USD'} 0.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${AppLocalizations.of(context)!.strictTranslate('Creator')}: ${pledge.creator?.name ?? AppLocalizations.of(context)!.strictTranslate('Unknown Creator')}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Start Date'),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            formatDate(pledge.startDate),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('End Date'),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            formatDate(pledge.endDate),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (pledge.pledger?.id != null &&
                      pledge.pledger?.id == userConfig.currentUser.id)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          icon: const Icon(Icons.edit),
                          label: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Update'),
                          ),
                          onPressed: onUpdate,
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          icon: const Icon(Icons.delete),
                          label: Text(
                            AppLocalizations.of(context)!
                                .strictTranslate('Delete'),
                          ),
                          onPressed: onDelete,
                          style:
                              TextButton.styleFrom(foregroundColor: Colors.red),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Date Formatter.
  ///
  /// **params**:
  /// * `date`: The date to be formatted.
  ///
  /// **returns**:
  /// * `String`: The formatted date string or 'N/A' if the data value is null.
  String formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('MMM d, y').format(date);
  }
}
