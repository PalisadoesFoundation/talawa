# Method: `layoutExtent`

## Description

The current amount of overlap being absorbed by the
 [SliverOverlapAbsorber].

 This corresponds to the [SliverGeometry.layoutExtent] of the child of the
 [SliverOverlapAbsorber].

 This is updated during the layout of the [SliverOverlapAbsorber]. It
 should not change at any other time. No notifications are sent when it
 changes; clients (e.g. [SliverOverlapInjector]s) are responsible for
 marking themselves dirty whenever this object sends notifications, which
 happens any time the [SliverOverlapAbsorber] might subsequently change the
 value during that layout.

## Return Type
`double?`

