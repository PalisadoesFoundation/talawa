# Overview for `RenderProxyBoxWithHitTestBehavior`

## Description

A RenderProxyBox subclass that allows you to customize the
 hit-testing behavior.

## Dependencies

- RenderProxyBox

## Members

- **behavior**: `HitTestBehavior`
  How to behave during hit testing when deciding how the hit test propagates
 to children and whether to consider targets behind this one.

 Defaults to [HitTestBehavior.deferToChild].

 See [HitTestBehavior] for the allowed values and their meanings.

## Constructors

### Unnamed Constructor
Initializes member variables for subclasses.

 By default, the [behavior] is [HitTestBehavior.deferToChild].

