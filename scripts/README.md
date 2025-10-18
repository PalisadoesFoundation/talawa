# Plugin Dependency Management

Scripts for managing plugin dependencies in Talawa Mobile.

## Quick Start

```bash
# Install plugin dependencies
python3 plugin/scripts/install_plugin_dependencies.py

# Get Flutter packages
flutter pub get
```

## How It Works

1. Each plugin declares dependencies in `lib/plugin/available/<plugin>/plugin.yaml`
2. Script scans all plugin.yaml files
3. Dependencies added to `pubspec.yaml` with comments
4. Run `flutter pub get` to download packages

## Example

**Plugin declares:**
```yaml
# lib/plugin/available/razorpay/plugin.yaml
dependencies:
  razorpay_flutter: ^1.3.7
```

**Script adds to pubspec.yaml:**
```yaml
dependencies:
  razorpay_flutter: ^1.3.7  # Added by plugin: razorpay
```

## CI/CD Integration

```yaml
# .github/workflows/build.yml
- name: Install plugin dependencies
  run: python3 scripts/install_plugin_dependencies.py

- name: Get Flutter dependencies
  run: flutter pub get
```

