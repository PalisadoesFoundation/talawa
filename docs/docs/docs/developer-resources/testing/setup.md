---
id: setup
title: Setup Guide
slug: /developer-resources/testing/setup
sidebar_position: 16
---

Complete guide to setting up and configuring the testing infrastructure.

## Prerequisites

- Node.js 24.x (as used in CI - see `.github/workflows/pull-request.yml`)
- pnpm 10.x or higher (see `package.json` `packageManager` field)

## Installation

Testing dependencies are already included in `package.json`. Refer to the file for current versions.

## Test Configuration

The testing infrastructure uses Vitest as the test runner with specific configuration for platform tests. The setup includes glob patterns for test discovery, coverage thresholds, and environment-specific timeout values.

### Framework

We use **Vitest** - a fast, modern test framework compatible with Jest API.

**Key Features:**
- Native ES modules support
- TypeScript support out of the box
- Fast parallel test execution
- Compatible with Jest API

### Test File Patterns

- `test/**/*.{test,spec}.{js,jsx,ts,tsx}` - Platform tests
- `plugins/**/test/**/*.{test,spec}.{js,jsx,ts,tsx}` - Plugin-specific tests

### Coverage Configuration

- Provider: v8 (faster than istanbul)
- Thresholds: Platform tests achieve >95% coverage; overall thresholds set to 60% for gradual improvement

### Threading Configuration

**Dynamic Thread Allocation:**
- Configured using `maxWorkers` (Vitest v4+)
- CI: 12 threads (85% of CPU cores, min 4)
- Local: 16 threads (100% of CPU cores, min 4)
- Ensures optimal performance without over-subscription

## Running Tests

The test suite provides multiple commands for different workflows. Use watch mode during development for instant feedback, or run the full suite before committing changes.

```bash
# Run all tests
pnpm test

# Run in watch mode (recommended for development)
pnpm test:watch

# Run specific test file
pnpm test test/platform/manifestValidation.test.ts

# Run all platform tests
pnpm test test/platform

# Run with coverage
pnpm test:coverage

# Run with UI
pnpm test:ui
```

## Coverage Reports

Coverage reports help identify untested code paths. Generate HTML reports to visualize which lines, branches, and functions are covered by your tests.

```bash
# Generate coverage report
pnpm test:coverage

# View HTML coverage report
open coverage/vitest/index.html

# Or use a local server
npx serve coverage/vitest
```

## Test Organization

The testing infrastructure is organized into two distinct layers to separate platform concerns from plugin-specific tests:

**Platform Tests (`test/`)**: These validate the core plugin infrastructure—the scaffolding generators, packaging system, and manifest validation. Platform tests ensure that the fundamental building blocks for creating plugins work correctly. They run against the platform's own code, not individual plugins.

**Plugin Tests (`plugins/*/test/`)**: Each plugin has its own isolated test directory. This separation ensures that plugin tests don't interfere with platform tests or other plugins. Plugin tests verify the plugin's specific functionality, UI components, API resolvers, and business logic.

This two-tier structure allows platform improvements to be tested independently while giving each plugin complete testing autonomy.

```
talawa-plugin/
├── test/                  # Platform infrastructure tests
│   ├── platform/
│   │   ├── manifestValidation.test.ts
│   │   ├── generator.test.ts
│   │   └── packaging.test.ts
│   └── utils/              # Shared test utilities
│       └── testUtils.ts
├── plugins/
│   ├── Razorpay/
│   │   ├── admin/
│   │   │   └── test/           # Admin UI tests
│   │   └── api/
│   │       └── test/           # API/backend tests
└── vitest.config.ts        # Test configuration
```

## Continuous Integration

Tests run automatically on:
- Pull requests
- Pushes to main branches
- Manual workflow dispatch

CI Configuration: `.github/workflows/pull-request.yml`

## Troubleshooting

Common issues and their solutions are listed below. Most problems relate to dependency mismatches or configuration errors.

### Tests fail with module not found

This error typically occurs when dependencies are out of sync or when switching between branches with different package versions. The Node.js module resolution system can't locate required packages, often due to corrupted node_modules or mismatched lockfile state.
```bash
# Reinstall dependencies
pnpm install
```

### Coverage reports not generated

Coverage generation can fail silently if the output directory is gitignored globally or if the v8 provider encounters permissions issues. Running with verbose output helps identify whether the test runner is actually collecting coverage or encountering configuration problems.
```bash
# Ensure coverage directory is not gitignored
# Run with verbose output
pnpm test:coverage --reporter=verbose
```

### Tests timeout in CI
- CI uses 30s timeout by default
- Configure via `VITEST_TEST_TIMEOUT` env var if needed

## Best Practices

1. **Write tests first** - TDD approach catches issues early
2. **Use descriptive names** - Test names should explain what's being tested
3. **Keep tests isolated** - Each test should be independent
4. **Mock external dependencies** - Don't rely on network or file system
5. **Test edge cases** - Don't just test happy paths
6. **Maintain high coverage** - Aim for 80%+ on new code

## Next Steps

- Read [Getting Started](getting-started) for basic test patterns
- Read [Platform Tests](platform-tests) for platform-specific patterns
- Check out existing tests in `test/platform/` for examples
