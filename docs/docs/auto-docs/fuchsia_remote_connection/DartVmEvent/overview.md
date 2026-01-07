# Overview for `DartVmEvent`

## Description

An event regarding the Dart VM.

 Specifies the type of the event (whether the VM has started or has stopped),
 and contains the service port of the VM as well as a URL to connect to it.

## Members

- **uri**: `Uri`
  The URL used to connect to the Dart VM.

- **eventType**: `DartVmEventType`
  The type of event regarding this instance of the Dart VM.

- **servicePort**: `int`
  The port on the host machine that the Dart VM service is/was running on.

## Constructors

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
