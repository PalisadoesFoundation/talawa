/**
 * @vitest-environment jsdom
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor, fireEvent, cleanup } from '@testing-library/react';
import { message } from 'antd';
import ExtensionPointsGlobal from '../../../../plugins/pluginMap/admin/pages/ExtensionPointsGlobal';
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

// Aggressively mock antd components
// Aggressively mock antd components using shared helper
vi.mock('antd', async () => {
  const actual = await vi.importActual<typeof import('antd')>('antd');
  const { createAntdMocks } =
    await vi.importActual<typeof import('./antdMocks')>('./antdMocks');
  return {
    ...actual,
    ...createAntdMocks(vi),
    message: {
      ...actual.message,
      success: vi.fn(),
      error: vi.fn(),
    },
  };
});

const mockRequests = [
  createMockRequest({
    id: 'req-global',
    pollNumber: 1,
    extensionPoint: 'RU2',
    userId: 'test-user-id',
  }),
];

const standardMocks = [
  {
    request: {
      query: GET_PLUGIN_MAP_REQUESTS,
      variables: {
        input: {
          extensionPoint: 'RU2',
          userRole: 'user',
          organizationId: null,
          userId: 'test-user-id',
        },
      },
    },
    result: {
      data: {
        plugin_map_getPluginMapRequests: {
          requests: mockRequests,
          totalCount: 1,
          hasMore: false,
          __typename: 'PluginMapRequestsResult',
        },
      },
    },
  },
];

describe('ExtensionPointsGlobal', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    cleanup();
    // Reset useLocalStorage to default authenticated state
    vi.mocked(useLocalStorage).mockReturnValue({
      getItem: (key: string) => (key === 'id' ? 'test-user-id' : null),
      setItem: vi.fn(),
      removeItem: vi.fn(),
    });
    // Set default userId
  });

  it('should render the global extension point title', async () => {
    renderWithProviders(<ExtensionPointsGlobal />, {
      mocks: standardMocks,
    });

    expect(screen.getByText('global.title')).toBeInTheDocument();
    expect(screen.getByText('global.description')).toBeInTheDocument();
  });

  it('should verify components card titles and button', async () => {
    renderWithProviders(<ExtensionPointsGlobal />, {
      mocks: standardMocks,
    });

    await screen.findAllByText('1');

    expect(screen.getByText('global.testRequestSystem')).toBeInTheDocument();
    expect(screen.getByText('global.requestHistory')).toBeInTheDocument();
    expect(screen.getByText('global.requestButton')).toBeInTheDocument();
  });

  it('should log a new request on button click', async () => {
    const logMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            userId: 'test-user-id',
            userRole: 'user',
            organizationId: null,
            extensionPoint: 'RU2',
          },
        },
      },
      result: {
        data: {
          plugin_map_logPluginMapRequest: {
            id: 'req-new',
            pollNumber: 3,
            userId: 'test-user-id',
            userRole: 'user',
            organizationId: null,
            extensionPoint: 'RU2',
            createdAt: new Date().toISOString(),
            __typename: 'PluginMapPoll',
          },
        },
      },
    };

    renderWithProviders(<ExtensionPointsGlobal />, {
      // standardMocks duplicated to trigger refetch-after-mutation (mirrors ExtensionPointsDashboard)
      // logMock intentionally inserted between duplicates
      mocks: [...standardMocks, logMock, ...standardMocks],
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', { name: 'global.requestButton' });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.success).toHaveBeenCalledWith('messages.success');
    });
  });

  it('should handle error when logging a request', async () => {
    const errorLogMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            extensionPoint: 'RU2',
            userRole: 'user',
            organizationId: null,
            userId: 'test-user-id',
          },
        },
      },
      error: new Error('Simulation Error'),
    };

    renderWithProviders(<ExtensionPointsGlobal />, {
      mocks: [...standardMocks, errorLogMock],
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', { name: 'global.requestButton' });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
  });

  it('should use unknown-user if userId is missing', async () => {
    // Force useLocalStorage to return null
    // We achieve this by overriding the mock for this specific test
    // Note: The global mock at the top of the file handles "id" -> "test-user-id"
    // Here we need to override the implementation for this test run.
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
              extensionPoint: 'RU2',
              userRole: 'user',
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
              userRole: 'user',
              organizationId: null,
              extensionPoint: 'RU2',
            },
          },
        },
        result: {
          data: {
            plugin_map_logPluginMapRequest: {
              id: 'req-unknown',
              pollNumber: 99,
              userId: 'unknown-user',
              userRole: 'user',
              organizationId: null,
              extensionPoint: 'RU2',
              createdAt: new Date().toISOString(),
              __typename: 'PluginMapPoll',
            },
          },
        },
      },
    ];

    renderWithProviders(<ExtensionPointsGlobal />, {
      // unknownUserMocks[0] duplicated for refetch after mutation
      mocks: [...unknownUserMocks, unknownUserMocks[0]],
    });

    await waitFor(() => {
      expect(screen.getByText('table.totalRequests')).toBeInTheDocument();
    });

    const button = screen.getByRole('button', { name: 'global.requestButton' });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.success).toHaveBeenCalledWith('messages.success');
    });
  });

  it('should handle missing mutation data', async () => {
    const missingDataMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            userId: 'test-user-id',
            userRole: 'user',
            organizationId: null,
            extensionPoint: 'RU2',
          },
        },
      },
      result: {
        data: {
          plugin_map_logPluginMapRequest: null,
        },
      },
    };

    renderWithProviders(<ExtensionPointsGlobal />, {
      mocks: [...standardMocks, missingDataMock],
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', { name: 'global.requestButton' });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
  });
});
