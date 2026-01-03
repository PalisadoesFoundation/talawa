# Overview for `Campaign`

## Description

The `Campaign` class represents a fundraising campaign in the application.

## Members

- **id**: `String?`
  The unique identifier of the campaign.

- **fundId**: `String?`
  The identifier of the fund to which the campaign belongs.

- **name**: `String?`
  The name of the campaign.

- **startDate**: `DateTime?`
  The start date of the campaign.

- **endDate**: `DateTime?`
  The end date of the campaign.

- **goalAmount**: `double?`
  The funding goal of the campaign.

- **pledgedAmount**: `double?`
  Total amount of money pledged under the fund campaign.

- **currency**: `String?`
  The currency used for the campaign.

- **pledges**: `List<Pledge>?`
  A list of pledge identifiers associated with the campaign.

## Constructors

### Unnamed Constructor
Constructs a `FundraisingCampaign` instance.

 [id] is the unique identifier of the campaign.
 [fundId] is the identifier of the fund to which the campaign belongs.
 [name] is the name of the campaign.
 [startDate] is the start date of the campaign.
 [endDate] is the end date of the campaign.
 [currency] is the currency used for the campaign.
 [pledges] is a list of pledge identifiers associated with the campaign.
 [pledgedAmount] is the total amount pledged to the campaign.
 [goalAmount] is the funding goal of the campaign.

### fromJson
Creates a `Campaign` instance from a JSON object.

 The [json] parameter is a map containing the campaign data.

 Returns an instance of `Campaign`.

#### Parameters

- `json`: `Map<String, dynamic>`
