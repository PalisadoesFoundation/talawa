---
id: installation
title: Plugin Installation
slug: /getting-started/installation
sidebar_position: 2
---

# Installing Talawa Plugins

This guide will walk you through the complete process of getting plugins from the repository and installing them in your Talawa system. No technical expertise required!

## Prerequisites

Before you start, make sure you have:

- **Internet Connection**: To download plugins from the repository
- **Browser**: Any modern web browser (Chrome, Firefox, Safari, Edge)
- **Admin Access**: You need to be logged in as an administrator in Talawa-Admin

## Understanding Plugin Distribution

### What's in a Plugin ZIP?

When you download a plugin, you get a ZIP file that contains everything the plugin needs to work:

```
my-plugin.zip
├── 🎨 admin/                 (Admin dashboard components)
├── 📱 mobile/                (Mobile app components)
├── 🔧 api/                   (Backend logic)
└── 📚 README.md              (Plugin documentation)
```

### 🔄 Two Types of Plugin Installation

#### 1. Web Plugins (Admin & API)
These plugins are **uploaded and installed through the admin dashboard**. They add features to:
- Admin Dashboard (new pages, widgets, tools)
- Backend API (new data, webhooks, integrations)

**Installation**: Upload ZIP file → Install → Activate

#### 2. Mobile Plugins (App)
These plugins are **pre-bundled into the mobile app** before it's built. They add features to:
- Mobile app (new screens, widgets, enhanced posts)

**Installation**: Include in build → Download APK → Control via dashboard

---

## Part 1: Getting Plugins from the Repository

### Step 1: Visit the Plugin Repository

1. Open your web browser
2. Go to the **Talawa Plugin Repository** (link provided by your organization)
3. You'll see a gallery of available plugins

### Step 2: Review Plugin Details

Before downloading, check:

- **Description**: What the plugin does
- **Features**: List of capabilities
- **Screenshots**: How it looks in action
- **Requirements**: Any special setup needed

### Step 3: Download the Plugin

1. Click the **Download** button
2. The ZIP file will download to your computer
3. **Important**: Don't unzip the file! Keep it as a ZIP

**File naming**: Plugins are named like `plugin_name.zip`

---

## Part 2: Installing Web Plugins (Admin & API)

### Step 1: Access the Admin Dashboard

1. Open your web browser
2. Navigate to your Talawa-Admin URL
   - Example: `https://admin.yourorg.com`
3. Log in with your administrator credentials

### Step 2: Navigate to Plugin Management

1. Open the **Plugin Store** directly from the left drawer in the admin portal.
2. The Plugin Store is accessible at the route `/pluginstore`.
3. You'll see the plugin management page with:
   - **Installed Plugins**: Plugins already in your system
   - **Available Plugins**: Plugins you can activate
   - **Upload Plugin**: Button to add new plugins

### Step 3: Upload the Plugin

1. Click the **Upload Plugin** button
2. A file picker dialog will appear
3. Navigate to where you downloaded the plugin ZIP
4. Select the ZIP file (don't unzip it!)
5. Review Plugin Information
5. Click **Upload Plugin**

**What happens next**:
- The ZIP is uploaded to your server
- Files are extracted and validated
- Plugin information is displayed

### Step 4: Install the Plugin

1. Click the **Manage** button next to the plugin you want to install.
2. Then click the **Install** button.
3. Installation process begins:
   ```
   Validating plugin files...
   Installing dependencies...
   Setting up database...
   Registering plugin...
   Installation complete!
   ```

**What happens during installation**:
- Plugin files are copied to the correct locations
- Required packages are installed
- Database tables are created (if needed)

### Step 5: Installation Complete

You'll see a success message and the plugin appears in your **Installed Plugins** list with status: **Inactive**

**Note**: Installed doesn't mean active! You need to activate it to use it.

---

## Part 3: Installing Mobile Plugins (Pre-Bundling)

Mobile plugins work differently - they must be included when the app is built.

### For Organization Administrators

**You don't build the app yourself** - contact your technical team or app developer.

**What to tell them**:
1. "I need the [plugin name] included in the next app build"
2. Provide the plugin ZIP file or plugin ID

### For Technical Teams

#### Step 1: Get the Plugin

Download the plugin ZIP from the repository or receive it from your admin.

#### Step 2: Extract to Mobile Plugin Directory

To pre-bundle a mobile plugin:

1. Open the plugin ZIP file and locate the `mobile` folder inside it.
2. Rename the `mobile` folder to match the plugin ID (e.g., `razorpay`, `summarize_t5`, etc.).
3. Place the renamed folder inside `talawa-mobile/lib/plugin/available/`.

For example, your `available/` directory might look like:

```
lib/plugin/available/
   razorpay/
      index.dart
      ...
   summarize_t5/
      index.dart
      widgets/
         summarize_button.dart
   plugin_map/
      index.dart
      ...
```

#### Step 3: Install Dependencies

```bash
# Run the dependency installer script
cd talawa-mobile
python3 lib/plugin/scripts/install_plugin_dependencies.py

# Install Flutter packages
flutter pub get
```

**What this does**:
- Scans all plugins for required packages
- Adds them to `pubspec.yaml`
- Downloads packages

#### Step 4: Register the Plugin

Edit `lib/plugin/available/index.dart`:

```dart
import 'package:talawa/plugin/available/new_plugin/index.dart';

List<TalawaMobilePlugin> getBundledPlugins() => [
  // Existing plugins...
  NewPluginName(),  // Add your plugin here
];
```

#### Step 5: Build the App

```bash
# For Android
flutter build apk

# For iOS  
flutter build ios
```

#### Step 6: Distribute the APK

1. Share the built APK with organization
3. Plugins appear in the app but are **inactive by default**

### Controlling Mobile Plugins


### How Plugin Activation Works

Talawa plugins are unified: each plugin ZIP may contain both web (admin/API) and app (mobile) parts. The admin dashboard is the single source of truth for plugin management.

- If the app part of a plugin is prebundled in the mobile app, installing and activating the plugin from the admin dashboard will automatically enable its mobile features for users.
- There is no separate control for mobile plugins; activation and deactivation is managed centrally via the admin dashboard.
- If a plugin is not installed in the admin dashboard, its mobile features remain inactive, even if prebundled in the app.

This unified approach ensures consistent plugin management and feature rollout across web and mobile platforms.

---

## Installation Troubleshooting

### ❌ "Upload Failed" Error

**Possible causes**:
- File is too large (check server upload limits)
- File is corrupted (re-download the plugin)
- Not a valid ZIP file (ensure you didn't unzip it)

**Solutions**:
1. Check file size (should be under 50MB typically)
2. Re-download from repository
3. Try a different browser
4. Contact your system administrator

### ❌ "Invalid Plugin" Error

**Possible causes**:
- Plugin ZIP is corrupted
- Missing required files (manifest.json)
- Plugin is for wrong Talawa version

**Solutions**:
1. Verify you downloaded the correct version
2. Check plugin compatibility with your Talawa version
3. Re-download the plugin
4. Contact plugin author if issue persists

### ❌ "Installation Failed" Error

**Possible causes**:
- Missing dependencies
- Database connection issues
- Permission problems
- Conflicting plugins

**Solutions**:
1. Check error message details
2. Ensure your server has internet access (for dependencies)
3. Verify database is working
4. Try disabling other plugins temporarily

### ❌ Mobile Plugin Not Appearing

**Possible causes**:
- Plugin not added to `getBundledPlugins()`
- App not rebuilt after adding plugin
- Using old APK

**Solutions**:
1. Verify plugin is in `available/index.dart`
2. Rebuild the mobile app
3. Distribute the new APK
4. Check users have latest version

---

## Next Steps

Now that your plugin is installed, you're ready to activate and use it!

**[Continue to Usage Guide →](./usage)**

Learn how to:
- ✅ Activate plugins
- ✅ Configure plugin settings  
- ✅ Use plugin features
- ✅ Deactivate when needed
- ✅ Uninstall completely

---

## Need Help?

### Common Questions

**Q: Can I install multiple plugins at once?**  
A: You need to upload and install plugins one at a time, but you can activate multiple plugins simultaneously.

**Q: Do I need to restart anything after installation?**  
A: For web/admin features, plugins are ready to activate immediately after installation. For mobile features, if the app part is prebundled, users may need to reopen the app to see new plugin features.

**Q: What happens to plugin data if I uninstall?**  
A: Most plugins remove their data on uninstall, but check the plugin documentation to be sure.

**Q: Can mobile plugins be installed without rebuilding the app?**  
A: No, mobile plugins must be bundled during the app build process. However, you can activate/deactivate them remotely via the admin dashboard.

### Get Support

- [Ask in the community forum](https://community.talawa.io)
- [Report installation issues](https://github.com/PalisadoesFoundation/talawa/issues)
- Contact your organization's technical team
