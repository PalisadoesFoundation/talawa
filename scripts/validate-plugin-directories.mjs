#!/usr/bin/env node
/**
 * Validates that plugin directory names follow camelCase convention
 * and that test directories match plugin directories exactly.
 *
 * This script ensures:
 * 1. All plugin directories in plugins/ are camelCase
 * 2. Each plugin has a matching test directory in test/plugins/
 * 3. Directory names match exactly between plugins/ and test/plugins/
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const rootDir = path.resolve(__dirname, '..');

const PLUGINS_DIR = path.join(rootDir, 'plugins');
const TEST_PLUGINS_DIR = path.join(rootDir, 'test', 'plugins');

/**
 * Check if a string is in camelCase
 * @param {string} str - String to check
 * @returns {boolean} - True if camelCase, false otherwise
 */
function isCamelCase(str) {
    // camelCase should:
    // - Start with lowercase letter
    // - Only contain letters and numbers
    const camelCaseRegex = /^[a-z][a-zA-Z0-9]*$/;

    return camelCaseRegex.test(str);
}

/**
 * Get all directories in a given path
 * @param {string} dirPath - Path to search
 * @returns {string[]} - Array of directory names
 */
function getDirectories(dirPath) {
    if (!fs.existsSync(dirPath)) {
        return [];
    }

    return fs.readdirSync(dirPath, { withFileTypes: true })
        .filter(dirent => dirent.isDirectory())
        .map(dirent => dirent.name)
        .filter(name => !name.startsWith('.') && name !== 'node_modules');
}

/**
 * Main validation function
 */
function validatePluginDirectories() {
    const errors = [];

    console.log('🔍 Validating plugin directory structure...\n');

    // Get plugin directories
    const pluginDirs = getDirectories(PLUGINS_DIR);
    const testPluginDirs = getDirectories(TEST_PLUGINS_DIR);

    if (pluginDirs.length === 0) {
        console.log('⚠️  No plugin directories found in plugins/');
        return true;
    }

    console.log(`Found ${pluginDirs.length} plugin(s): ${pluginDirs.join(', ')}\n`);

    // Validate each plugin directory
    for (const pluginName of pluginDirs) {
        // Check if plugin name is camelCase
        if (!isCamelCase(pluginName)) {
            errors.push(
                `❌ Plugin directory '${pluginName}' is not in camelCase.\n` +
                `   Expected format: camelCase (e.g., 'myPlugin', 'razorpay', 'pluginMap')`
            );
        }

        // Check if matching test directory exists
        if (!testPluginDirs.includes(pluginName)) {
            errors.push(
                `❌ Plugin '${pluginName}' has no matching test directory.\n` +
                `   Expected: test/plugins/${pluginName}/`
            );
        }
    }

    // Check for orphaned test directories
    for (const testDirName of testPluginDirs) {
        if (!pluginDirs.includes(testDirName)) {
            errors.push(
                `❌ Test directory 'test/plugins/${testDirName}/' has no matching plugin.\n` +
                `   Expected: plugins/${testDirName}/`
            );
        }
    }

    // Report results
    if (errors.length > 0) {
        console.error('❌ Plugin directory validation FAILED:\n');
        errors.forEach(error => console.error(error + '\n'));
        console.error(`Total errors: ${errors.length}`);
        process.exit(1);
    } else {
        console.log('✅ All plugin directories are valid!');
        console.log('   - All plugin names are camelCase');
        console.log('   - All plugins have matching test directories');
        console.log('   - Directory names match between plugins/ and test/plugins/');
        return true;
    }
}

// Run validation
validatePluginDirectories();
