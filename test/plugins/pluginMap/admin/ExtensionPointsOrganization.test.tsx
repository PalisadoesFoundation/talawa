/**
 * @vitest-environment jsdom
 */
import React from 'react';
import { describe, it, expect, vi, beforeEach } from 'vitest';
import { screen, waitFor, fireEvent, cleanup } from '@testing-library/react';
import { message } from 'antd';
import ExtensionPointsOrganization from '../../../../plugins/pluginMap/admin/pages/ExtensionPointsOrganization';
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
    id: 'req-org',
    pollNumber: 1,
    extensionPoint: 'RA1',
    organizationId: 'org-123',
    userId: 'test-user-id',
  }),
];

const standardMocks = [
  {
    request: {
      query: GET_PLUGIN_MAP_REQUESTS,
      variables: {
        input: {
          extensionPoint: 'RA1',
          userRole: 'admin',
          organizationId: 'org-123',
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

describe('ExtensionPointsOrganization', () => {
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

  it('should render the organization extension point for org-123', async () => {
    renderWithProviders(<ExtensionPointsOrganization />, {
      mocks: standardMocks,
      initialEntries: ['/org/org-123/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    expect(screen.getByText('organization.title')).toBeInTheDocument();
    expect(screen.getAllByText('org-123').length).toBeGreaterThan(0);
    await screen.findAllByText('1');
  });

  it('should redirect if orgId is missing', async () => {
    renderWithProviders(<ExtensionPointsOrganization />, {
      mocks: [],
      initialEntries: ['/plugin-map'],
      path: '/plugin-map',
    });

    expect(screen.queryByText('organization.title')).not.toBeInTheDocument();
  });

  it('should log a new request on button click', async () => {
    const logMock = {
      request: {
        query: LOG_PLUGIN_MAP_REQUEST,
        variables: {
          input: {
            userId: 'test-user-id',
            userRole: 'admin',
            organizationId: 'org-123',
            extensionPoint: 'RA1',
          },
        },
      },
      result: {
        data: {
          plugin_map_logPluginMapRequest: {
            id: 'req-new',
            pollNumber: 7,
            userId: 'test-user-id',
            userRole: 'admin',
            organizationId: 'org-123',
            extensionPoint: 'RA1',
            createdAt: new Date().toISOString(),
            __typename: 'PluginMapPoll',
          },
        },
      },
    };

    renderWithProviders(<ExtensionPointsOrganization />, {
      mocks: [...standardMocks, logMock, ...standardMocks],
      initialEntries: ['/org/org-123/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', {
      name: 'organization.requestButton',
    });
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
            extensionPoint: 'RA1',
            userRole: 'admin',
            organizationId: 'org-123',
            userId: 'test-user-id',
          },
        },
      },
      error: new Error('Simulation Error'),
    };

    renderWithProviders(<ExtensionPointsOrganization />, {
      mocks: [...standardMocks, errorLogMock],
      initialEntries: ['/org/org-123/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', {
      name: 'organization.requestButton',
    });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
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
              extensionPoint: 'RA1',
              userRole: 'admin',
              organizationId: 'org-123',
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
              organizationId: 'org-123',
              extensionPoint: 'RA1',
            },
          },
        },
        result: {
          data: {
            plugin_map_logPluginMapRequest: {
              id: 'req-unknown-org',
              pollNumber: 66,
              userId: 'unknown-user',
              userRole: 'admin',
              organizationId: 'org-123',
              extensionPoint: 'RA1',
              createdAt: new Date().toISOString(),
              __typename: 'PluginMapPoll',
            },
          },
        },
      },
    ];

    renderWithProviders(<ExtensionPointsOrganization />, {
      mocks: [...unknownUserMocks, unknownUserMocks[0]],
      initialEntries: ['/org/org-123/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    await waitFor(() => {
      expect(screen.getByText('table.totalRequests')).toBeInTheDocument();
    });

    const button = screen.getByRole('button', {
      name: 'organization.requestButton',
    });
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
            userRole: 'admin',
            organizationId: 'org-123',
            extensionPoint: 'RA1',
          },
        },
      },
      result: {
        data: {
          plugin_map_logPluginMapRequest: null,
        },
      },
    };

    renderWithProviders(<ExtensionPointsOrganization />, {
      mocks: [...standardMocks, missingDataMock],
      initialEntries: ['/org/org-123/plugin-map'],
      path: '/org/:orgId/plugin-map',
    });

    await screen.findAllByText('1');
    const button = screen.getByRole('button', {
      name: 'organization.requestButton',
    });
    fireEvent.click(button);

    await waitFor(() => {
      expect(message.error).toHaveBeenCalledWith('messages.error');
    });
  });
});
