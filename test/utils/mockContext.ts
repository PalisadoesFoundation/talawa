export interface MockUser {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  roles: string[];
  permissions: string[];
  organizationId?: string;
  isSuperAdmin?: boolean;
}

export interface MockOrganization {
  id: string;
  name: string;
  slug: string;
  ownerId: string;
}

export interface MockContext {
  userId?: string;
  user?: MockUser;
  organizationId?: string;
  organization?: MockOrganization;
  isAdmin?: boolean;
  token?: string;
  [key: string]: unknown;
}

/**
 * Creates a mock user with default values and overrides.
 */
export const createMockUser = (overrides: Partial<MockUser> = {}): MockUser => {
  return {
    id: 'user-123',
    email: 'test@example.com',
    firstName: 'Test',
    lastName: 'User',
    roles: ['member'],
    permissions: [],
    ...overrides,
  };
};

/**
 * Creates a mock organization with default values and overrides.
 */
export const createMockOrganization = (
  overrides: Partial<MockOrganization> = {},
): MockOrganization => {
  return {
    id: 'org-123',
    name: 'Test Organization',
    slug: 'test-org',
    ownerId: 'user-123',
    ...overrides,
  };
};

/**
 * Creates a mock GraphQL context.
 */
export const createMockContext = (
  overrides: Partial<MockContext> = {},
): MockContext => {
  const user = overrides.user || createMockUser();
  const organization = overrides.organization || createMockOrganization();

  return {
    isAdmin: false,
    token: 'mock-jwt-token',
    ...overrides,
    // Enforce consistency: ID properties must match the objects
    user,
    userId: user.id,
    organization,
    organizationId: organization.id,
  };
};
