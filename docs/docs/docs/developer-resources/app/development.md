---
id: app-development
title: App Plugin Development Guide
slug: /developer-resources/app/development
sidebar_position: 2
---

# App Plugin Development Guide

Step-by-step guide to building Flutter plugins for Talawa mobile.

## Development Workflow

```
Setup → Design → Implement → Test → Package
```

## Project Setup

### 1. Create Plugin Directory

```bash
cd talawa/lib/plugins
mkdir event_analytics
cd event_analytics
```

### 2. Create File Structure

```bash
mkdir -p screens widgets services models utils
touch plugin.yaml index.dart README.md
```

### 3. Plugin Configuration

```yaml
# plugin.yaml
name: Event Analytics
pluginId: event_analytics
version: 1.0.0
description: Analytics and insights for organization events
author: Your Name <email@example.com>
homepage: https://github.com/yourname/event-analytics
license: MIT

metadata:
  displayName: Event Analytics
  category: Analytics & Reports
  icon: assets/analytics_icon.png
  screenshots:
    - assets/screenshot1.png
    - assets/screenshot2.png

dependencies:
  fl_chart: ^0.65.0
  intl: ^0.18.0

extensionPoints:
  screens:
    - id: analytics_dashboard
      route: /event-analytics/dashboard
      title: Analytics Dashboard
      
  drawerItems:
    - id: analytics_menu
      label: Event Analytics
      icon: Icons.analytics
      route: /event-analytics/dashboard
      order: 50
      
  injectors:
    - id: event_stats
      location: EVENT_DETAIL_BOTTOM
      widget: EventStatsWidget

permissions:
  - READ_EVENTS
  - READ_USERS
  - READ_ORGANIZATIONS
```

## Step 1: Define Models

### Create Data Models

```dart
// models/analytics_data.dart
class AnalyticsData {
  final int totalEvents;
  final int totalAttendees;
  final double avgAttendance;
  final int activeToday;
  final List<DataPoint> attendance;
  final List<DataPoint> trends;

  const AnalyticsData({
    required this.totalEvents,
    required this.totalAttendees,
    required this.avgAttendance,
    required this.activeToday,
    required this.attendance,
    required this.trends,
  });

  factory AnalyticsData.fromJson(Map<String, dynamic> json) {
    return AnalyticsData(
      totalEvents: json['totalEvents'] as int,
      totalAttendees: json['totalAttendees'] as int,
      avgAttendance: (json['avgAttendance'] as num).toDouble(),
      activeToday: json['activeToday'] as int,
      attendance: (json['attendance'] as List)
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      trends: (json['trends'] as List)
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'totalEvents': totalEvents,
        'totalAttendees': totalAttendees,
        'avgAttendance': avgAttendance,
        'activeToday': activeToday,
        'attendance': attendance.map((e) => e.toJson()).toList(),
        'trends': trends.map((e) => e.toJson()).toList(),
      };
}

class DataPoint {
  final String date;
  final int count;

  const DataPoint({required this.date, required this.count});

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      date: json['date'] as String,
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'count': count,
      };
}
```

## Step 2: Create Service Layer

### GraphQL Service

```dart
// services/analytics_service.dart
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/analytics_data.dart';

class AnalyticsService {
  final GraphQLClient _client;

  AnalyticsService(this._client);

  static const String _getAnalyticsQuery = '''
    query GetAnalytics(\$orgId: ID!, \$timeRange: String!) {
      analytics(orgId: \$orgId, timeRange: \$timeRange) {
        totalEvents
        totalAttendees
        avgAttendance
        activeToday
        attendance {
          date
          count
        }
        trends {
          date
          count
        }
      }
    }
  ''';

  Future<AnalyticsData> getAnalytics(String orgId, String timeRange) async {
    final result = await _client.query(
      QueryOptions(
        document: gql(_getAnalyticsQuery),
        variables: {
          'orgId': orgId,
          'timeRange': timeRange,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw AnalyticsException(
        'Failed to fetch analytics: ${result.exception}',
      );
    }

    if (result.data == null || result.data!['analytics'] == null) {
      throw AnalyticsException('No analytics data available');
    }

    return AnalyticsData.fromJson(
      result.data!['analytics'] as Map<String, dynamic>,
    );
  }

  static const String _exportReportMutation = '''
    mutation ExportAnalyticsReport(\$input: ExportReportInput!) {
      exportAnalyticsReport(input: \$input) {
        id
        downloadUrl
        expiresAt
      }
    }
  ''';

  Future<Map<String, dynamic>> exportReport({
    required String orgId,
    required String format,
    required String timeRange,
  }) async {
    final result = await _client.mutate(
      MutationOptions(
        document: gql(_exportReportMutation),
        variables: {
          'input': {
            'orgId': orgId,
            'format': format,
            'timeRange': timeRange,
          },
        },
      ),
    );

    if (result.hasException) {
      throw AnalyticsException(
        'Failed to export report: ${result.exception}',
      );
    }

    return result.data!['exportAnalyticsReport'] as Map<String, dynamic>;
  }
}

class AnalyticsException implements Exception {
  final String message;
  AnalyticsException(this.message);

  @override
  String toString() => message;
}
```

### Local Cache Service

```dart
// services/analytics_cache.dart
import 'package:hive_flutter/hive_flutter.dart';
import '../models/analytics_data.dart';

class AnalyticsCache {
  static const String _boxName = 'analytics_cache';
  late Box<Map> _box;

  Future<void> init() async {
    _box = await Hive.openBox<Map>(_boxName);
  }

  String _cacheKey(String orgId, String timeRange) {
    return '${orgId}_$timeRange';
  }

  Future<void> cacheAnalytics(
    String orgId,
    String timeRange,
    AnalyticsData data,
  ) async {
    final key = _cacheKey(orgId, timeRange);
    await _box.put(key, {
      'data': data.toJson(),
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  AnalyticsData? getCachedAnalytics(String orgId, String timeRange) {
    final key = _cacheKey(orgId, timeRange);
    final cached = _box.get(key);

    if (cached == null) return null;

    // Check if cache is still valid (e.g., 5 minutes)
    final timestamp = DateTime.parse(cached['timestamp'] as String);
    final age = DateTime.now().difference(timestamp);
    
    if (age.inMinutes > 5) {
      _box.delete(key);
      return null;
    }

    return AnalyticsData.fromJson(
      cached['data'] as Map<String, dynamic>,
    );
  }

  Future<void> clearCache() async {
    await _box.clear();
  }
}
```

## Step 3: State Management

### Provider Setup

```dart
// services/analytics_provider.dart
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../models/analytics_data.dart';
import 'analytics_service.dart';
import 'analytics_cache.dart';

class AnalyticsProvider with ChangeNotifier {
  final AnalyticsService _service;
  final AnalyticsCache _cache;

  AnalyticsProvider(GraphQLClient client)
      : _service = AnalyticsService(client),
        _cache = AnalyticsCache();

  AnalyticsData? _data;
  bool _isLoading = false;
  String? _error;
  String _currentTimeRange = 'week';

  AnalyticsData? get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get currentTimeRange => _currentTimeRange;

  Future<void> init() async {
    await _cache.init();
  }

  Future<void> loadAnalytics(String orgId, {String? timeRange}) async {
    final range = timeRange ?? _currentTimeRange;
    _currentTimeRange = range;

    // Try cache first
    final cached = _cache.getCachedAnalytics(orgId, range);
    if (cached != null) {
      _data = cached;
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _data = await _service.getAnalytics(orgId, range);
      await _cache.cacheAnalytics(orgId, range, _data!);
    } catch (e) {
      _error = e.toString();
      _data = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh(String orgId) async {
    await _cache.clearCache();
    await loadAnalytics(orgId);
  }

  Future<Map<String, dynamic>> exportReport({
    required String orgId,
    required String format,
  }) async {
    try {
      return await _service.exportReport(
        orgId: orgId,
        format: format,
        timeRange: _currentTimeRange,
      );
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }

  void setTimeRange(String range) {
    _currentTimeRange = range;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
```

## Step 4: Build UI Components

### Main Dashboard Screen

```dart
// screens/analytics_dashboard.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/analytics_provider.dart';
import '../widgets/stats_grid.dart';
import '../widgets/analytics_chart.dart';
import '../widgets/time_range_selector.dart';

class AnalyticsDashboard extends StatefulWidget {
  const AnalyticsDashboard({Key? key}) : super(key: key);

  @override
  State<AnalyticsDashboard> createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  late String _orgId;

  @override
  void initState() {
    super.initState();
    _orgId = _getCurrentOrgId();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnalyticsProvider>().loadAnalytics(_orgId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Analytics'),
        actions: [
          TimeRangeSelector(
            onChanged: (range) {
              context.read<AnalyticsProvider>().loadAnalytics(
                    _orgId,
                    timeRange: range,
                  );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<AnalyticsProvider>().refresh(_orgId);
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'export_pdf',
                child: Text('Export PDF'),
              ),
              const PopupMenuItem(
                value: 'export_csv',
                child: Text('Export CSV'),
              ),
            ],
            onSelected: _handleExport,
          ),
        ],
      ),
      body: Consumer<AnalyticsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return _buildErrorView(provider.error!);
          }

          if (provider.data == null) {
            return const Center(child: Text('No data available'));
          }

          return RefreshIndicator(
            onRefresh: () => provider.refresh(_orgId),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stats grid
                  StatsGrid(data: provider.data!),
                  const SizedBox(height: 24),

                  // Attendance chart
                  _buildChartSection(
                    'Event Attendance',
                    AnalyticsChart(
                      data: provider.data!.attendance,
                      type: ChartType.line,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Trends chart
                  _buildChartSection(
                    'Registration Trends',
                    AnalyticsChart(
                      data: provider.data!.trends,
                      type: ChartType.bar,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChartSection(String title, Widget chart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: chart,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorView(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading analytics',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              error,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<AnalyticsProvider>().clearError();
              context.read<AnalyticsProvider>().loadAnalytics(_orgId);
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleExport(String value) async {
    final format = value.split('_').last; // 'pdf' or 'csv'
    
    try {
      final result = await context.read<AnalyticsProvider>().exportReport(
            orgId: _orgId,
            format: format,
          );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Report exported successfully'),
          action: SnackBarAction(
            label: 'Download',
            onPressed: () {
              // Open download URL
              _openUrl(result['downloadUrl'] as String);
            },
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Export failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _getCurrentOrgId() {
    // Get from app state/context
    return 'org_123';
  }

  void _openUrl(String url) {
    // Implementation
  }
}
```

### Reusable Widgets

```dart
// widgets/stats_grid.dart
import 'package:flutter/material.dart';
import '../models/analytics_data.dart';
import 'stat_card.dart';

class StatsGrid extends StatelessWidget {
  final AnalyticsData data;

  const StatsGrid({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.3,
      children: [
        StatCard(
          title: 'Total Events',
          value: data.totalEvents.toString(),
          icon: Icons.event,
          color: Colors.blue,
        ),
        StatCard(
          title: 'Total Attendees',
          value: data.totalAttendees.toString(),
          icon: Icons.people,
          color: Colors.green,
        ),
        StatCard(
          title: 'Avg Attendance',
          value: '${data.avgAttendance.toStringAsFixed(1)}%',
          icon: Icons.trending_up,
          color: Colors.orange,
        ),
        StatCard(
          title: 'Active Today',
          value: data.activeToday.toString(),
          icon: Icons.today,
          color: Colors.purple,
        ),
      ],
    );
  }
}
```

```dart
// widgets/stat_card.dart
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
```

```dart
// widgets/analytics_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/analytics_data.dart';

enum ChartType { line, bar }

class AnalyticsChart extends StatelessWidget {
  final List<DataPoint> data;
  final ChartType type;

  const AnalyticsChart({
    Key? key,
    required this.data,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == ChartType.line
        ? _buildLineChart(context)
        : _buildBarChart(context);
  }

  Widget _buildLineChart(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: data.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.count.toDouble());
            }).toList(),
            isCurved: true,
            color: Theme.of(context).colorScheme.primary,
            barWidth: 3,
            dotData: FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(BuildContext context) {
    return BarChart(
      BarChartData(
        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: true),
        barGroups: data.asMap().entries.map((e) {
          return BarChartGroupData(
            x: e.key,
            barRods: [
              BarChartRodData(
                toY: e.value.count.toDouble(),
                color: Theme.of(context).colorScheme.secondary,
                width: 16,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
```

## Step 5: Plugin Entry Point

```dart
// index.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/plugin_system/plugin_interface.dart';

import 'screens/analytics_dashboard.dart';
import 'services/analytics_provider.dart';

class EventAnalyticsPlugin implements TalawaMobilePlugin {
  @override
  String get pluginId => 'event_analytics';

  @override
  String get name => 'Event Analytics';

  @override
  String get version => '1.0.0';

  @override
  Future<void> onInstall() async {
    print('[Event Analytics] Plugin installed');
  }

  @override
  Future<void> onActivate() async {
    print('[Event Analytics] Plugin activated');
    
    // Initialize provider
    final client = GraphQLProvider.of(navigatorKey.currentContext!).value;
    final provider = AnalyticsProvider(client);
    await provider.init();
  }

  @override
  Future<void> onDeactivate() async {
    print('[Event Analytics] Plugin deactivated');
  }

  @override
  Future<void> onUninstall() async {
    print('[Event Analytics] Plugin uninstalled');
  }

  @override
  Map<String, WidgetBuilder> get routes => {
        '/event-analytics/dashboard': (context) {
          final client = GraphQLProvider.of(context).value;
          return ChangeNotifierProvider(
            create: (_) => AnalyticsProvider(client)..init(),
            child: const AnalyticsDashboard(),
          );
        },
      };

  @override
  List<DrawerMenuItem> get drawerItems => [
        DrawerMenuItem(
          id: 'analytics_menu',
          label: 'Event Analytics',
          icon: Icons.analytics,
          route: '/event-analytics/dashboard',
          order: 50,
        ),
      ];

  @override
  Map<String, WidgetBuilder> get extensions => {};
}

final eventAnalyticsPlugin = EventAnalyticsPlugin();
```

## Step 6: Testing

See [Testing Guide] for comprehensive testing strategies.

## Step 7: Package Plugin

### Create README

```markdown
# Event Analytics Plugin

Advanced analytics and insights for Talawa organization events.

## Features

- Event attendance tracking
- Registration trends
- Performance metrics
- Export reports (PDF/CSV)

## Installation

This plugin is bundled with Talawa mobile app.

## Usage

1. Navigate to **Event Analytics** from the main menu
2. View analytics for your organization
3. Switch time ranges (week/month/year)
4. Export reports as needed

## Requirements

- Talawa Mobile v3.0.0+
- Permissions: READ_EVENTS, READ_USERS, READ_ORGANIZATIONS

## License

MIT
```

## Best Practices

### Performance

```dart
// Use const constructors
const StatCard(...);

// Memoize expensive computations
final processedData = useMemoized(() => process(data), [data]);

// Lazy load screens
late final screen = AnalyticsDashboard();
```

### Error Handling

```dart
// Comprehensive error handling
try {
  await provider.loadAnalytics(orgId);
} on AnalyticsException catch (e) {
  showErrorSnackbar(e.message);
} on NetworkException catch (e) {
  showNetworkError();
} catch (e) {
  showGenericError();
}
```

### Accessibility

```dart
// Add semantics
Semantics(
  label: 'Total events: ${data.totalEvents}',
  child: StatCard(...),
)
```

## Next Steps

- **[Testing Guide](https://docs-mobile.talawa.io/docs/docs/flutter-testing)**: Write comprehensive tests

## Resources

- [Flutter Best Practices](https://docs.flutter.dev/perf/best-practices)
- [Material Design](https://m3.material.io)
- [Provider Package](https://pub.dev/packages/provider)
