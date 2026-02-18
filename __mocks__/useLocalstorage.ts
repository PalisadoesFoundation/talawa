import { vi } from 'vitest';

/**
 * Mock for utils/useLocalstorage from talawa-admin
 * Used for testing admin UI components that depend on this hook
 */
const useLocalStorage = () => ({
  getItem: (key: string) => {
    if (key === 'id') return 'test-user-id';
    return null;
  },
  setItem: vi.fn(),
  removeItem: vi.fn(),
});

export default useLocalStorage;
