import { describe, it, expect } from 'vitest';
import {
  createMockUser,
  createMockOrganization,
  createMockContext,
} from './mockContext';

describe('mockContext utilities', () => {
  describe('createMockUser', () => {
    it('should create a user with default values', () => {
      const user = createMockUser();
      expect(user).toHaveProperty('id', 'user-123');
      expect(user).toHaveProperty('email', 'test@example.com');
      expect(user.roles).toEqual(['member']);
    });

    it('should allow overriding values', () => {
      const user = createMockUser({ id: 'custom-id', roles: ['admin'] });
      expect(user.id).toBe('custom-id');
      expect(user.roles).toEqual(['admin']);
    });
  });

  describe('createMockOrganization', () => {
    it('should create an organization with default values', () => {
      const org = createMockOrganization();
      expect(org).toHaveProperty('id', 'org-123');
      expect(org).toHaveProperty('name', 'Test Organization');
    });

    it('should allow overriding values', () => {
      const org = createMockOrganization({ name: 'Custom Org' });
      expect(org.name).toBe('Custom Org');
    });
  });

  describe('createMockContext', () => {
    it('should create a context with default user and org', () => {
      const context = createMockContext();
      expect(context.user).toBeDefined();
      expect(context.organization).toBeDefined();
      expect(context.userId).toBe(context.user!.id);
      expect(context.organizationId).toBe(context.organization!.id);
    });

    it('should allow overriding user and organization', () => {
      const customUser = createMockUser({ id: 'u1' });
      const customOrg = createMockOrganization({ id: 'o1' });
      const context = createMockContext({
        user: customUser,
        organization: customOrg,
      });

      expect(context.user).toBe(customUser);
      expect(context.organization).toBe(customOrg);
      // Note: createMockContext logic: const user = overrides.user || createMockUser();
      // userId: user.id
      expect(context.userId).toBe('u1');
      expect(context.organizationId).toBe('o1');
    });

    it('should prioritize user.id over conflicting userId in overrides', () => {
      const customUser = createMockUser({ id: 'u1' });
      const context = createMockContext({
        user: customUser,
        userId: 'conflicting-u2', // Should be ignored
      });

      expect(context.user).toBe(customUser);
      expect(context.userId).toBe('u1');
      expect(context.userId).not.toBe('conflicting-u2');
    });
  });
});
