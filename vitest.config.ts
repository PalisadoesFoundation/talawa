import { cpus } from 'node:os';
import path from 'path';
import { defineConfig } from 'vitest/config';

const isCI = !!process.env.CI;
const cpuCount = cpus().length;

const MAX_CI_THREADS = 12;
const MAX_LOCAL_THREADS = 16;

// Calculate optimal threads based on environment
// CI: Cap at 12 threads, use 85% of available CPUs (min 4) to avoid over-subscription
const ciThreads = Math.min(
  MAX_CI_THREADS,
  Math.max(4, Math.floor(cpuCount * 0.85)),
);

// Local: Cap at 16 threads, use 100% of available CPUs (min 4) for maximum speed
const localThreads = Math.min(MAX_LOCAL_THREADS, Math.max(4, cpuCount));

export default defineConfig({
  resolve: {
    alias: [
      {
        find: 'razorpay',
        replacement: path.resolve(__dirname, './__mocks__/razorpay.ts'),
      },
      {
        find: 'utils/useLocalstorage',
        replacement: path.resolve(__dirname, './__mocks__/useLocalstorage.ts'),
      },
      {
        find: 'components/Loader/Loader',
        replacement: path.resolve(__dirname, './__mocks__/Loader.tsx'),
      },

      {
        find: 'components',
        replacement: path.resolve(__dirname, './__mocks__/components_mock'),
      },
      {
        find: /^@apollo\/client$/,
        replacement: path.resolve(
          __dirname,
          './__mocks__/apollo-client-proxy.ts',
        ),
      },
      {
        find: '~/src/graphql/builder',
        replacement: path.resolve(__dirname, './__mocks__/builder.ts'),
      },
      {
        find: '~/src/utilities/TalawaGraphQLError',
        replacement: path.resolve(
          __dirname,
          './__mocks__/TalawaGraphQLError.ts',
        ),
      },
      {
        find: /^~\/(.*)$/,
        replacement: path.resolve(__dirname, './$1'),
      },
      {
        find: '~',
        replacement: path.resolve(__dirname, './'),
      },
    ],
  },
  test: {
    globals: true,
    environment: 'node',
    include: [
      'test/**/*.{test,spec}.{js,jsx,ts,tsx}',
      'plugins/**/test/**/*.{test,spec}.{js,jsx,ts,tsx}',
    ],
    exclude: [
      '**/node_modules/**',
      'dist/**',
      'coverage/**',
      'docs/**',
      '**/*.d.ts',
      'plugin-zips/**',
    ],
    setupFiles: ['test/setup/globalMocks.ts', 'test/setup/reactTestSetup.ts'],
    // Vitest v4 Migration: poolOptions removed, replaced by top-level worker options
    maxWorkers: isCI ? ciThreads : localThreads,
    isolate: true,
    maxConcurrency: isCI ? ciThreads : localThreads,
    fileParallelism: true,
    sequence: {
      shuffle: false,
      concurrent: false,
    },
    coverage: {
      provider: 'v8',
      reporter: ['text', 'lcov', 'html', 'json'],
      reportsDirectory: './coverage/vitest',
      exclude: [
        'node_modules/**',
        'dist/**',
        'coverage/**',
        'docs/**',
        '**/*.d.ts',
        '**/*.{test,spec}.{js,ts,tsx,jsx}',
        'plugin-zips/**',
        'scripts/docs/**',
        'scripts/githooks/**',
        '**/*.config.{js,ts}',
        '**/index.{js,ts}',
        'test/**',
        '**/__mocks__/**',
        '**/testUtils.{ts,tsx}',
        '**/setupTests.ts',
      ],
      thresholds: {
        lines: 80,
        functions: 70,
        branches: 78,
        statements: 80,
      },
    },
    // Test timeouts - configurable via env vars
    // CI environments can be slower; local runs typically complete in <1s per test
    // Packaging tests do actual zip operations which can vary in duration
    testTimeout: parseInt(
      process.env.VITEST_TEST_TIMEOUT || (process.env.CI ? '30000' : '10000'),
      10,
    ), // 10s default, 30s on CI unless VITEST_TEST_TIMEOUT overrides
    hookTimeout: parseInt(
      process.env.VITEST_HOOK_TIMEOUT || (process.env.CI ? '10000' : '5000'),
      10,
    ), // 5s default, 10s on CI
  },
});
