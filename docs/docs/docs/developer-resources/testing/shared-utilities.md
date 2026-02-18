---
id: shared-utilities
title: Shared Utilities
slug: /developer-resources/testing/shared-utilities
sidebar_position: 19
---

The plugin system provides a set of shared utilities to simplify testing and reduce code duplication. These utilities are located in `test/utils/` and `scripts/utils/`.

## Mock Context

`test/utils/mockContext.ts` provides factories for creating mock GraphQL context objects, including users and organizations.

### Usage

```typescript
import { createMockContext, createMockUser } from '../utils/mockContext';

const user = createMockUser({ id: 'user-1', role: 'admin' });
const context = createMockContext({ user });

// use context in your resolver tests
```

### Available Factories

- `createMockUser(overrides?)`: Creates a mock user object.
- `createMockOrganization(overrides?)`: Creates a mock organization object.
- `createMockContext(overrides?)`: Creates a full mock context with request/reply objects.

## Mock Clients

`test/utils/mockClients.ts` provides mocks for external clients and Fastify objects.

### Usage

```typescript
import { createMockFastifyRequest, createMockGraphQLClient } from '../utils/mockClients';

const req = createMockFastifyRequest({ 
    headers: { authorization: 'Bearer token' } 
});

const client = createMockGraphQLClient();
// client.request.mockResolvedValue(...)
```

### Available Factories

- `createMockFastifyRequest(overrides?)`
- `createMockFastifyReply()`
- `createMockGraphQLClient()`
- `createMockPaymentGateway()`

## Fixtures

`test/utils/fixtures.ts` contains shared static data for tests, such as valid manifest objects.

### Usage

```typescript
import { validManifest } from '../utils/fixtures';

const manifest = {
    ...validManifest,
    pluginId: 'my-test-plugin'
};
```

### Available Fixtures

- `validManifest`: A standard, valid plugin manifest object.
- `invalidManifest`: A base object for creating invalid manifests.
- `validExtensionPointManifest`: A manifest with valid extension points defined.

## Extension Point Validation

`scripts/utils/validateExtensionPoints.ts` ensures that plugin extension points are correctly defined and point to existing files and exports.

### Usage

```typescript
import { validateExtensionPoints } from '../../scripts/utils/validateExtensionPoints';
import { validManifest } from '../../test/utils/fixtures';

const result = await validateExtensionPoints(validManifest, '/path/to/plugin/root');

if (!result.valid) {
    console.error(result.errors);
}
```

This utility performs the following checks:
1.  **Schema**: Validates the structure of the extension point entry.
2.  **File Existence**: Checks if `file` paths exist relative to the plugin root.
3.  **Exports**: Verifies that the specified `builderDefinition`, named export, or default export is available in the file.
4.  **Name Collisions**: Ensures all extension point names are unique within the plugin.
