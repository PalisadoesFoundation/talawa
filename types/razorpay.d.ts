declare module 'razorpay' {
  export interface RazorpayOptions {
    key_id: string;
    key_secret: string;
    headers?: Record<string, string>;
  }

  export interface CreateOrderParams {
    amount: number;
    currency: string;
    receipt?: string;
    notes?: Record<string, string>;
    /**
     * @deprecated This field is deprecated. Use Dashboard capture settings or
     * the Payments Capture API instead. See: https://razorpay.com/docs/api/payments/capture/
     */
    payment_capture?: 0 | 1;
    [key: string]: any;
  }

  export interface OrderResponse {
    id: string;
    entity: string;
    amount: number;
    currency: string;
    receipt?: string;
    status: string;
    created_at: number;
    [key: string]: any;
  }

  export interface PaymentResponse {
    id: string;
    entity: string;
    amount: number;
    currency: string;
    status: string;
    order_id: string;
    method: string;
    [key: string]: any;
  }

  export interface RefundParams {
    amount?: number;
    receipt?: string;
    notes?: Record<string, string>;
    [key: string]: any;
  }

  export interface RefundResponse {
    id: string;
    entity: string;
    amount: number;
    status: string;
    [key: string]: any;
  }

  export interface Orders {
    create(params: CreateOrderParams): Promise<OrderResponse>;
    fetch(orderId: string): Promise<OrderResponse>;
  }

  export interface Payments {
    fetch(paymentId: string): Promise<PaymentResponse>;
    capture(
      paymentId: string,
      params: {
        amount: number;
        currency: string;
      },
    ): Promise<PaymentResponse>;
    refund(paymentId: string, params?: RefundParams): Promise<RefundResponse>;
  }

  export interface Refunds {
    create(params: RefundParams): Promise<RefundResponse>;
  }

  export default class Razorpay {
    constructor(options: RazorpayOptions);
    orders: Orders;
    payments: Payments;
    refunds: Refunds;

    static validateWebhookSignature(
      body: string,
      signature: string,
      secret: string,
    ): boolean;
  }
}
