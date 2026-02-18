# Plugin Zipper

This script allows you to create zip files of Talawa plugins for distribution.

## Features

- **Plugin Selection**: Choose from available plugins in the `plugins/` directory
- **Build Types**:
  - **Development**: Zips TypeScript files directly (for development/testing)
  - **Production**: Compiles TypeScript to JavaScript before zipping (for deployment)
- **Automatic Detection**: Detects which modules (Admin/API) are present in each plugin
- **Clean Output**: Creates properly structured zip files in the `plugin-zips/` directory

## Usage

```bash
npm run zip-plugin
```

## How it Works

### Development Build

- Scans the selected plugin directory
- Zips all TypeScript (`.ts`, `.tsx`) and non-TypeScript files
- Preserves the original directory structure
- Output: `plugin-zips/{plugin-id}-dev.zip`

### Production Build

1. **Compilation**: Compiles TypeScript files to JavaScript
   - Admin: Uses React JSX compilation settings
   - API: Uses CommonJS module compilation settings
2. **File Processing**: Copies all non-TypeScript files (JSON, MD, assets, etc.)
3. **Zipping**: Creates a zip with compiled JavaScript and other files
4. **Cleanup**: Restores original TypeScript files

- Output: `plugin-zips/{plugin-id}-prod.zip`

## File Structure

The generated zip files maintain the plugin structure:

```
plugin-zips/
└── {plugin-id}-{build-type}.zip
├── admin/           # Admin module (if present)
│   ├── pages/
│   ├── assets/
│   ├── injector/
│   ├── index.js     # Compiled from index.tsx
│   ├── manifest.json
│   └── ...
├── api/             # API module (if present)
│   ├── database/
│   ├── graphql/
│   ├── index.js     # Compiled from index.ts
│   ├── manifest.json
│   └── ...
├── manifest.json    # Plugin-level manifest (if present)
└── README.md        # Plugin README (if present)
```

## Requirements

- Node.js 16+
- TypeScript compiler (`npx tsc`)
- `archiver` package (automatically installed)

## Plugin ID Resolution

The script determines the plugin ID for zip naming by checking manifest files in this order:

1. Plugin-level `manifest.json` (if exists)
2. Admin module `manifest.json` (if exists)
3. API module `manifest.json` (if exists)
4. Falls back to plugin directory name if no `pluginId` found in manifests

## Notes

- Production builds temporarily replace TypeScript files with compiled JavaScript
- Original files are restored after zipping
- Backup files are created during the process for safety
- The script handles both Admin (React/JSX) and API (Node.js) compilation settings

## Test Requirements

**IMPORTANT**: The zip script enforces strict quality gates to ensure plugin reliability.

### Validation Process

Before creating any plugin zip file, the script automatically:

1. **Runs Platform Tests**: Executes all validation tests in `test/platform/` to ensure the plugin meets platform requirements
2. **Checks for Plugin Tests**: Searches for test files in `test/plugins/{plugin-name}/`
3. **Runs Plugin Tests**: If test files exist, executes them to validate plugin-specific functionality

### Test File Requirements

For a plugin to be packaged, it **must** have dedicated test files in `test/plugins/{plugin-name}/`.

Accepted test file patterns:
- `*.test.ts`
- `*.test.tsx`
- `*.spec.ts`
- `*.spec.tsx`

### Validation Failures

Packaging will be **blocked** if:
- Platform validation tests fail
- Plugin-specific tests fail
- No test files are found for the plugin

### Skip Tests Option (Legacy Plugins)

For legacy plugins without tests (not recommended for production), you can bypass test requirements:

```bash
# Using CLI flag
pnpm zip-plugin --skip-tests

# Using environment variable
SKIP_TESTS=true pnpm zip-plugin
```


⚠️ **DEPRECATION WARNING**: Support for untested plugins will be removed in **version 3.0.0** (scheduled for Q2 2026). All plugins MUST have dedicated test files before this date. When using \`--skip-tests\`, you will see a deprecation notice. Plan to add tests to your plugin ASAP.

### Error Messages

The script provides clear error messages to help you understand validation failures:

- **Platform tests failed**: Issues with core platform validation
- **Plugin-specific tests failed**: Issues with your plugin's test suite
- **No test files found**: Plugin lacks dedicated tests (add tests or use \`--skip-tests\`)

## Security Features

The zip script implements multiple layers of security to protect against common vulnerabilities:

### Plugin Name Validation
- **Pattern**: Strict whitelist regex \`/^[A-Za-z0-9_-]+$/\`
- **Enforcement**: Validated before test execution and zip creation
- **Rejects**: Special characters, path traversal attempts (\`../\`), shell metacharacters
- **Logged**: Invalid attempts are blocked and error messages include context

### Command Injection Prevention
- **Implementation**: Uses \`child_process.execFileSync()\` with argument arrays instead of shell interpolation
- **Safe APIs**: Never constructs shell commands from user input
- **Example**: \`execFileSync('pnpm', ['exec', 'vitest', 'run', \`test/plugins/\${pluginName}/\`])\` 
- **Mitigates**: Arbitrary command execution, shell injection attacks

### Cross-Platform File Operations
- **APIs Used**: Node.js `fs` module (`cpSync`, `copyFileSync`, `rmSync`, `mkdirSync`) and `fast-glob` for file finding
- **Replaces**: Unix-specific commands like `cp -r`, `rm -rf`, `find`
- **Benefits**: Works on Windows, macOS, and Linux without security risks
- **Implementation**: All file operations are handled by Node.js built-ins or safe libraries, ensuring consistent behavior across OSs

### Path Security
- **Normalization**: Uses \`path.join()\` and \`path.resolve()\` for all path operations
- **Validation**: Ensures all paths remain within expected plugin directories
- **Prevents**: Directory traversal attacks, symlink attacks
- **Verification**: Validates file paths before archiving

## Example Workflow

```bash
# 1. Add tests for your plugin
mkdir -p test/plugins/myPlugin
touch test/plugins/myPlugin/lifecycle.test.ts

# 2. Write your tests
# ... code your tests ...

# 3. Run the zip script
pnpm zip-plugin

# 4. Select your plugin from the list
# 5. Choose development or production build
# 6. Tests run automatically
# 7. Zip file created in plugin-zips/
```
