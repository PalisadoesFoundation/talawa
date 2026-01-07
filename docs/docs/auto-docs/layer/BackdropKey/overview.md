# Overview for `BackdropKey`

## Description

A backdrop key uniquely identifies the backdrop that a [BackdropFilterLayer]
 samples from.

 When multiple backdrop filters share the same key, the Flutter engine can
 more efficiently perform the backdrop operations.

 Instead of using a backdrop key directly, consider using a [BackdropGroup]
 and the [BackdropFilter.grouped] constructor. The framework will
 automatically group child backdrop filters that use the `.grouped`
 constructor when they are placed as children of a [BackdropGroup].

 For more information, see [BackdropFilter].

## Members

- **_nextKey**: `int`
- **_key**: `int`
## Constructors

### Unnamed Constructor
Create a new [BackdropKey].

