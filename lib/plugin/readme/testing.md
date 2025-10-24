## Testing

### Unit Tests

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/plugin/index.dart';

void main() {
  group('Plugin Registry', () {
    late PluginRegistry registry;
    
    setUp(() {
      registry = PluginRegistry();
    });
    
    test('registers plugin', () {
      final plugin = TestPlugin();
      registry.register(plugin);
      expect(registry.all.length, 1);
    });
    
    test('collects routes', () {
      final plugin = TestPlugin();
      registry.register(plugin);
      final routes = registry.collectRoutes();
      expect(routes.length, greaterThan(0));
    });
  });
}
```

### Widget Tests

```dart
testWidgets('PluginInjector renders widgets', (tester) async {
  // Initialize plugin manager
  PluginManager.instance.initialize(
    [TestPlugin()],
    active: ['test_plugin'],
  );
  
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: PluginInjector(
          injectorType: InjectorType.G1,
        ),
      ),
    ),
  );
  
  expect(find.byType(PluginInjector), findsOneWidget);
});
```

---

## Troubleshooting

### Plugin Not Appearing

**Symptoms**: Plugin doesn't show up in menu or routes

**Solutions**:
1. Check plugin is in `getBundledPlugins()` list
2. Verify plugin ID is in active list from database
3. Check initialization logs for filtering details
4. Ensure `getRoutes()` and `getMenuItems()` return non-empty lists
5. Verify `PluginManager.instance.initialize()` was called

### Injector Not Rendering

**Symptoms**: Widget injector doesn't appear

**Solutions**:
1. Check plugin is active and registered
2. Verify `getExtensions()` returns injectors for correct type (G1/G2)
3. Check `PluginInjector` is placed in UI at desired location
4. Look for errors in builder function
5. Verify `isInitialized` is true before rendering

### Dependency Conflicts

**Symptoms**: Build fails due to dependency version conflicts

**Solutions**:
1. Check multiple plugins aren't requiring conflicting versions
2. Update plugin `plugin.yaml` with compatible versions
3. Run dependency installer script again
4. Manually resolve in `pubspec.yaml`
5. Use `flutter pub outdated` to check version compatibility

### Routes Not Working

**Symptoms**: Navigation fails or shows error screen

**Solutions**:
1. Verify route name format (should start with `/`)
2. Check `buildPluginRoutes()` is added to MaterialApp routes
3. Ensure builder function returns valid Widget
4. Check for typos in route names
5. Verify context has Navigator

---

## Future Enhancements

- **Plugin Configuration UI**: Settings screen for plugins
- **Plugin Marketplace**: Browse and discover plugins
- **Hot Reload Support**: Update plugins without rebuild
- **Permission System**: Fine-grained plugin permissions
- **Plugin Analytics**: Track plugin usage and performance
- **More Injection Points**: Additional UI locations for injection
- **Plugin Communication**: Inter-plugin messaging
- **Theming Support**: Plugin-specific themes

---

## Contributing

When extending the plugin system:

1. Follow Flutter/Dart best practices
2. Add tests for new features
3. Update type definitions
4. Document new injection points
5. Maintain backward compatibility
6. Consider mobile performance

---

## License

See main project LICENSE file.
