# Method: `debugCollectionEnabled`

## Description

Enables metric collection.

 Metric collection can only be enabled in non-release modes. It is most
 useful in profile mode where application performance is representative
 of a deployed application.

 When disabled, resets collected data by calling [debugReset].

 Throws a [StateError] if invoked in release mode.

## Parameters

- `value`: `bool`
