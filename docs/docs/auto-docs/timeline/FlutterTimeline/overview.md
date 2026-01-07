# Overview for `FlutterTimeline`

## Description

Measures how long blocks of code take to run.

 This class can be used as a drop-in replacement for [Timeline] as it
 provides methods compatible with [Timeline] signature-wise, and it has
 minimal overhead.

 Provides [debugReset] and [debugCollect] methods that make it convenient to use in
 frame-oriented environment where collected metrics can be attributed to a
 frame, then aggregated into frame statistics, e.g. frame averages.

 Forwards measurements to [Timeline] so they appear in Flutter DevTools.

## Members

- **_buffer**: `_BlockBuffer`
- **_collectionEnabled**: `bool`
