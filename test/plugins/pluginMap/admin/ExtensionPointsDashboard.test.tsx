/**
 * @vitest-environment jsdom
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor, fireEvent } from '@testing-library/react';
import { message } from 'antd';
import ExtensionPointsDashboard from '../../../../plugins/pluginMap/admin/pages/ExtensionPointsDashboard';
import {
  GET_PLUGIN_MAP_REQUESTS,
  LOG_PLUGIN_MAP_REQUEST,
} from '../../../../plugins/pluginMap/admin/graphql/queries';
import { renderWithProviders, createMockRequest } from './adminTestUtils';

import useLocalStorage from 'utils/useLocalstorage';

// Mock useLocalStorage
vi.mock('utils/useLocalstorage', () => ({
  default: vi.fn(() => ({
    getItem: (key: string) => (key === 'id' ? 'test-user-id' : null),
    setItem: vi.fn(),
    removeItem: vi.fn(),
  })),
}));

// Aggressively mock antd components using shared helper
vi.mock('antd', async () => {
  const actual = await vi.importActual<typeof import('antd')>('antd');
  const { createAntdMocks } =
    await vi.importActual<typeof import('./antdMocks')>('./antdMocks');
  return {
    ...actual,
    ...createAntdMocks(vi),
  };
});

// Local mock overrides default mock from reactTestSetup.ts for specific test cases

const mockRequests = [
  createMockRequest({ id: 'req-1', pollNumber: 1, extensionPoint: 'RA2' }),
  createMockRequest({ id: 'req-2', pollNumber: 2, extensionPoint: 'RA2' }),
];

const standardMocks = [
  {
    request: {
      query: GET_PLUGIN_MAP_REQUESTS,
      variables: {
        input: {
          extensionPoint: 'RA2',
          userRole: 'admin',
          organizationId: null,
          userId: 'test-user-id',
        },
      },
    },
    result: {
      data: {
        plugin_map_getPluginMapRequests: {
          requests: mockRequests,
          totalCount: 2,
          hasMore: false,
          __typename: 'PluginMapRequestsResult',
        },
      },
    },
  },
];

describe('ExtensionPointsDashboard', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    // Default to test-user-id
    vi.mocked(useLocalStorage).mockReturnValue({
      getItem: (key: string) => (key === 'id' ? 'test-user-id' : null),
      setItem: vi.fn(),
      removeItem: vi.fn(),
    });
  });

  it('should render the dashboard title and description', async () => {
    renderWithProviders(<ExtensionPointsDashboard />, {
      mocks: standardMocks,
    });

    expect(screen.getByText('dashboard.title')).toBeInTheDocument();
    expect(screen.getByText('dashboard.description')).toBeInTheDocument();
  });

  it('should verify components card titles and button', async () => {
    renderWithProviders(<ExtensionPointsDashboard />, {
      mocks: standardMocks,
    });

    await screen.findAllByText('1');

    expect(screen.getByText('dashboard.testRequestSystem')).toBeInTheDocument();
    expect(screen.getByText('dashboard.requestHistory')).toBeInTheDocument();
    expect(screen.getByText('dashboard.requestButton')).toBeInTheDocument();
  });

  it('should render the table with correct headers', async () => {
    renderWithProviders(<ExtensionPointsDashboard />, {
      mocks: standardMocks,
    });

    await screen.findAllByText('1');

    expect(screen.getByText('table.pollNumber')).toBeInTheDocument();
    expect(screen.getByText('table.userId')).toBeInTheDocument();
    expect(screen.getByText('table.userRole')).toBeInTheDocument();
    expect(screen.getByText('table.extensionPoint')).toBeInTheDocument();
    expect(screen.getByText('table.createdAt')).toBeInTheDocument();
  });

  it('should render the request history table', async () => {
    renderWithProviders(<ExtensionPointsDashboard />, {
      mocks: standardMocks,
    });

    // Use findAllByText for the poll numbers
    const ones = await screen.findAllByText('1');
    expect(ones.length).toBeGreaterThan(0);

    const twos = await screen.findAllByText('2');
    expect(twos.length).toBeGreaterThan(0);

    // Verify total requests text is present
    expect(screen.getByText('table.totalRequests')).toBeInTheDocument();
  });

  it('should log a new request when the button is clicked', async () => {
    const logMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            userId: 'test-user-id',
            userRole: 'admin',
            organizationId: null,
            extensionPoint: 'RA2',
          },
        },
      },
      result: {
        data: {
          plugin_map_logPluginMapRequest: {
            id: 'req-new',
            pollNumber: 3,
            userId: 'test-user-id',
            userRole: 'admin',
            organizationId: null,
            extensionPoint: 'RA2',
            createdAt: new Date().toISOString(),
            __typename: 'PluginMapPoll',
          },
        },
      },
    };

    renderWithProviders(<ExtensionPointsDashboard />, {
      // standardMocks appears twice: initial GET_PLUGIN_MAP_REQUESTS query + refetch after LOG_PLUGIN_MAP_REQUEST mutation
      mocks: [...standardMocks, logMock, ...standardMocks],
    });

    // Wait for initial load
    await screen.findAllByText('1');

    const button = screen.getByRole('button', {
      name: 'dashboard.requestButton',
    });
    fireEvent.click(button);

    await waitFor(() => {
      // Mock returns key, so message.success(t()) -> message.success(key)
      // Check i18next mock implementation in globalMocks.ts:
      // t: (key) => key
      expect(message.success).toHaveBeenCalledWith('messages.success');
    });
  });

  it('should handle error when logging a request', async () => {
    const errorLogMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            userId: 'test-user-id',
            userRole: 'admin',
            organizationId: null,
            extensionPoint: 'RA2',
          },
        },
      },
      error: new Error('Simulation Error'),
    };

    renderWithProviders(<ExtensionPointsDashboard />, {
      mocks: [...standardMocks, errorLogMock],
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', {
      name: 'dashboard.requestButton',
    });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
  });

  it('should use unknown-user if userId is missing in localStorage', async () => {
    // Mock useLocalStorage to return null for 'id'
    vi.mocked(useLocalStorage).mockReturnValue({
      getItem: () => null,
      setItem: vi.fn(),
      removeItem: vi.fn(),
    });

    const unknownUserMocks = [
      {
        request: {
          query: GET_PLUGIN_MAP_REQUESTS,
          variables: {
            input: {
              extensionPoint: 'RA2',
              userRole: 'admin',
              organizationId: null,
              userId: 'unknown-user',
            },
          },
        },
        result: {
          data: {
            plugin_map_getPluginMapRequests: {
              requests: [],
              totalCount: 0,
              hasMore: false,
              __typename: 'PluginMapRequestsResult',
            },
          },
        },
      },
      {
        request: {
          query: LOG_PLUGIN_MAP_REQUEST,
          variables: {
            input: {
              userId: 'unknown-user',
              userRole: 'admin',
              organizationId: null,
              extensionPoint: 'RA2',
            },
          },
        },
        result: {
          data: {
            plugin_map_logPluginMapRequest: {
              id: 'req-unknown',
              pollNumber: 99,
              userId: 'unknown-user',
              userRole: 'admin',
              organizationId: null,
              extensionPoint: 'RA2',
              createdAt: new Date().toISOString(),
              __typename: 'PluginMapPoll',
            },
          },
        },
      },
    ];

    renderWithProviders(<ExtensionPointsDashboard />, {
      // unknownUserMocks[0] duplicated to simulate refetch after mutation
      mocks: [...unknownUserMocks, unknownUserMocks[0]],
    });

    // We can't query by text with interpolation easily with the simple mock
    // Just wait for something that indicates loading finished or empty state
    // But table renders empty dataSource

    // We can verify "Total requests: 0" -> t('table.totalRequests', { count: 0 })
    // With simple mock: returns 'table.totalRequests'
    await waitFor(() => {
      expect(screen.getByText('table.totalRequests')).toBeInTheDocument();
    });

    const button = screen.getByRole('button', {
      name: 'dashboard.requestButton',
    });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.success).toHaveBeenCalledWith('messages.success');
    });
  });

  it('should handle missing mutation data gracefully', async () => {
    const missingDataMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            extensionPoint: 'RA2',
            userRole: 'admin',
            organizationId: null,
            userId: 'test-user-id',
          },
        },
      },
      result: {
        data: {
          plugin_map_logPluginMapRequest: null,
        },
      },
    };

    renderWithProviders(<ExtensionPointsDashboard />, {
      mocks: [...standardMocks, missingDataMock],
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', {
      name: 'dashboard.requestButton',
    });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
  });

  it('should render user role tags correctly', async () => {
    const mixedRoleMocks = [
      createMockRequest({ id: 'req-admin', userRole: 'admin' }),
      createMockRequest({ id: 'req-user', userRole: 'user' }),
    ];

    const mocks = [
      {
        request: {
          query: GET_PLUGIN_MAP_REQUESTS,
          variables: {
            input: {
              extensionPoint: 'RA2',
              userRole: 'admin',
              organizationId: null,
              userId: 'test-user-id',
            },
          },
        },
        result: {
          data: {
            plugin_map_getPluginMapRequests: {
              requests: mixedRoleMocks,
              totalCount: 2,
              hasMore: false,
              __typename: 'PluginMapRequestsResult',
            },
          },
        },
      },
    ];

    renderWithProviders(<ExtensionPointsDashboard />, {
      mocks,
    });

    await waitFor(() => {
      expect(screen.getByText('admin')).toBeInTheDocument();
      expect(screen.getByText('user')).toBeInTheDocument();
    });
  });
});
