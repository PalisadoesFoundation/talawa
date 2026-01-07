# Overview for `LicenseEntry`

## Description

A license that covers part of the application's software or assets, to show
 in an interface such as the [LicensePage].

 For optimal performance, [LicenseEntry] objects should only be created on
 demand in [LicenseEntryCollector] callbacks passed to
 [LicenseRegistry.addLicense].

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

