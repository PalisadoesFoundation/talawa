import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/funds/fund_pledges.dart';

/// a_line_ending_with_end_punctuation.
class PledgeCard extends StatelessWidget {
  const PledgeCard({
    super.key,
    required this.pledge,
    required this.onUpdate,
    required this.onDelete,
  });

  /// a_line_ending_with_end_punctuation.
  final Pledge pledge;

  /// a_line_ending_with_end_punctuation.
  final VoidCallback onUpdate;

  /// a_line_ending_with_end_punctuation.
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
                    'Pledge',
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
                  Text(
                    'Pledger',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // Since only one user can pledge per pledge now
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
                        pledge.pledger?.name ?? 'Unknown Pledger',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        pledge.note ?? 'No note provided',
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
                            'Pledged',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '${pledge.currency ?? 'USD'} ${pledge.amount!.toStringAsFixed(2)}',
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
                            'Donated',
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
                    'Creator: ${pledge.creator?.name ?? 'Unknown Creator'}',
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
                            'Start Date',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            _formatDate(pledge.startDate),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'End Date',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            _formatDate(pledge.endDate),
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
                          label: const Text('Update'),
                          onPressed: onUpdate,
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'),
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

  /// a_line_ending_with_end_punctuation.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `date`: define_the_param
  ///
  /// **returns**:
  /// * `String`: define_the_return
  String _formatDate(DateTime? date) {
    if (date == null) return 'N/A';
    return DateFormat('MMM d, y').format(date);
  }
}
