/**
 * @vitest-environment jsdom
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor, fireEvent, cleanup } from '@testing-library/react';
import { message } from 'antd';
import ExtensionPointsUser from '../../../../plugins/pluginMap/admin/pages/ExtensionPointsUser';
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

// Aggressively mock antd components to avoid JSDOM CSS parsing issues with CSS variables
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

// Local mock overrides default mock from reactTestSetup.ts for specific test cases

const mockRequests = [
  createMockRequest({
    id: 'req-1',
    pollNumber: 1,
    userRole: 'user',
    extensionPoint: 'RU1',
    organizationId: 'org-test',
    userId: 'test-user-id',
  }),
];

const standardMocks = [
  {
    request: {
      query: GET_PLUGIN_MAP_REQUESTS,
      variables: {
        input: {
          extensionPoint: 'RU1',
          userRole: 'user',
          organizationId: 'org-test',
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

describe('ExtensionPointsUser', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    cleanup();
    // Reset useLocalStorage to default authenticated state
    vi.mocked(useLocalStorage).mockReturnValue({
      getItem: (key: string) => (key === 'id' ? 'test-user-id' : null),
      setItem: vi.fn(),
      removeItem: vi.fn(),
    });
  });

  it('should render the dashboard for a specific organization', async () => {
    renderWithProviders(<ExtensionPointsUser />, {
      mocks: standardMocks,
      initialEntries: ['/org/org-test/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    expect(screen.getByText('user.title')).toBeInTheDocument();

    await screen.findAllByText('1');
    // Check that orgId is rendered
    expect(screen.getAllByText('org-test').length).toBeGreaterThan(0);
  });

  it('should log a new request on button click', async () => {
    const logMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            userId: 'test-user-id',
            userRole: 'user',
            organizationId: 'org-test',
            extensionPoint: 'RU1',
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
            organizationId: 'org-test',
            extensionPoint: 'RU1',
            createdAt: new Date().toISOString(),
            __typename: 'PluginMapPoll',
          },
        },
      },
    };

    renderWithProviders(<ExtensionPointsUser />, {
      mocks: [...standardMocks, logMock, ...standardMocks],
      initialEntries: ['/org/org-test/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    // Wait for initial load
    await screen.findAllByText('1');

    const button = screen.getByRole('button', { name: 'user.requestButton' });
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
            userId: 'test-user-id',
            userRole: 'user',
            organizationId: 'org-test',
            extensionPoint: 'RU1',
          },
        },
      },
      error: new Error('Simulation Error'),
    };

    renderWithProviders(<ExtensionPointsUser />, {
      mocks: [...standardMocks, errorLogMock],
      initialEntries: ['/org/org-test/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', { name: 'user.requestButton' });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
  });

  it('should redirect if orgId is missing', async () => {
    renderWithProviders(<ExtensionPointsUser />, {
      mocks: [],
      initialEntries: ['/plugin-map'],
      path: '/plugin-map',
    });

    expect(screen.queryByText('user.title')).not.toBeInTheDocument();
  });

  it('should use unknown-user if userId is missing', async () => {
    // Mock useLocalStorage to return null for 'id'
    vi.mocked(useLocalStorage).mockReturnValue({
      getItem: (_key: string) => null,
      setItem: vi.fn(),
      removeItem: vi.fn(),
    });

    const unknownUserMocks = [
      {
        request: {
          query: GET_PLUGIN_MAP_REQUESTS,
          variables: {
            input: {
              extensionPoint: 'RU1',
              userRole: 'user',
              organizationId: 'org-test',
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
              organizationId: 'org-test',
              extensionPoint: 'RU1',
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
              organizationId: 'org-test',
              extensionPoint: 'RU1',
              createdAt: new Date().toISOString(),
              __typename: 'PluginMapPoll',
            },
          },
        },
      },
    ];

    renderWithProviders(<ExtensionPointsUser />, {
      mocks: [...unknownUserMocks, unknownUserMocks[0]],
      initialEntries: ['/org/org-test/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    await waitFor(() => {
      expect(screen.getByText('table.totalRequests')).toBeInTheDocument();
    });

    const button = screen.getByRole('button', { name: 'user.requestButton' });
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
            organizationId: 'org-test',
            extensionPoint: 'RU1',
          },
        },
      },
      result: {
        data: {
          plugin_map_logPluginMapRequest: null,
        },
      },
    };

    renderWithProviders(<ExtensionPointsUser />, {
      mocks: [...standardMocks, missingDataMock],
      initialEntries: ['/org/org-test/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', { name: 'user.requestButton' });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
  });
});
