#!/usr/bin/env python3
"""Talawa Mobile - Plugin Dependency Installer.

This script scans all bundled plugins and installs their dependencies
into the main pubspec.yaml file before building the app.

Usage:
    python3 scripts/install_plugin_dependencies.py
"""

import os
import sys
import yaml
import re
from pathlib import Path


# ANSI color codes for terminal output
class Colors:
    """ANSI color codes for terminal formatting."""

    HEADER = "\033[95m"
    OKBLUE = "\033[94m"
    OKCYAN = "\033[96m"
    OKGREEN = "\033[92m"
    WARNING = "\033[93m"
    FAIL = "\033[91m"
    ENDC = "\033[0m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"


def print_header(text):
    """Print a formatted header with borders."""
    print(f"\n{Colors.HEADER}{Colors.BOLD}{'=' * 60}{Colors.ENDC}")
    print(f"{Colors.HEADER}{Colors.BOLD}{text.center(60)}{Colors.ENDC}")
    print(f"{Colors.HEADER}{Colors.BOLD}{'=' * 60}{Colors.ENDC}\n")


def print_success(text):
    """Print a success message with checkmark icon."""
    print(f"{Colors.OKGREEN}✓{Colors.ENDC} {text}")


def print_info(text):
    """Print an informational message with info icon."""
    print(f"{Colors.OKBLUE}ℹ{Colors.ENDC} {text}")


def print_warning(text):
    """Print a warning message with warning icon."""
    print(f"{Colors.WARNING}⚠{Colors.ENDC} {text}")


def print_error(text):
    """Print an error message with error icon."""
    print(f"{Colors.FAIL}✗{Colors.ENDC} {text}")


def get_project_root():
    """Get the project root directory."""
    script_dir = Path(__file__).parent.absolute()
    return script_dir.parent


def find_plugin_configs():
    """Find all plugin.yaml files in the plugins directory."""
    project_root = get_project_root()
    plugins_dir = project_root / "lib" / "plugin" / "available"

    plugin_configs = []

    if not plugins_dir.exists():
        print_error(f"Plugins directory not found: {plugins_dir}")
        return plugin_configs

    for plugin_dir in plugins_dir.iterdir():
        if plugin_dir.is_dir():
            config_file = plugin_dir / "plugin.yaml"
            if config_file.exists():
                plugin_configs.append(config_file)

    return plugin_configs


def read_yaml(file_path):
    """Read and parse YAML file."""
    try:
        with open(file_path, "r") as f:
            return yaml.safe_load(f)
    except Exception as e:
        print_error(f"Error reading {file_path}: {e}")
        return None


def collect_plugin_dependencies():
    """Collect all dependencies from plugin configurations."""
    print_header("Scanning Plugin Dependencies")

    plugin_configs = find_plugin_configs()

    if not plugin_configs:
        print_warning("No plugin configurations found")
        return {}

    all_dependencies = {}

    for config_file in plugin_configs:
        config = read_yaml(config_file)
        if not config:
            continue

        plugin_id = config.get("id", "unknown")
        plugin_name = config.get("name", plugin_id)
        dependencies = config.get("dependencies", {})

        if dependencies:
            print_info(
                f"Plugin: {Colors.BOLD}{plugin_name}{Colors.ENDC} ({plugin_id})"
            )
            for dep_name, dep_version in dependencies.items():
                print(f"  • {dep_name}: {dep_version}")
                all_dependencies[dep_name] = dep_version
        else:
            plugin_info = (
                f"Plugin: {Colors.BOLD}{plugin_name}{Colors.ENDC} "
                f"({plugin_id}) - No dependencies"
            )
            print_info(plugin_info)

    return all_dependencies


def update_pubspec(dependencies):
    """Update pubspec.yaml with plugin dependencies."""
    print_header("Updating pubspec.yaml")

    if not dependencies:
        print_info("No plugin dependencies to install")
        return True

    project_root = get_project_root()
    pubspec_path = project_root / "pubspec.yaml"

    if not pubspec_path.exists():
        print_error(f"pubspec.yaml not found at {pubspec_path}")
        return False

    try:
        # Read pubspec.yaml
        with open(pubspec_path, "r") as f:
            content = f.read()

        # Parse YAML
        pubspec = yaml.safe_load(content)

        if "dependencies" not in pubspec:
            print_error("No dependencies section found in pubspec.yaml")
            return False

        # Track changes
        added = []
        updated = []
        skipped = []

        for dep_name, dep_version in dependencies.items():
            if dep_name in pubspec["dependencies"]:
                existing_version = pubspec["dependencies"][dep_name]
                if existing_version != dep_version:
                    pubspec["dependencies"][dep_name] = dep_version
                    updated.append(
                        f"{dep_name}: {existing_version} → {dep_version}"
                    )
                else:
                    skipped.append(f"{dep_name}: {dep_version}")
            else:
                pubspec["dependencies"][dep_name] = dep_version
                added.append(f"{dep_name}: {dep_version}")

        # Write back to pubspec.yaml with preserved formatting
        # We need to insert dependencies manually to preserve comments
        # and formatting
        lines = content.split("\n")
        new_lines = []
        in_dependencies = False
        dependencies_inserted = set()

        for line in lines:
            new_lines.append(line)

            # Check if we're in the dependencies section
            if line.strip().startswith("dependencies:"):
                in_dependencies = True
            elif (
                in_dependencies
                and line
                and not line[0].isspace()
                and ":" in line
            ):
                # We've exited the dependencies section
                in_dependencies = False

            # Insert new dependencies at the end of the dependencies section
            if in_dependencies:
                # Check if this line is a dependency
                stripped = line.strip()
                if (
                    stripped
                    and not stripped.startswith("#")
                    and ":" in stripped
                ):
                    dep_key = stripped.split(":")[0].strip()
                    dependencies_inserted.add(dep_key)

        # Find the right place to insert new dependencies
        insert_index = None
        for i, line in enumerate(new_lines):
            if line.strip().startswith("dependencies:"):
                # Find the last dependency line
                for j in range(i + 1, len(new_lines)):
                    if new_lines[j] and not new_lines[j][0].isspace():
                        insert_index = j
                        break
                    elif new_lines[j].strip() and not new_lines[
                        j
                    ].strip().startswith("#"):
                        insert_index = j + 1
                break

        # Insert new dependencies
        if insert_index is not None:
            for dep_name, dep_version in dependencies.items():
                if dep_name not in dependencies_inserted:
                    plugin_id = get_plugin_for_dependency(dep_name)
                    comment = f"  # Added by plugin: {plugin_id}"
                    new_line = f"  {dep_name}: {dep_version}{comment}"
                    new_lines.insert(insert_index, new_line)
                    insert_index += 1

        # Write updated content
        with open(pubspec_path, "w") as f:
            f.write("\n".join(new_lines))

        # Print summary
        if added:
            print_success(f"Added {len(added)} dependencies:")
            for item in added:
                print(f"  + {item}")

        if updated:
            print_success(f"Updated {len(updated)} dependencies:")
            for item in updated:
                print(f"  ↑ {item}")

        if skipped:
            print_info(f"Skipped {len(skipped)} existing dependencies:")
            for item in skipped:
                print(f"  = {item}")

        return True

    except Exception as e:
        print_error(f"Error updating pubspec.yaml: {e}")
        import traceback

        traceback.print_exc()
        return False


def get_plugin_for_dependency(dep_name):
    """Find which plugin requires this dependency."""
    plugin_configs = find_plugin_configs()
    for config_file in plugin_configs:
        config = read_yaml(config_file)
        if config and dep_name in config.get("dependencies", {}):
            return config.get("id", "unknown")
    return "unknown"


def main():
    """Execute the main plugin dependency installation process."""
    print_header("Talawa Mobile - Plugin Dependency Installer")

    # Collect dependencies from all plugins
    dependencies = collect_plugin_dependencies()

    # Update pubspec.yaml
    if update_pubspec(dependencies):
        print_header("Installation Complete")
        print_success("Plugin dependencies have been installed successfully!")
        print_info("Run 'flutter pub get' to download the packages")
        return 0
    else:
        print_header("Installation Failed")
        print_error("Failed to install plugin dependencies")
        return 1


if __name__ == "__main__":
    sys.exit(main())
