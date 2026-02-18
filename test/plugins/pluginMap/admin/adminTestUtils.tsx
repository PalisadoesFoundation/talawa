import React, { ReactNode } from 'react';
import { MockedResponse } from '@apollo/client/testing';
import { MockedProvider } from '@apollo/client/testing/react';
import { MemoryRouter, Routes, Route } from 'react-router-dom';
import { render, RenderOptions, act } from '@testing-library/react';
import { I18nextProvider } from 'react-i18next';
import i18n from '../../../../utils/i18nForTests';

/**
 * Test wrapper for Admin components
 */
const TestWrapper: React.FC<{
  children: ReactNode;
  mocks: MockedResponse[];
  initialEntries?: string[];
  path?: string;
}> = ({ children, mocks, initialEntries = ['/'], path = '/' }) => {
  return (
    <I18nextProvider i18n={i18n}>
      <MockedProvider mocks={mocks}>
        <MemoryRouter initialEntries={initialEntries}>
          <Routes>
            <Route path={path} element={children} />
          </Routes>
        </MemoryRouter>
      </MockedProvider>
    </I18nextProvider>
  );
};

/**
 * Custom render function for Admin components
 */
export const renderWithProviders = (
  ui: React.ReactElement,
  options: {
    mocks?: MockedResponse[];
    initialEntries?: string[];
    path?: string;
  } & Omit<RenderOptions, 'wrapper'> = {},
) => {
  const { mocks = [], initialEntries, path, ...renderOptions } = options;

  const Wrapper = ({ children }: { children: ReactNode }) => (
    <TestWrapper mocks={mocks} initialEntries={initialEntries} path={path}>
      {children}
    </TestWrapper>
  );

  return render(ui, { wrapper: Wrapper, ...renderOptions });
};

/**
 * Mock data factories for Admin tests
 */
export const createMockRequest = (overrides = {}) => ({
  id: 'req-123',
  pollNumber: 1,
  userId: 'test-user-id',
  userRole: 'admin',
  organizationId: null,
  extensionPoint: 'RA1',
  createdAt: new Date().toISOString(),
  __typename: 'PluginMapPoll',
  ...overrides,
});

export const createMockExtensionPoint = (overrides = {}) => ({
  id: 'RA1',
  name: 'Admin Global Route',
  description: 'Test description',
  context: 'Global',
  userRole: 'Admin',
  features: ['Feature 1'],
  __typename: 'ExtensionPoint',
  ...overrides,
});

/**
 * Flushes pending promises
 */
export const flushPromises = async () => {
  await act(async () => {
    await new Promise((resolve) => setTimeout(resolve, 0));
  });
};
