# Overview for `AutofillScope`

## Description

An ordered group within which [AutofillClient]s are logically connected.

 
 [AutofillClient]s within the same [AutofillScope] are isolated from other
 input fields during autofill. That is, when an autofillable [TextInputClient]
 gains focus, only the [AutofillClient]s within the same [AutofillScope] will
 be visible to the autofill service, in the same order as they appear in
 [AutofillScope.autofillClients].

 [AutofillScope] also allows [TextInput] to redirect autofill values from the
 platform to the [AutofillClient] with the given identifier, by calling
 [AutofillScope.getAutofillClient].

 An [AutofillClient] that's not tied to any [AutofillScope] will only
 participate in autofill if the autofill is directly triggered by its own
 [TextInputClient].
 

