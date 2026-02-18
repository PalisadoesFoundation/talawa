import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';

// Storage for the captured callback
let failedLoadingHandler:
  | ((lng: string | null | undefined, ns: string, msg: string) => void)
  | undefined;

vi.mock('i18next', async (importOriginal) => {
  const actual = await importOriginal<{ default: object }>();
  const mockI18n = {
    ...actual.default, // Preserve constants if any
    use: vi.fn().mockReturnThis(),
    init: vi.fn(),
    on: vi.fn((event, callback) => {
      if (event === 'failedLoading') {
        failedLoadingHandler = callback;
      }
    }),
    changeLanguage: vi.fn(),
  };
  return {
    __esModule: true,
    default: mockI18n,
  };
});

describe('Plugin Map i18n utils', () => {
  let i18nModule: typeof import('../../../../../plugins/pluginMap/admin/utils/i18n');

  beforeEach(async () => {
    vi.resetModules();
    vi.clearAllMocks();
    failedLoadingHandler = undefined;
    // Import triggers execution
    i18nModule =
      await import('../../../../../plugins/pluginMap/admin/utils/i18n');
  });

  afterEach(() => {
    vi.unstubAllGlobals();
  });

  it('should register failedLoading handler', () => {
    expect(failedLoadingHandler).toBeDefined();
    expect(i18nModule.default.on).toHaveBeenCalledWith(
      'failedLoading',
      expect.any(Function),
    );
  });

  it('should log error and handle failedLoading for various languages', () => {
    const consoleSpy = vi.spyOn(console, 'error').mockImplementation(() => {});
    expect(failedLoadingHandler).toBeDefined();

    // Test Case: French
    failedLoadingHandler!('fr', 'plugin-map', 'Network Error');
    expect(consoleSpy).toHaveBeenLastCalledWith(
      expect.stringContaining('Failed to load plugin-map for language fr'),
      'Network Error',
    );
    expect(i18nModule.default.changeLanguage).toHaveBeenLastCalledWith('en');

    // Test Case: Spanish
    failedLoadingHandler!('es', 'plugin-map', 'Load Error');
    expect(consoleSpy).toHaveBeenLastCalledWith(
      expect.stringContaining('Failed to load plugin-map for language es'),
      'Load Error',
    );
    expect(i18nModule.default.changeLanguage).toHaveBeenLastCalledWith('en');

    expect(i18nModule.default.changeLanguage).toHaveBeenCalledTimes(2);
  });

  it('should handle empty or invalid language codes gracefully', () => {
    const consoleSpy = vi.spyOn(console, 'error').mockImplementation(() => {});
    expect(failedLoadingHandler).toBeDefined();

    // Test Case: Empty string
    failedLoadingHandler!('', 'plugin-map', 'Empty Lang Error');
    expect(consoleSpy).toHaveBeenLastCalledWith(
      expect.stringContaining('Failed to load plugin-map for language'),
      'Empty Lang Error',
    );
    expect(i18nModule.default.changeLanguage).toHaveBeenCalledWith('en');

    // Test Case: Null (simulated by casting)
    failedLoadingHandler!(
      null as unknown as string,
      'plugin-map',
      'Null Lang Error',
    );
    expect(i18nModule.default.changeLanguage).toHaveBeenCalledWith('en');

    expect(i18nModule.default.changeLanguage).toHaveBeenCalledTimes(2);
  });

  it('should handle invalid namespaces without throwing', () => {
    const consoleSpy = vi.spyOn(console, 'error').mockImplementation(() => {});
    expect(failedLoadingHandler).toBeDefined();

    failedLoadingHandler!('de', 'unknown-ns', 'NS Error');

    expect(consoleSpy).toHaveBeenCalledWith(
      expect.stringContaining('Failed to load unknown-ns for language de'),
      'NS Error',
    );
    expect(i18nModule.default.changeLanguage).toHaveBeenCalledWith('en');
  });

  it('should be idempotent: do not change language if already English', () => {
    vi.clearAllMocks();
    const consoleSpy = vi.spyOn(console, 'error').mockImplementation(() => {});

    failedLoadingHandler!('en', 'plugin-map', 'Error 1');

    failedLoadingHandler!('en', 'plugin-map', 'Error 2');
    expect(consoleSpy).toHaveBeenCalledTimes(2);
    expect(i18nModule.default.changeLanguage).not.toHaveBeenCalled();
  });

  it('should handle runtime null arguments gracefully', () => {
    vi.clearAllMocks();
    // Test Case: Null (cast to test runtime null handling per CodeRabbit feedback)
    // If language is null/undefined (not 'en'), it triggers fallback to 'en'.
    failedLoadingHandler!(
      null as unknown as string,
      undefined as unknown as string,
      undefined as unknown as string,
    );

    expect(i18nModule.default.changeLanguage).toHaveBeenCalledWith('en');
  });
});
