# Overview for `ImageInfo`

## Description

A [dart:ui.Image] object with its corresponding scale.

 ImageInfo objects are used by [ImageStream] objects to represent the
 actual data of the image once it has been obtained.

 The disposing contract for [ImageInfo] (as well as for [ui.Image])
 is different from traditional one, where
 an object should dispose a member if the object created the member.
 Instead, the disposal contract is as follows:

 * [ImageInfo] disposes [image], even if it is received as a constructor argument.
 * [ImageInfo] is expected to be disposed not by the object, that created it,
 but by the object that owns reference to it.
 * It is expected that only one object owns reference to [ImageInfo] object.

 Safety tips:

  * To share the [ImageInfo] or [ui.Image] between objects, use the [clone] method,
 which will not clone the entire underlying image, but only reference to it and information about it.
  * After passing a [ui.Image] or [ImageInfo] reference to another object,
 release the reference.

## Members

- **image**: `ui.Image`
  The raw image pixels.

 This is the object to pass to the [Canvas.drawImage],
 [Canvas.drawImageRect], or [Canvas.drawImageNine] methods when painting
 the image.

- **scale**: `double`
  The linear scale factor for drawing this image at its intended size.

 The scale factor applies to the width and the height.

 
 For example, if this is 2.0, it means that there are four image pixels for
 every one logical pixel, and the image's actual width and height (as given
 by the [dart:ui.Image.width] and [dart:ui.Image.height] properties) are
 double the height and width that should be used when painting the image
 (e.g. in the arguments given to [Canvas.drawImage]).
 

- **debugLabel**: `String?`
  A string used for debugging purposes to identify the source of this image.

## Constructors

### Unnamed Constructor
Creates an [ImageInfo] object for the given [image] and [scale].

 The [debugLabel] may be used to identify the source of this image.

 See details for disposing contract in the class description.

