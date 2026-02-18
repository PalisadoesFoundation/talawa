import { describe, it, expect, vi, beforeEach } from 'vitest';
import RazorpayPlugin, {
  onLoad,
  onActivate,
  onDeactivate,
  onUnload,
} from '../../../plugins/razorpay/api/index';
import { createMockRazorpayContext } from './utils/mockRazorpay';

describe('Razorpay Plugin Lifecycle', () => {
  let mockContext: any;

  beforeEach(() => {
    mockContext = createMockRazorpayContext();

    mockContext.drizzleClient = {
      schema: {},
    };

    mockContext.graphql = {
      registerType: vi.fn(),
      registerQuery: vi.fn(),
      registerMutation: vi.fn(),
    };

    mockContext.fastify = {
      post: vi.fn(),
      register: vi.fn(),
    };

    mockContext.logger = {
      info: vi.fn(),
      error: vi.fn(),
      warn: vi.fn(),
      debug: vi.fn(),
    };
  });

  describe('onLoad', () => {
    it('should load plugin successfully', async () => {
      await onLoad(mockContext);
      expect(mockContext.logger.info).toHaveBeenCalledWith(
        expect.stringContaining('loaded'),
      );
    });
  });

  describe('onActivate', () => {
    it('should activate plugin successfully', async () => {
      await onActivate(mockContext);
      expect(mockContext.logger.info).toHaveBeenCalledWith(
        expect.stringContaining('activated'),
      );
    });
  });

  describe('onDeactivate', () => {
    it('should deactivate plugin successfully', async () => {
      await onDeactivate(mockContext);
      expect(mockContext.logger.info).toHaveBeenCalledWith(
        expect.stringContaining('deactivated'),
      );
    });
  });

  describe('onUnload', () => {
    it('should cleanup all resources', async () => {
      await onUnload(mockContext);
      expect(mockContext.logger.info).toHaveBeenCalled();
    });

    it('should handle errors during unload', async () => {
      const error = new Error('Unload failed');
      const errorSpy = vi.fn();
      mockContext.logger.error = errorSpy;
      mockContext.logger.info = vi.fn().mockImplementation(() => {
        throw error;
      });

      // Unload should not reject even if logging fails
      await expect(onUnload(mockContext)).resolves.toBeUndefined();

      // Error should be logged with proper message
      expect(errorSpy).toHaveBeenCalledWith(
        'Error during Razorpay plugin unload:',
        { error: 'Unload failed' },
      );
    });

    it('should have correct interface structure', () => {
      expect(typeof RazorpayPlugin.onLoad).toBe('function');
      expect(typeof RazorpayPlugin.onActivate).toBe('function');
      expect(typeof RazorpayPlugin.onDeactivate).toBe('function');
      expect(typeof RazorpayPlugin.onUnload).toBe('function');
    });
  });

  describe('lifecycle sequence', () => {
    it('should execute full lifecycle in correct order', async () => {
      const callOrder: string[] = [];
      mockContext.logger.info = vi.fn((msg: string) => {
        if (msg.includes('loaded successfully')) callOrder.push('load');
        else if (msg.includes('activated') && !msg.includes('de'))
          callOrder.push('activate');
        else if (msg.includes('deactivated')) callOrder.push('deactivate');
        else if (msg.includes('unloaded')) callOrder.push('unload');
      });

      await onLoad(mockContext);
      await onActivate(mockContext);
      await onDeactivate(mockContext);
      await onUnload(mockContext);

      expect(callOrder).toEqual(['load', 'activate', 'deactivate', 'unload']);
    });

    it('should handle activation without prior load', async () => {
      await expect(onActivate(mockContext)).resolves.not.toThrow();
    });

    it('should handle deactivation without prior activation', async () => {
      await expect(onDeactivate(mockContext)).resolves.not.toThrow();
    });
  });
});
