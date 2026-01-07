# Overview for `RenderRepaintBoundary`

## Description

Creates a separate display list for its child.

 This render object creates a separate display list for its child, which
 can improve performance if the subtree repaints at different times than
 the surrounding parts of the tree. Specifically, when the child does not
 repaint but its parent does, we can re-use the display list we recorded
 previously. Similarly, when the child repaints but the surround tree does
 not, we can re-record its display list without re-recording the display list
 for the surround tree.

 In some cases, it is necessary to place _two_ (or more) repaint boundaries
 to get a useful effect. Consider, for example, an e-mail application that
 shows an unread count and a list of e-mails. Whenever a new e-mail comes in,
 the list would update, but so would the unread count. If only one of these
 two parts of the application was behind a repaint boundary, the entire
 application would repaint each time. On the other hand, if both were behind
 a repaint boundary, a new e-mail would only change those two parts of the
 application and the rest of the application would not repaint.

 To tell if a particular RenderRepaintBoundary is useful, run your
 application in debug mode, interacting with it in typical ways, and then
 call [debugDumpRenderTree]. Each RenderRepaintBoundary will include the
 ratio of cases where the repaint boundary was useful vs the cases where it
 was not. These counts can also be inspected programmatically using
 [debugAsymmetricPaintCount] and [debugSymmetricPaintCount] respectively.

## Dependencies

- RenderProxyBox

## Members

- **_debugSymmetricPaintCount**: `int`
- **_debugAsymmetricPaintCount**: `int`
## Constructors

### Unnamed Constructor
Creates a repaint boundary around [child].

