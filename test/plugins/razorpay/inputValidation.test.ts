import { describe, it, expect } from 'vitest';
import {
  razorpayConfigInputSchema,
  razorpayOrderInputSchema,
  razorpayPaymentInputSchema,
  razorpayVerificationInputSchema,
} from '../../../plugins/razorpay/api/graphql/inputs';

describe('Razorpay Input Validation', () => {
  describe('razorpayConfigInputSchema', () => {
    it('should validate valid config input', () => {
      const validInput = {
        keyId: 'rzp_test_key123',
        keySecret: 'secret123',
        webhookSecret: 'webhook_secret',
        isEnabled: true,
        testMode: true,
        currency: 'INR',
        description: 'Test donation',
      };

      const result = razorpayConfigInputSchema.safeParse(validInput);
      expect(result.success).toBe(true);
    });

    it('should accept nullable keyId', () => {
      const input = {
        keyId: null,
        keySecret: 'secret123',
        webhookSecret: 'webhook_secret',
        isEnabled: true,
        testMode: true,
        currency: 'INR',
        description: 'Test donation',
      };

      const result = razorpayConfigInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should accept nullable keySecret', () => {
      const input = {
        keyId: 'rzp_test_key123',
        keySecret: null,
        webhookSecret: 'webhook_secret',
        isEnabled: true,
        testMode: true,
        currency: 'INR',
        description: 'Test donation',
      };

      const result = razorpayConfigInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should require isEnabled boolean', () => {
      const input = {
        keyId: 'rzp_test_key123',
        keySecret: 'secret123',
        webhookSecret: 'webhook_secret',
        isEnabled: 'true', // String instead of boolean
        testMode: true,
        currency: 'INR',
        description: 'Test donation',
      };

      const result = razorpayConfigInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should require currency string', () => {
      const input = {
        keyId: 'rzp_test_key123',
        keySecret: 'secret123',
        webhookSecret: 'webhook_secret',
        isEnabled: true,
        testMode: true,
        currency: 123, // Number instead of string
        description: 'Test donation',
      };

      const result = razorpayConfigInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should reject missing required fields', () => {
      const input = {
        keyId: 'rzp_test_key123',
        // Missing required fields
      };

      const result = razorpayConfigInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });
  });

  describe('razorpayOrderInputSchema', () => {
    it('should validate valid order input', () => {
      const validInput = {
        organizationId: 'org-123',
        userId: 'user-123',
        amount: 100000,
        currency: 'INR',
        donorName: 'Test Donor',
        donorEmail: 'donor@example.com',
        donorPhone: '+919876543210',
        description: 'Test donation',
      };

      const result = razorpayOrderInputSchema.safeParse(validInput);
      expect(result.success).toBe(true);
    });

    it('should accept nullable organizationId', () => {
      const input = {
        organizationId: null,
        userId: 'user-123',
        amount: 100000,
        currency: 'INR',
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should accept nullable userId for anonymous donations', () => {
      const input = {
        organizationId: 'org-123',
        userId: null,
        amount: 100000,
        currency: 'INR',
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should require numeric amount', () => {
      const input = {
        organizationId: 'org-123',
        userId: 'user-123',
        amount: '100000', // String instead of number
        currency: 'INR',
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should reject zero amount', () => {
      const input = {
        organizationId: 'org-123',
        userId: 'user-123',
        amount: 0,
        currency: 'INR',
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should reject negative amount', () => {
      const input = {
        organizationId: 'org-123',
        userId: 'user-123',
        amount: -100,
        currency: 'INR',
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should reject non-integer (decimal) amounts', () => {
      const input = {
        organizationId: 'org-123',
        userId: 'user-123',
        amount: 100.5,
        currency: 'INR',
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should accept optional donor fields as null', () => {
      const input = {
        organizationId: 'org-123',
        userId: 'user-123',
        amount: 100000,
        currency: 'INR',
        donorName: null,
        donorEmail: null,
        donorPhone: null,
        description: null,
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });
  });

  describe('razorpayPaymentInputSchema', () => {
    it('should validate valid payment input', () => {
      const validInput = {
        orderId: 'order-db-123',
        paymentMethod: 'card',
        customerDetails: {
          name: 'Test Customer',
          email: 'customer@example.com',
          contact: '+919876543210',
        },
      };

      const result = razorpayPaymentInputSchema.safeParse(validInput);
      expect(result.success).toBe(true);
    });

    it('should require orderId', () => {
      const input = {
        paymentMethod: 'card',
        customerDetails: {
          name: 'Test Customer',
          email: 'customer@example.com',
          contact: '+919876543210',
        },
      };

      const result = razorpayPaymentInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should require paymentMethod', () => {
      const input = {
        orderId: 'order-db-123',
        customerDetails: {
          name: 'Test Customer',
          email: 'customer@example.com',
          contact: '+919876543210',
        },
      };

      const result = razorpayPaymentInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should accept null customerDetails', () => {
      const input = {
        orderId: 'order-db-123',
        paymentMethod: 'card',
        customerDetails: null,
      };

      const result = razorpayPaymentInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should validate customerDetails structure', () => {
      const input = {
        orderId: 'order-db-123',
        paymentMethod: 'card',
        customerDetails: {
          name: 'Test Customer',
          email: 'customer@example.com',
          // Missing contact
        },
      };

      const result = razorpayPaymentInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should accept different payment methods', () => {
      const methods = ['card', 'netbanking', 'wallet', 'upi'];

      methods.forEach((method) => {
        const input = {
          orderId: 'order-db-123',
          paymentMethod: method,
        };

        const result = razorpayPaymentInputSchema.safeParse(input);
        expect(result.success).toBe(true);
      });
    });
  });

  describe('razorpayVerificationInputSchema', () => {
    it('should validate valid verification input', () => {
      const validInput = {
        razorpayPaymentId: 'pay_test123',
        razorpayOrderId: 'order_test123',
        razorpaySignature: 'signature_hash_123',
        paymentData: 'order_test123|pay_test123',
      };

      const result = razorpayVerificationInputSchema.safeParse(validInput);
      expect(result.success).toBe(true);
    });

    it('should require razorpayPaymentId', () => {
      const input = {
        razorpayOrderId: 'order_test123',
        razorpaySignature: 'signature_hash_123',
        paymentData: 'order_test123|pay_test123',
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should require razorpayOrderId', () => {
      const input = {
        razorpayPaymentId: 'pay_test123',
        razorpaySignature: 'signature_hash_123',
        paymentData: 'order_test123|pay_test123',
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should require razorpaySignature', () => {
      const input = {
        razorpayPaymentId: 'pay_test123',
        razorpayOrderId: 'order_test123',
        paymentData: 'order_test123|pay_test123',
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should require paymentData', () => {
      const input = {
        razorpayPaymentId: 'pay_test123',
        razorpayOrderId: 'order_test123',
        razorpaySignature: 'signature_hash_123',
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should accept any string values', () => {
      const input = {
        razorpayPaymentId: 'any_value_1',
        razorpayOrderId: 'any_value_2',
        razorpaySignature: 'any_value_3',
        paymentData: 'any_value_4',
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should reject numeric values for string fields', () => {
      const input = {
        razorpayPaymentId: 12345,
        razorpayOrderId: 'order_test123',
        razorpaySignature: 'signature_hash_123',
        paymentData: 'order_test123|pay_test123',
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });
  });

  describe('edge cases', () => {
    it('should reject empty strings where required', () => {
      const input = {
        razorpayPaymentId: '',
        razorpayOrderId: '',
        razorpaySignature: '',
        paymentData: '',
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(false);
    });

    it('should handle very long strings', () => {
      const longString = 'a'.repeat(10000);
      const input = {
        razorpayPaymentId: longString,
        razorpayOrderId: longString,
        razorpaySignature: longString,
        paymentData: longString,
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should handle special characters in strings', () => {
      const specialChars = '!@#$%^&*()_+-={}[]|:";\'<>?,./';
      const input = {
        razorpayPaymentId: specialChars,
        razorpayOrderId: specialChars,
        razorpaySignature: specialChars,
        paymentData: specialChars,
      };

      const result = razorpayVerificationInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });

    it('should handle unicode characters', () => {
      const input = {
        donorName: '测试用户',
        donorEmail: 'test@example.com',
        amount: 100000,
        currency: 'INR',
      };

      const result = razorpayOrderInputSchema.safeParse(input);
      expect(result.success).toBe(true);
    });
  });
});
