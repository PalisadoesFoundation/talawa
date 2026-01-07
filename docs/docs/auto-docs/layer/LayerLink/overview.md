# Overview for `LayerLink`

## Description

An object that a [LeaderLayer] can register with.

 An instance of this class should be provided as the [LeaderLayer.link] and
 the [FollowerLayer.link] properties to cause the [FollowerLayer] to follow
 the [LeaderLayer].

 See also:

  * [CompositedTransformTarget], the widget that creates a [LeaderLayer].
  * [CompositedTransformFollower], the widget that creates a [FollowerLayer].
  * [RenderLeaderLayer] and [RenderFollowerLayer], the corresponding
    render objects.

## Members

- **_leader**: `LeaderLayer?`
- **_debugPreviousLeaders**: `Set&lt;LeaderLayer&gt;?`
  Stores the previous leaders that were replaced by the current [_leader]
 in the current frame.

 These leaders need to give up their leaderships of this link by the end of
 the current frame.

- **_debugLeaderCheckScheduled**: `bool`
- **leaderSize**: `Size?`
  The total size of the content of the connected [LeaderLayer].

 Generally this should be set by the [RenderObject] that paints on the
 registered [LeaderLayer] (for instance a [RenderLeaderLayer] that shares
 this link with its followers). This size may be outdated before and during
 layout.

