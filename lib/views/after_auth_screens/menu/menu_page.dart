import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/routing_constants.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/plugin/available/index.dart';
import 'package:talawa/plugin/manager.dart';
import 'package:talawa/plugin/plugin_injector.dart';
import 'package:talawa/plugin/types.dart';
import 'package:talawa/utils/app_localization.dart';

/// MenuPage returns a widget that renders a menu page with vertical stack of links.
class MenuPage extends StatelessWidget {
  const MenuPage({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.maybeOf(context)?.openDrawer(),
        ),
        key: const Key("MenuPageAppBar"),
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Menu'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            key: const Key('settingIcon'),
            onPressed: () {
              navigationService.pushScreen(Routes.appSettings);
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.strictTranslate('Plugins'),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 16),
              _buildPluginSection(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Initialize plugins with activated status from database.
  ///
  /// **params**:
  /// * `context`: Build context
  ///
  /// **returns**:
  /// * `Widget`: Plugin injector section
  Widget _buildPluginSection(BuildContext context) {
    // If already initialized, just show the injector
    if (PluginManager.instance.isInitialized) {
      return const PluginInjector(
        injectorType: InjectorType.g1,
      );
    }

    // Otherwise, fetch from database and initialize
    return GraphQLProvider(
      client: ValueNotifier<GraphQLClient>(graphqlConfig.authClient()),
      child: Query(
        options: QueryOptions(
          document: gql('''
            query GetAllPlugins {
              getPlugins(input: {}) {
                id
                pluginId
                isActivated
                isInstalled
              }
            }
          '''),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
        builder: (
          QueryResult result, {
          VoidCallback? refetch,
          FetchMore? fetchMore,
        }) {
          if (result.isLoading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (result.hasException) {
            // On error, initialize with all bundled plugins (fallback)
            PluginManager.instance.initialize(getBundledPlugins());
            return const PluginInjector(
              injectorType: InjectorType.g1,
            );
          }

          // Extract activated plugin IDs from the response
          final List<String> activePluginIds = [];
          try {
            final List<Map<String, dynamic>> pluginList =
                (result.data?['getPlugins'] as List?)
                        ?.cast<Map<String, dynamic>>() ??
                    <Map<String, dynamic>>[];
            for (final plugin in pluginList) {
              if (plugin['isActivated'] == true) {
                activePluginIds.add(plugin['pluginId'] as String);
              }
            }
          } catch (e) {
            // On parsing error, initialize with all bundled plugins
            PluginManager.instance.initialize(getBundledPlugins());
            return const PluginInjector(
              injectorType: InjectorType.g1,
            );
          }

          // Initialize with filtered active plugins
          PluginManager.instance.initialize(
            getBundledPlugins(),
            active: activePluginIds.isEmpty ? null : activePluginIds,
          );

          return const PluginInjector(
            injectorType: InjectorType.g1,
          );
        },
      ),
    );
  }
}
