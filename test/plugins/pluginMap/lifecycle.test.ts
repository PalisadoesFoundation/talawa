import { describe, it, expect, vi, beforeEach } from 'vitest';
import * as lifecycle from '../../../plugins/pluginMap/api/index';

describe('Plugin Map Lifecycle Hooks', () => {
  let mockContext: any;

  beforeEach(() => {
    mockContext = {
      logger: {
        info: vi.fn(),
        warn: vi.fn(),
        error: vi.fn(),
        debug: vi.fn(),
      },
      db: {
        select: vi.fn().mockReturnThis(),
        from: vi.fn().mockReturnThis(),
        limit: vi.fn().mockResolvedValue([]),
      },
    };
  });

  describe('onLoad', () => {
    it('should log success and verify table', async () => {
      if (lifecycle.onLoad) {
        await lifecycle.onLoad(mockContext);
        expect(mockContext.logger.info).toHaveBeenCalledWith(
          'Plugin Map Plugin loaded successfully',
        );
      }
    });

    it('should handle verification failure gracefully', async () => {
      if (lifecycle.onLoad) {
        mockContext.db.limit.mockRejectedValue(new Error('Table not found'));
        await lifecycle.onLoad(mockContext);
        expect(mockContext.logger.warn).toHaveBeenCalledWith(
          'Failed to verify plugin table:',
          expect.any(Error),
        );
      }
    });
  });

  describe('onActivate', () => {
    it('should log activation', async () => {
      if (lifecycle.onActivate) {
        await lifecycle.onActivate(mockContext);
        expect(mockContext.logger.info).toHaveBeenCalledWith(
          'Plugin Map Plugin activated',
        );
      }
    });
  });

  describe('onDeactivate', () => {
    it('should log deactivation', async () => {
      if (lifecycle.onDeactivate) {
        await lifecycle.onDeactivate(mockContext);
        expect(mockContext.logger.info).toHaveBeenCalledWith(
          'Plugin Map Plugin deactivated',
        );
      }
    });
  });

  describe('onUnload', () => {
    it('should log unloading', async () => {
      if (lifecycle.onUnload) {
        await lifecycle.onUnload(mockContext);
        expect(mockContext.logger.info).toHaveBeenCalledWith(
          'Plugin Map Plugin unloaded',
        );
      }
    });
  });

  describe('onPluginActivated', () => {
    it('should log activation via hook', async () => {
      if (lifecycle.onPluginActivated) {
        await lifecycle.onPluginActivated(mockContext);
        expect(mockContext.logger.info).toHaveBeenCalledWith(
          'Plugin Map Plugin activated via hook',
        );
      }
    });
  });

  describe('onPluginDeactivated', () => {
    it('should log deactivation via hook', async () => {
      if (lifecycle.onPluginDeactivated) {
        await lifecycle.onPluginDeactivated(mockContext);
        expect(mockContext.logger.info).toHaveBeenCalledWith(
          'Plugin Map Plugin deactivated via hook',
        );
      }
    });
  });

  describe('getPluginInfo', () => {
    it('should return correct plugin information', () => {
      const info = lifecycle.getPluginInfo();
      expect(info.name).toBe('Plugin Map');
      expect(info.version).toBe('1.0.0');
      expect(info.graphqlOperations).toContain('getExtensionPointsOverview');
    });
  });
});
