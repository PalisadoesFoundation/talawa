// Proxy file to aggregate Apollo Client exports for tests
// This fixes the issue where @apollo/client default export only includes core in v4
// but components expect hooks and other React utilities from the main package.

export * from '@apollo/client/core';
export * from '@apollo/client/react';
