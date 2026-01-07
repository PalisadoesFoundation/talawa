# Overview for `NetworkImage`

## Description

Fetches the given URL from the network, associating it with the given scale.

 The image will be cached regardless of cache headers from the server.

 Typically this class resolves to an image stream that ultimately produces
 [dart:ui.Image]s. On the Web platform, the [webHtmlElementStrategy]
 parameter can be used to make the image stream ultimately produce an
 [WebImageInfo] instead, which makes [Image.network] display the image as an
 HTML element in a platform view. The feature is by default turned off
 ([WebHtmlElementStrategy.never]). See [Image.network] for more explanation.

 See also:

  * [Image.network] for a shorthand of an [Image] widget backed by [NetworkImage].
  * The example at [ImageProvider], which shows a custom variant of this class
    that applies different logic for fetching the image.

## Dependencies

- ImageProvider

## Constructors

### Unnamed Constructor
Creates an object that fetches the image at the given URL.

 The [scale] argument is the linear scale factor for drawing this image at
 its intended size. See [ImageInfo.scale] for more information.

 The [webHtmlElementStrategy] option is by default
 [WebHtmlElementStrategy.never].

