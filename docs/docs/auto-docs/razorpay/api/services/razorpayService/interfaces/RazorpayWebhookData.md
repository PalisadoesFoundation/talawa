[Plugin Docs](/)

***

# Interface: RazorpayWebhookData

Defined in: [plugins/razorpay/api/services/razorpayService.ts:26](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L26)

## Properties

### account\_id

> **account\_id**: `string`

Defined in: [plugins/razorpay/api/services/razorpayService.ts:28](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L28)

***

### contains

> **contains**: `string`[]

Defined in: [plugins/razorpay/api/services/razorpayService.ts:30](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L30)

***

### entity

> **entity**: `string`

Defined in: [plugins/razorpay/api/services/razorpayService.ts:27](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L27)

***

### event

> **event**: `string`

Defined in: [plugins/razorpay/api/services/razorpayService.ts:29](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L29)

***

### payload

> **payload**: `object`

Defined in: [plugins/razorpay/api/services/razorpayService.ts:31](https://github.com/PalisadoesFoundation/talawa-plugin/tree/main/plugins/razorpay/api/services/razorpayService.ts#L31)

#### payment

> **payment**: `object`

##### payment.entity

> **entity**: `object`

##### payment.entity.amount

> **amount**: `number`

##### payment.entity.amount\_refunded

> **amount\_refunded**: `number`

##### payment.entity.bank

> **bank**: `string`

##### payment.entity.captured

> **captured**: `boolean`

##### payment.entity.card\_id

> **card\_id**: `string`

##### payment.entity.contact

> **contact**: `string`

##### payment.entity.created\_at

> **created\_at**: `number`

##### payment.entity.currency

> **currency**: `string`

##### payment.entity.description

> **description**: `string`

##### payment.entity.email

> **email**: `string`

##### payment.entity.entity

> **entity**: `string`

##### payment.entity.error\_code

> **error\_code**: `string`

##### payment.entity.error\_description

> **error\_description**: `string`

##### payment.entity.fee

> **fee**: `number`

##### payment.entity.id

> **id**: `string`

##### payment.entity.method

> **method**: `string`

##### payment.entity.order\_id

> **order\_id**: `string`

##### payment.entity.refund\_status

> **refund\_status**: `string`

##### payment.entity.status

> **status**: `string`

##### payment.entity.tax

> **tax**: `number`

##### payment.entity.vpa

> **vpa**: `string`

##### payment.entity.wallet

> **wallet**: `string`
