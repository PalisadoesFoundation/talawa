[Plugin Docs](/)

***

# Class: RazorpayService

Defined in: [plugins/razorpay/api/services/razorpayService.ts:113](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L113)

Service class for handling Razorpay payment gateway operations.
Manages orders, payments, verification, and webhooks.

## Constructors

### Constructor

> **new RazorpayService**(`context`, `razorpayInstance?`): `RazorpayService`

Defined in: [plugins/razorpay/api/services/razorpayService.ts:117](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L117)

#### Parameters

##### context

`GraphQLContext`

##### razorpayInstance?

`Razorpay`

#### Returns

`RazorpayService`

## Methods

### createOrder()

> **createOrder**(`orderData`): `Promise`\<[`RazorpayOrder`](../interfaces/RazorpayOrder.md)\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:159](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L159)

Creates a new payment order in Razorpay.

#### Parameters

##### orderData

[`RazorpayOrderData`](../interfaces/RazorpayOrderData.md)

The order details including amount, currency, and receipt.

#### Returns

`Promise`\<[`RazorpayOrder`](../interfaces/RazorpayOrder.md)\>

The created Razorpay order object.

#### Throws

Error if API credentials are invalid or unrelated errors occur.

***

### createPayment()

> **createPayment**(`paymentData`): `Promise`\<[`RazorpayPayment`](../interfaces/RazorpayPayment.md)\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:230](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L230)

Creates a payment entry in Razorpay (note: usually handled on client side, but this wraps server-side creating if needed).

#### Parameters

##### paymentData

[`RazorpayPaymentData`](../interfaces/RazorpayPaymentData.md)

Payment details.

#### Returns

`Promise`\<[`RazorpayPayment`](../interfaces/RazorpayPayment.md)\>

The created payment object.

***

### getPaymentDetails()

> **getPaymentDetails**(`paymentId`): `Promise`\<[`RazorpayPayment`](../interfaces/RazorpayPayment.md)\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:513](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L513)

Fetches details of a specific payment from Razorpay.

#### Parameters

##### paymentId

`string`

The ID of the payment to fetch.

#### Returns

`Promise`\<[`RazorpayPayment`](../interfaces/RazorpayPayment.md)\>

The payment details object.

***

### initialize()

> **initialize**(): `Promise`\<`void`\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:129](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L129)

Initializes the Razorpay instance with credentials from the database.
Fetches configuration from `configTable`.

#### Returns

`Promise`\<`void`\>

#### Throws

Error if configuration is missing or incomplete.

***

### processWebhook()

> **processWebhook**(`webhookData`): `Promise`\<`void`\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:408](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L408)

Processes a verified webhook event from Razorpay.
Updates order and transaction status based on the event payload.

#### Parameters

##### webhookData

[`RazorpayWebhookData`](../interfaces/RazorpayWebhookData.md)

The parsed webhook data.

#### Returns

`Promise`\<`void`\>

***

### refundPayment()

> **refundPayment**(`paymentId`, `amount?`): `Promise`\<[`RazorpayRefund`](../interfaces/RazorpayRefund.md)\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:534](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L534)

Initiates a refund for a specific payment.

#### Parameters

##### paymentId

`string`

The ID of the payment to refund.

##### amount?

`number`

Optional amount to refund (if partial).

#### Returns

`Promise`\<[`RazorpayRefund`](../interfaces/RazorpayRefund.md)\>

The refund object.

***

### testConnection()

> **testConnection**(): `Promise`\<\{ `message`: `string`; `success`: `boolean`; \}\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:559](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L559)

Tests the connection to Razorpay API using current configuration.

#### Returns

`Promise`\<\{ `message`: `string`; `success`: `boolean`; \}\>

Object containing success status and message.

***

### verifyPayment()

> **verifyPayment**(`paymentId`, `orderId`, `signature`, `paymentData`): `Promise`\<`boolean`\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:267](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L267)

Verifies a payment signature using the webhook secret.

#### Parameters

##### paymentId

`string`

The ID of the payment.

##### orderId

`string`

The ID of the order.

##### signature

`string`

The signature to verify.

##### paymentData

`string`

The data payload to verify against.

#### Returns

`Promise`\<`boolean`\>

Boolean indicating if the signature is valid.

***

### verifyPaymentSignature()

> **verifyPaymentSignature**(`orderId`, `paymentId`, `signature`): `Promise`\<`boolean`\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:323](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L323)

Verifies the signature of a payment associated with an order using the Key Secret.

#### Parameters

##### orderId

`string`

The Razorpay order ID.

##### paymentId

`string`

The Razorpay payment ID.

##### signature

`string`

The signature generated by Razorpay.

#### Returns

`Promise`\<`boolean`\>

Boolean indicating if the signature is valid.

***

### verifyWebhookSignature()

> **verifyWebhookSignature**(`webhookBody`, `signature`): `Promise`\<`boolean`\>

Defined in: [plugins/razorpay/api/services/razorpayService.ts:369](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L369)

Verifies the signature of a webhook payload.

#### Parameters

##### webhookBody

`string`

The raw body of the webhook request.

##### signature

`string`

The X-Razorpay-Signature header value.

#### Returns

`Promise`\<`boolean`\>

Boolean indicating if the signature is valid.
