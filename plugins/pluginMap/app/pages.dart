import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/locator.dart';

/// Documentation page for Plugin Map
class PluginMapDocsPage extends StatelessWidget {
  const PluginMapDocsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin Map Poll')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '- This page itself demonstrates a page extension via plugin route.',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GraphQLProvider(
                client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
                child: const PluginMapApiDemo(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// API Demo widget for Plugin Map
class PluginMapApiDemo extends StatelessWidget {
  const PluginMapApiDemo({Key? key}) : super(key: key);

  static const String logMutation = r'''
    mutation LogPluginMapRequest($input: PluginMapRequestInput!) {
      plugin_map_logPluginMapRequest(input: $input) {
        id
        pollNumber
        userId
        userRole
        organizationId
        extensionPoint
        createdAt
      }
    }
  ''';

  static const String getRequests = r'''
    query GetPluginMapRequests($input: GetPluginMapRequestsInput) {
      plugin_map_getPluginMapRequests(input: $input) {
        requests {
          id
          pollNumber
          userId
          userRole
          organizationId
          extensionPoint
          createdAt
        }
        totalCount
        hasMore
      }
    }
  ''';

  @override
  Widget build(BuildContext context) {
    // We'll scope requests to this extension point label so we can filter the feed
    const String extensionPoint = 'plugin_map_docs_mobile';

    return Query(
      options: QueryOptions(
        document: gql(getRequests),
        variables: {
          'input': {
            'extensionPoint': extensionPoint,
            'userRole': 'user',
            'organizationId': userConfig.currentOrg.id,
            'userId': userConfig.currentUser.id,
          }
        },
        fetchPolicy: FetchPolicy.networkOnly,
      ),
      builder: (queryResult, {refetch, fetchMore}) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mutation(
              options: MutationOptions(
                document: gql(logMutation),
                onCompleted: (data) {
                  // Refresh the feed after logging a request
                  refetch?.call();
                },
              ),
              builder: (runMutation, mutationResult) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.how_to_vote),
                      label: const Text('Send Poll (Log Request)'),
                      onPressed: mutationResult?.isLoading == true
                          ? null
                          : () {
                              runMutation({
                                'input': {
                                  'userId': userConfig.currentUser.id ?? 'unknown-user',
                                  'userRole': 'user',
                                  'organizationId': userConfig.currentOrg.id,
                                  'extensionPoint': extensionPoint,
                                }
                              });
                            },
                    ),
                    if (mutationResult?.isLoading == true)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: LinearProgressIndicator(),
                      ),
                    if (mutationResult?.hasException == true)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Error sending poll: ${mutationResult!.exception}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.red),
                        ),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Recent Requests',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (queryResult.isLoading && queryResult.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (queryResult.hasException) {
                    return Text(
                      'Could not load requests (is the plugin API available?):\n${queryResult.exception}',
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  } else {
                    final requests = (queryResult.data?['plugin_map_getPluginMapRequests']?['requests'] as List<dynamic>? ?? []).take(10).toList();
                    if (requests.isEmpty) {
                      return const Center(child: Text('No requests yet.'));
                    }
                    return ListView.builder(
                      itemCount: requests.length,
                      itemBuilder: (context, idx) {
                        final r = requests[idx];
                        return Card(
                          elevation: 0,
                          child: ListTile(
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                            leading: const Icon(Icons.how_to_vote),
                            title: Text('Poll #${r['pollNumber'] ?? '-'} — ${r['extensionPoint'] ?? ''}'),
                            subtitle: Text(
                              'By ${r['userId'] ?? 'unknown'} at ${r['createdAt'] ?? ''}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
