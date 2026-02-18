import { z } from 'zod';
import { builder } from '~/src/graphql/builder';

// Razorpay Config Input
export const razorpayConfigInputSchema = z.object({
  keyId: z.string().nullable().optional(),
  keySecret: z.string().nullable().optional(),
  webhookSecret: z.string().nullable().optional(),
  isEnabled: z.boolean(),
  testMode: z.boolean(),
  currency: z.string(),
  description: z.string(),
});

export const RazorpayConfigInput = builder
  .inputRef<z.infer<typeof razorpayConfigInputSchema>>('RazorpayConfigInput')
  .implement({
    description: 'Input for Razorpay configuration',
    fields: (t) => ({
      keyId: t.string({ required: false }),
      keySecret: t.string({ required: false }),
      webhookSecret: t.string({ required: false }),
      isEnabled: t.boolean({ required: true }),
      testMode: t.boolean({ required: true }),
      currency: t.string({ required: true }),
      description: t.string({ required: true }),
    }),
  });

// Razorpay Order Input
export const razorpayOrderInputSchema = z.object({
  organizationId: z.string().nullable().optional(),
  userId: z.string().nullable().optional(),
  amount: z.number().int().positive(),
  currency: z.string(),
  donorName: z.string().nullable().optional(),
  donorEmail: z.string().nullable().optional(),
  donorPhone: z.string().nullable().optional(),
  description: z.string().nullable().optional(),
});

export const RazorpayOrderInput = builder
  .inputRef<z.infer<typeof razorpayOrderInputSchema>>('RazorpayOrderInput')
  .implement({
    description: 'Input for creating a Razorpay order',
    fields: (t) => ({
      organizationId: t.string({ required: false }),
      userId: t.string({ required: false }),
      amount: t.int({ required: true }),
      currency: t.string({ required: true }),
      donorName: t.string({ required: false }),
      donorEmail: t.string({ required: false }),
      donorPhone: t.string({ required: false }),
      description: t.string({ required: false }),
    }),
  });

// Razorpay Payment Input
export const razorpayPaymentInputSchema = z.object({
  orderId: z.string(),
  paymentMethod: z.string(),
  customerDetails: z
    .object({
      name: z.string(),
      email: z.string(),
      contact: z.string(),
    })
    .nullable()
    .optional(),
});

export const RazorpayPaymentInput = builder
  .inputRef<z.infer<typeof razorpayPaymentInputSchema>>('RazorpayPaymentInput')
  .implement({
    description: 'Input for initiating a Razorpay payment',
    fields: (t) => ({
      orderId: t.string({ required: true }),
      paymentMethod: t.string({ required: true }),
      customerDetails: t.field({
        type: builder.inputType('RazorpayCustomerDetails', {
          fields: (t) => ({
            name: t.string({ required: true }),
            email: t.string({ required: true }),
            contact: t.string({ required: true }),
          }),
        }),
        required: false,
      }),
    }),
  });

// Razorpay Verification Input
export const razorpayVerificationInputSchema = z.object({
  razorpayPaymentId: z.string().min(1),
  razorpayOrderId: z.string().min(1),
  razorpaySignature: z.string().min(1),
  paymentData: z.string().min(1),
});

export const RazorpayVerificationInput = builder
  .inputRef<
    z.infer<typeof razorpayVerificationInputSchema>
  >('RazorpayVerificationInput')
  .implement({
    description: 'Input for verifying a Razorpay payment',
    fields: (t) => ({
      razorpayPaymentId: t.string({ required: true }),
      razorpayOrderId: t.string({ required: true }),
      razorpaySignature: t.string({ required: true }),
      paymentData: t.string({ required: true }),
    }),
  });
