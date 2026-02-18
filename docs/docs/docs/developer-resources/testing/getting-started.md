---
id: getting-started
title: Getting Started
slug: /developer-resources/testing/getting-started
sidebar_position: 17
---

This guide will help you quickly start writing and running tests for the Talawa Plugin system. Learn the essential commands, common patterns, and best practices for testing plugins.

## Quick Start

### Run all tests
```bash
pnpm test
```

### Run tests in watch mode (recommended for development)
```bash
pnpm test:watch
```

### Run with coverage
```bash
pnpm test:coverage
```

## Writing Your First Test

Create a test file with `.test.ts` or `.test.tsx` extension:

```typescript
// test/example.test.ts
import { describe, it, expect } from 'vitest';

describe('My First Test', () => {
  it('should pass', () => {
    expect(1 + 1).toBe(2);
  });
});
```

Run it:
```bash
pnpm test test/example.test.ts
```

## Common Test Patterns

These patterns demonstrate frequently used testing scenarios that you'll encounter when developing plugins. Each pattern addresses a specific testing need, from validating configuration files to managing test isolation with temporary directories. Use these as templates to build your own test suites.

### Testing manifest files

Manifest files define critical plugin metadata like IDs, versions, and extension points. Testing them ensures your plugin can be properly loaded and validated by the platform. This pattern shows how to read and verify manifest structure before deployment.
```typescript
import { readFileSync } from 'node:fs';
import { join } from 'node:path';

const manifestPath = join(process.cwd(), 'plugins/MyPlugin/admin/manifest.json');
const manifest = JSON.parse(readFileSync(manifestPath, 'utf-8'));

expect(manifest.pluginId).toBeDefined();
```

### Testing with temporary directories

Many plugin operations involve file system interactions like generating scaffolding, creating archives, or processing uploads. Using temporary directories ensures tests don't pollute your workspace and can run in parallel safely. Always clean up temporary directories in a finally block to prevent resource leaks.
```typescript
import { mkdtempSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const tempDir = mkdtempSync(join(tmpdir(), 'test-'));
try {
  // Your test logic
} finally {
  rmSync(tempDir, { recursive: true, force: true });
}
```

## Test Commands Reference

The following table provides a quick reference for all available test commands. Different commands serve different workflows: use watch mode during active development, coverage mode before committing, and UI mode for debugging complex test scenarios.

| Command | Purpose |
|---------|---------|
| `pnpm test` | Run all tests once |
| `pnpm test:watch` | Run tests in watch mode |
| `pnpm test:coverage` | Run tests with coverage |
| `pnpm test:ui` | Open interactive UI |
| `pnpm test [file]` | Run specific test file |
| `pnpm test [directory]` | Run all tests in directory |

## Tips for Effective Testing

1. **Use watch mode** during development for instant feedback
2. **Write descriptive test names** that explain what's being tested
3. **Keep tests focused** - one concept per test
4. **Clean up after tests** - remove temporary files/directories
5. **Check coverage** to identify untested code paths

## Next Steps

- Read [Platform Tests Guide](platform-tests) for platform-specific patterns
- Read [Setup Guide](setup) for detailed configuration
