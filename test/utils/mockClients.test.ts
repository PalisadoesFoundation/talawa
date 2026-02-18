import { describe, it, expect } from 'vitest';
import {
  createMockFastifyRequest,
  createMockFastifyReply,
  createMockGraphQLClient,
  createMockPaymentGateway,
} from './mockClients';

describe('mockClients utilities', () => {
  describe('createMockFastifyRequest', () => {
    it('should create a request with default values', () => {
      const req = createMockFastifyRequest();
      expect(req.id).toBe('req-123');
      expect(req.log.info).toBeDefined();
    });

    it('should allow overrides', () => {
      const req = createMockFastifyRequest({ body: { foo: 'bar' } });
      expect(req.body).toEqual({ foo: 'bar' });
    });
  });

  describe('createMockFastifyReply', () => {
    it('should create a chainable reply mock', () => {
      const reply = createMockFastifyReply();
      expect(reply.code(200)).toBe(reply); // Chainable
      expect(reply.send({})).toBe(reply); // Chainable
      expect(reply.header('x', 'y')).toBe(reply); // Chainable
    });
  });

  describe('createMockGraphQLClient', () => {
    it('should create a client with mocked methods', async () => {
      const client = createMockGraphQLClient();
      expect(client.query).toBeDefined();
      expect(client.mutate).toBeDefined();

      const result = await client.query('query { test }');
      expect(result).toEqual({ data: {} });

      const mutationResult = await client.mutate('mutation { update }');
      expect(mutationResult).toEqual({ data: {} });
    });
  });

  describe('createMockPaymentGateway', () => {
    it('should create a gateway with mocked methods', async () => {
      const gateway = createMockPaymentGateway();
      expect(gateway.processPayment).toBeDefined();
      expect(gateway.createRefund).toBeDefined();
      expect(gateway.verifyWebhook).toBeDefined();

      const result = await gateway.processPayment({
        amount: 100,
        currency: 'USD',
      });
      expect(result).toEqual({ success: true, id: 'pay-123' });

      const refundResult = await gateway.createRefund('test-txn', 50);
      expect(refundResult).toEqual({ success: true, id: 'ref-123' });

      const webhookResult = gateway.verifyWebhook({}, 'signature');
      expect(webhookResult).toBe(true);
    });
  });
});
