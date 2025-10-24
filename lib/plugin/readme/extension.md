## Integration Points

### App Initialization

```dart
// In main.dart or app initialization
import 'package:talawa/plugin/index.dart';
import 'package:talawa/plugin/available/index.dart';

Future<void> initializeApp() async {
  // Fetch active plugins from backend
  final activePlugins = await graphQLService.getActivePlugins();
  
  // Initialize plugin system
  PluginManager.instance.initialize(
    getBundledPlugins(),
    active: activePlugins,
  );
}
```

### Route Registration

```dart
// In MaterialApp
import 'package:talawa/plugin/index.dart';

MaterialApp(
  routes: {
    '/': (context) => HomeScreen(),
    '/menu': (context) => MenuScreen(),
    // Add plugin routes
    ...buildPluginRoutes(),
  },
)
```

### Menu Page Integration

```dart
// In menu screen
import 'package:talawa/plugin/index.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pluginMenuItems = PluginManager.instance.getMenuItems(context);
    
    return ListView(
      children: [
        // Regular menu items
        ...regularMenuItems,
        
        // Plugin section
        if (pluginMenuItems.isNotEmpty) ...[
          Divider(),
          ListTile(
            title: Text('Plugins', 
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          // Render plugin menu items
          ...pluginMenuItems.map((item) => ListTile(
            leading: Icon(item.icon),
            title: Text(item.title),
            subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
            onTap: () => Navigator.pushNamed(context, item.routeName),
          )),
        ],
        
        // Plugin injectors (G1)
        PluginInjector(injectorType: InjectorType.G1),
      ],
    );
  }
}
```

### Post Content Integration

```dart
// In post widget
import 'package:talawa/plugin/index.dart';

class PostCard extends StatelessWidget {
  final Post post;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Post header
          PostHeader(post: post),
          
          // Post content
          PostContent(post: post),
          
          // Plugin injectors (G2) - inject below post content
          PluginInjector(
            injectorType: InjectorType.G2,
            data: {
              'postId': post.id,
              'content': post.content,
              'author': post.author,
              'likes': post.likes,
            },
          ),
          
          // Post actions
          PostActions(post: post),
        ],
      ),
    );
  }
}
```

---

## Best Practices

### For Plugin Developers

1. **Keep It Lightweight** - Mobile apps need to be performant
2. **Handle Errors Gracefully** - Don't crash the host app
3. **Use Async Wisely** - Don't block the UI thread
4. **Follow Material Design** - Consistent with app UI
5. **Test Thoroughly** - Test on different devices and screen sizes
6. **Declare Dependencies** - Always use `plugin.yaml` for packages
7. **Document Well** - Add comments and documentation

### For System Integrators

1. **Initialize Early** - Before building UI
2. **Handle Loading States** - Show loading indicators during initialization
3. **Check Initialization** - Use `isInitialized` before accessing plugins
4. **Error Boundaries** - Wrap plugin widgets in error handlers
5. **Test Plugin Combinations** - Test with different plugin combinations active

### For Administrators

1. **Database Control** - Manage plugin activation via backend
2. **Test Before Bundling** - Validate plugins before including in build
3. **Monitor Dependencies** - Keep plugin dependencies up to date
4. **Version Compatibility** - Ensure plugins work with current app version
5. **Security Review** - Review plugin code for security issues

---

## Injector System

### Available Injection Points

#### G1 - Menu Page Injectors
**Location**: Menu screen, under "Plugins" section

**Use Cases**:
- Quick action buttons
- Custom menu items
- Shortcut widgets
- Information cards

**Example**:
```dart
PluginInjectorExtension(
  pluginId: 'my_plugin',
  name: 'Quick Access',
  builder: (context, {data}) => Card(
    child: ListTile(
      leading: Icon(Icons.flash_on),
      title: Text('Quick Action'),
      onTap: () => performQuickAction(),
    ),
  ),
)
```

#### G2 - Post Content Injectors
**Location**: Post cards, below post caption/content

**Use Cases**:
- AI-powered summaries
- Sentiment analysis
- Translation widgets
- Related content suggestions
- Custom reactions

**Example**:
```dart
PluginInjectorExtension(
  pluginId: 'summarize_t5',
  name: 'AI Summary',
  builder: (context, {data}) {
    final content = data?['content'] as String?;
    if (content == null || content.length < 100) {
      return SizedBox.shrink();
    }
    return SummaryWidget(content: content);
  },
  order: 1,
)
```

---

