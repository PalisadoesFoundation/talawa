#!/bin/bash
# Talawa Mobile - Plugin Dependency Installer (Bash version)
# 
# This script scans all bundled plugins and installs their dependencies
# into the main pubspec.yaml file before building the app.
#
# Usage: ./scripts/install_plugin_dependencies.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory and project root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
PLUGINS_DIR="$PROJECT_ROOT/lib/plugin/available"
PUBSPEC_FILE="$PROJECT_ROOT/pubspec.yaml"
TEMP_FILE="$PROJECT_ROOT/.pubspec_temp.yaml"

echo -e "${BLUE}============================================================${NC}"
echo -e "${BLUE}  Talawa Mobile - Plugin Dependency Installer${NC}"
echo -e "${BLUE}============================================================${NC}\n"

# Check if yq is installed (YAML processor)
if ! command -v yq &> /dev/null; then
    echo -e "${YELLOW}⚠ yq not found. Attempting simple text-based installation...${NC}\n"
    USE_SIMPLE=true
else
    echo -e "${GREEN}✓ Using yq for YAML processing${NC}\n"
    USE_SIMPLE=false
fi

# Function to extract dependencies from plugin.yaml
extract_dependencies() {
    local plugin_dir=$1
    local plugin_yaml="$plugin_dir/plugin.yaml"
    
    if [ ! -f "$plugin_yaml" ]; then
        return
    fi
    
    local plugin_id=$(basename "$plugin_dir")
    
    # Simple grep-based extraction
    if grep -q "^dependencies:" "$plugin_yaml"; then
        echo -e "${BLUE}ℹ Plugin: $plugin_id${NC}"
        
        # Extract dependencies section
        awk '/^dependencies:/,/^[a-z]/' "$plugin_yaml" | \
        grep -E "^  [a-z]" | \
        while read -r line; do
            if [ ! -z "$line" ]; then
                echo "  • $line"
                echo "$line" >> "$TEMP_FILE.deps"
            fi
        done
    else
        echo -e "${BLUE}ℹ Plugin: $plugin_id - No dependencies${NC}"
    fi
}

# Main installation process
echo -e "${BLUE}Scanning Plugin Dependencies...${NC}\n"

# Clean temp file
rm -f "$TEMP_FILE.deps"
touch "$TEMP_FILE.deps"

# Scan all plugin directories
if [ -d "$PLUGINS_DIR" ]; then
    for plugin_dir in "$PLUGINS_DIR"/*; do
        if [ -d "$plugin_dir" ]; then
            extract_dependencies "$plugin_dir"
        fi
    done
else
    echo -e "${RED}✗ Plugins directory not found: $PLUGINS_DIR${NC}"
    exit 1
fi

# Check if any dependencies were found
if [ ! -s "$TEMP_FILE.deps" ]; then
    echo -e "\n${YELLOW}⚠ No plugin dependencies found${NC}"
    rm -f "$TEMP_FILE.deps"
    exit 0
fi

echo -e "\n${BLUE}============================================================${NC}"
echo -e "${BLUE}  Updating pubspec.yaml${NC}"
echo -e "${BLUE}============================================================${NC}\n"

# Add dependencies to pubspec.yaml
# Find the dependencies section and add after it
if [ -f "$PUBSPEC_FILE" ]; then
    # Create backup
    cp "$PUBSPEC_FILE" "$PUBSPEC_FILE.backup"
    
    # Read dependencies from temp file
    while IFS= read -r dep_line; do
        dep_name=$(echo "$dep_line" | cut -d':' -f1 | xargs)
        dep_version=$(echo "$dep_line" | cut -d':' -f2- | xargs)
        
        # Check if dependency already exists
        if grep -q "^  $dep_name:" "$PUBSPEC_FILE"; then
            echo -e "${YELLOW}= $dep_name: $dep_version (already exists)${NC}"
        else
            echo -e "${GREEN}+ $dep_name: $dep_version${NC}"
            
            # Add dependency after the last dependency line before dev_dependencies
            # Find line number of 'dev_dependencies:'
            dev_deps_line=$(grep -n "^dev_dependencies:" "$PUBSPEC_FILE" | cut -d':' -f1)
            
            if [ ! -z "$dev_deps_line" ]; then
                # Insert before dev_dependencies
                sed -i.tmp "${dev_deps_line}i\\
  $dep_name: $dep_version  # Added by plugin system" "$PUBSPEC_FILE"
                rm -f "$PUBSPEC_FILE.tmp"
            else
                # Just append to dependencies section
                # Find the last line that starts with two spaces under dependencies
                awk -v dep="  $dep_name: $dep_version  # Added by plugin system" '
                /^dependencies:/ { in_deps=1; deps_start=NR }
                in_deps && /^[^ ]/ && NR > deps_start { 
                    print dep
                    in_deps=0
                }
                { print }
                END { if(in_deps) print dep }
                ' "$PUBSPEC_FILE" > "$TEMP_FILE"
                mv "$TEMP_FILE" "$PUBSPEC_FILE"
            fi
        fi
    done < "$TEMP_FILE.deps"
    
    echo -e "\n${GREEN}✓ pubspec.yaml updated successfully${NC}"
    echo -e "${BLUE}ℹ Backup saved to: pubspec.yaml.backup${NC}"
else
    echo -e "${RED}✗ pubspec.yaml not found${NC}"
    exit 1
fi

# Cleanup
rm -f "$TEMP_FILE.deps"

echo -e "\n${BLUE}============================================================${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${BLUE}============================================================${NC}\n"
echo -e "${BLUE}ℹ Run 'flutter pub get' to download the packages${NC}\n"
