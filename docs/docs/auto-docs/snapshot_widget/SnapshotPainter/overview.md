# Overview for `SnapshotPainter`

## Description

A painter used to paint either a snapshot or the child widgets that
 would be a snapshot.

 The painter can call [notifyListeners] to have the [SnapshotWidget]
 re-paint (re-using the same raster). This allows animations to be performed
 without re-snapshotting of children. For certain scale or perspective changing
 transforms, such as a rotation, this can be significantly faster than performing
 the same animation at the widget level.

 By default, the [SnapshotWidget] includes a delegate that draws the child raster
 exactly as the child widgets would have been drawn. Nevertheless, this can
 also be used to efficiently transform the child raster and apply complex paint
 effects.

 

 The following method shows how to efficiently rotate the child raster.

 ```dart
 void paint(PaintingContext context, Offset offset, Size size, ui.Image image, double pixelRatio) 
 ```
 

## Dependencies

- ChangeNotifier

## Constructors

### Unnamed Constructor
Creates an instance of [SnapshotPainter].

