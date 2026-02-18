---
id: usage
title: Using Plugins
slug: /getting-started/usage
sidebar_position: 3
---

# Managing and Using Plugins

Once you've installed plugins, you need to know how to manage them effectively. This guide covers everything from activation to uninstallation in simple, non-technical terms.

## Plugin States Explained

Think of plugins like light switches - they can be in different states:

### 🔵 Inactive (Installed but Off)
- **What it means**: Plugin files are in your system but features are not available
- **Like**: Having an app on your phone but not running it
- **Uses**: Keep plugins ready but not active until you need them

### 🟢 Active (Running)
- **What it means**: Plugin is running and all features are available
- **Like**: Having an app open and using it
- **Uses**: The plugin's features are accessible to users

### ⚪ Not Installed
- **What it means**: Plugin is not in your system at all
- **Like**: An app you haven't downloaded yet
- **Uses**: Before you upload/install a plugin

---

## Accessing Plugin Management

### Step 1: Log Into Admin Dashboard

1. Open your web browser
2. Go to your Talawa-Admin URL
3. Log in with administrator credentials

### Step 2: Navigate to Plugins

1. Click **Plugin Store** in the sidebar
2. Select **Manage**
3. You'll see the Plugin Management page

---

## Activating Plugins


Activation enables a plugin's features for all users across web, mobile, and API (if applicable).

### How to Activate a Plugin

1. In the Plugin Management modal, click the **Activate** button next to the desired plugin.
2. The activation process begins:
   - Plugin features are registered
   - Database connections are established
   - Extensions are loaded
   - Services are started
3. Once complete, the button changes to **Deactivate**.
4. New features immediately appear in the appropriate places:
   - Menu items (sidebar, app menu)
   - Widgets (dashboard, app screens)
   - API endpoints and webhooks (if applicable)

#### Where Features Appear

**Admin Dashboard:**
- Sidebar menu items
- New tabs or sections
- Tools in existing pages

**Mobile App:**
- New screens in the app menu
- Additional widgets

**API:**
- New GraphQL data
- Webhooks
- Background services

---

## Using Active Plugins

### Accessing Plugin Features

#### Admin Dashboard

**New Pages/Screens**:
1. Check the sidebar menu for new items
2. Look for plugin-specific sections

**Dashboard Widgets**:
1. New widgets appear on your dashboard
2. Some may need configuration
3. Click to interact or view details

**Tools & Features**:
1. Look for new buttons or options in existing pages
2. Check for new tabs in data views
3. Hover over icons for tooltips

#### Mobile App

**New Menu Items**:
1. Open the app menu
2. Look for "Plugins" section
3. Tap to access plugin features

**Injected Widgets & Components**:
1. Plugin features may appear in any part of the app.
2. Injectors can be used to add widgets, screens, or enhance existing components throughout the app.
3. Examples include new screens, custom widgets, or additional functionality in any UI area.

### Configuring Plugin Settings

Many plugins have settings you can customize.

#### Accessing Settings

1. Go to **Admin Panel** → **Plugin Settings**
2. Find the plugin
3. Adjust settings as needed

#### Common Settings

**API Keys**:
- For plugins that connect to external services
- Example: Payment gateway credentials

**Display Options**:
- How plugin features appear
- Color schemes, layouts

**Permissions**:
- Who can access plugin features
- User role restrictions

**Behavior**:
- How the plugin operates
- Automation settings, triggers

---

## Deactivating Plugins

Deactivation temporarily turns off a plugin without removing it. Think of it as putting an app to sleep.

### How to Deactivate

Deactivation works just like activation and uses the same Plugin Management modal:

1. In the Plugin Management modal, click the **Deactivate** button next to the active plugin.
2. The deactivation process begins:
   - Plugin features are removed from the interface
   - Services are stopped
   - Plugin data is kept intact
3. The button changes back to **Activate**.
4. You can reactivate the plugin at any time using the same modal.

### What Happens When Deactivated

**Immediately**:
- Features disappear from interface
- Menu items are removed
- Widgets stop showing
- Services stop running

**What's Preserved**:
- Plugin files remain installed
- Plugin data is kept
- Settings are saved
- Can reactivate anytime

---

## Uninstalling Plugins

Uninstalling completely removes a plugin from your system. **This is permanent!**

### Before You Uninstall

** Important Considerations**:

1. **Data Loss**: Plugin data will be deleted
2. **Dependencies**: Other features might rely on this plugin
3. **No Undo**: You'll need to reinstall to get it back
4. **Backup**: Consider backing up if you might need the data

### When to Uninstall

- **Never Using**: Plugin serves no purpose
- **Free Space**: Need to reduce server/app size
- **Replacing**: Installing a better alternative
- **Issues**: Plugin is causing persistent problems

### How to Uninstall

#### Step 1: Deactivate First

**Must be deactivated before uninstalling**:
1. If active, click **Deactivate**
2. Wait for deactivation to complete
3. Status changes to **Inactive**

#### Step 2: Click Uninstall

1. Find the inactive plugin
2. Click **Uninstall**
3. A serious warning appears:
   ```
   ⚠️ Uninstall Plugin?
   
   Are you sure you want to uninstall Plugin?
   
   This action will permanently remove the plugin and all its data. This action cannot be undone.
   
   [Cancel] [Uninstall Permanently]
   ```

#### Step 3: Confirm Uninstallation

1. Click **Uninstall Permanently**

#### Step 4: Uninstallation Process

```
⏳ Uninstalling plugin...
⏳ Removing files...
⏳ Dropping database tables...
⏳ Cleaning up connections...
⏳ Removing configuration...
✅ Plugin uninstalled successfully
```

### What Gets Removed

- All plugin files
- Database tables and data
- Settings and configuration
- Menu items and routes
- Background services

### Uninstalling Mobile Plugins

Mobile plugins work differently:

**Can't Fully Remove Without Rebuild**:
- Plugin code is bundled in the app
- Can deactivate to hide features
- Full removal requires rebuilding app

**Recommended Approach**:
1. **Deactivate** the plugin in admin dashboard
2. Features hide from all mobile apps
3. **If you must remove completely**, contact technical team to rebuild app without the plugin

---

## Plugin Management Best Practices

### Activation Strategy

**Start Small**:
- Activate one plugin at a time
- Test thoroughly before adding more
- Ensure each works as expected

**Monitor Performance**:
- Watch app speed after activation
- Check server resource usage
- Disable plugins that slow things down

**User Training**:
- Train users on new features
- Provide documentation
- Announce new plugins to members

---

## Troubleshooting Common Issues

### Plugin Not Working After Activation

**Symptoms**: Activated but features don't appear

**Solutions**:
1. **Refresh**: Hard refresh browser (Ctrl+Shift+R or Cmd+Shift+R)
2. **Clear Cache**: Clear browser cache and cookies
3. **Check Permissions**: Ensure you have rights to access features
4. **Reactivate**: Deactivate, wait 10 seconds, reactivate
5. **Check Logs**: Review error logs in admin dashboard

### Features Disappeared Suddenly

**Symptoms**: Working plugin stops showing features

**Solutions**:
1. **Check Status**: Plugin might have auto-deactivated
2. **Error State**: Look for error indicators
3. **Dependencies**: Check if required services are running
4. **Reactivate**: Try deactivating and reactivating
5. **Contact Support**: If issue persists

### Mobile Plugin Not Syncing

**Symptoms**: Dashboard changes don't reflect in mobile app

**Solutions**:
1. **Wait**: Changes can take 1-2 minutes to sync
2. **Restart App**: Close and reopen mobile app
3. **Check Connection**: Ensure mobile has internet
4. **Verify Activation**: Confirm plugin is active in dashboard
5. **App Version**: Ensure mobile app has the plugin bundled

### Can't Deactivate Plugin

**Symptoms**: Deactivate button doesn't work or errors occur

**Solutions**:
1. **Dependencies**: Another plugin might depend on it
2. **Running Processes**: Wait for background tasks to complete
3. **Force Deactivate**: Contact technical team if stuck
4. **System Restart**: Restart Talawa services (technical team)

### Uninstall Stuck or Failed

**Symptoms**: Uninstall process hangs or shows errors

**Solutions**:
1. **Deactivate First**: Must be inactive before uninstalling
2. **Active Connections**: Close all admin dashboard tabs
3. **Database Lock**: Wait and try again
4. **Manual Cleanup**: Contact technical team for manual removal
5. **Check Logs**: Review error messages for specific issues

---

## Understanding Plugin Impact

### What Happens When You Activate

**Immediately**:
- New features appear
- Services start running

**Behind the Scenes**:
- Plugin code is loaded
- API endpoints are registered
- Webhooks become active
- Background jobs may start

### What Happens When You Deactivate

**Immediately**:
- Features disappear
- Services stop
- Webhooks inactive

**What Stays**:
- Data is preserved
- Settings remain
- Files stay on server

### What Happens When You Uninstall

**Completely Removed**:
- All files deleted
- Data erased
- Settings gone
- Database tables dropped

**Cannot Be Undone**:
- Must reinstall from scratch
- Data cannot be recovered
- Settings must be reconfigured

---

## Plugin Lifecycle Summary

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│  1. NOT INSTALLED                                   │
│     └─► Upload ZIP ──────────────┐                  │
│                                  │                  │
│  2. UPLOADED                     │                  │
│     └─► Install ───────────┐     │                  │
│                            │     │                  │
│  3. INACTIVE (Installed)   │     │                  │
│     ├─► Activate ─────┐    │     │                  │
│     └─► Uninstall ────┘    │     │                  │
│                       │    │     │                  │
│  4. ACTIVE (Running)  │    │     │                  │
│     └─► Deactivate  ──┘    │     │                  │
│                      │     │     │                  │
│  5. UNINSTALLED      │     │     │                  │
│     (Removed) ◄──────┴─────┴─────┘                  │
│                                                     │
└─────────────────────────────────────────────────────┘

Actions:
• Upload → Install: Add plugin to system
• Activate: Enable features
• Deactivate: Disable features (reversible)
• Uninstall: Remove completely (permanent)
```

---

## Need Help?

### Quick Help

**Q: How many plugins can I activate?**  
A: As many as you need! But start with a few and add more gradually.

**Q: Will deactivating a plugin delete my data?**  
A: No! Deactivation keeps all data. Only uninstalling deletes data.

**Q: Do mobile users need to update their app when I activate a plugin?**  
A: Only if the plugin is new and wasn't bundled. Activating/deactivating existing plugins happens instantly.

**Q: How do I know if a plugin is causing problems?**  
A: Deactivate plugins one by one to isolate the issue.

### Get Support

- **Community Forum**: [community.talawa.io](https://community.talawa.io)
- **Email Support**: support@talawa.io
- **Bug Reports**: [GitHub Issues](https://github.com/PalisadoesFoundation/talawa/issues)
- **Documentation**: [docs.talawa.io](https://docs.talawa.io)

---

**Happy plugin managing! 🎉**

Remember: Start small, test thoroughly, and always backup before making major changes.
