---
id: handling-upgrades
title: Handling Upgrades
slug: /developer-resources/handling-upgrades
sidebar_position: 40
---

## Handling Dependencies & SDK Upgrades

Upgrading dependencies in a large Flutter project like Talawa can sometimes be tricky due to "diamond dependency" conflicts. This is often caused by local packages (like `talawa_lint`) having stricter version constraints than the main project.

### The Common Conflict: `talawa_lint` vs SDK

When you try to upgrade the Flutter SDK or main dependencies (like `build_runner`), you might encounter a version solving error related to `analyzer` or `macros`.

**Why this happens:**
1. Newer SDKs/plugins require a newer version of the `analyzer` package (e.g., `> 6.0`).
2. Our local `talawa_lint` package (located in `talawa/talawa_lint`) often has a `pubspec.yaml` that constrains `analyzer` to an older version (e.g., `< 6.0`).
3. Only running `flutter pub upgrade` in the root folder **does not** update the constraints in the sub-package, causing the build to fail.

### How to Fix It

If your upgrade is blocked by `talawa_lint` or similar local packages, follow this workflow:

1.  **Locate the Sub-Package**:
    Go to the `talawa_lint` directory:
    ```bash
    cd talawa_lint
    ```

2.  **Update Constraints**:
    Open `talawa_lint/pubspec.yaml` and broaden the version constraints for conflicting packages (usually `analyzer` or `custom_lint`).
    ```yaml
    dependencies:
      analyzer: ">=5.12.0 <7.0.0" # Example: Increase the upper bound
    ```

3.  **Upgrade Sub-Package**:
    Run upgrade inside the directory to generate a new lockfile for it:
    ```bash
    flutter pub upgrade
    ```

5.  **Handle Stubborn Conflicts (Dependency Overrides)**:
    Sometimes, a package (like `hive_generator`) might still strictly require an older `analyzer` version even after you fix `talawa_lint`. In this case, you may need to force a newer version in the root `pubspec.yaml`:
    ```yaml
    dependency_overrides:
      analyzer: ">=6.0.0 <8.0.0" # Force compatible range
    ```

6.  **Upgrade Main Project**:
    Return to the root directory and attempt the main upgrade again:
    ```bash
    cd ..
    flutter pub upgrade
    ```

### Diagnosing Conflicts

To see exactly which package is causing a version lock, use the verbose flag:

```bash
flutter pub upgrade -v
```

Look for lines indicating that `talawa depends on talawa_lint` which in turn depends on a specific version of `analyzer`.
