# Overview for `OneFrameImageStreamCompleter`

## Description

Manages the loading of [dart:ui.Image] objects for static [ImageStream]s (those
 with only one frame).

## Dependencies

- ImageStreamCompleter

## Constructors

### Unnamed Constructor
Creates a manager for one-frame [ImageStream]s.

 The image resource awaits the given [Future]. When the future resolves,
 it notifies the [ImageListener]s that have been registered with
 [addListener].

 The [InformationCollector], if provided, is invoked if the given [Future]
 resolves with an error, and can be used to supplement the reported error
 message (for example, giving the image's URL).

 Errors are reported using [FlutterError.reportError] with the `silent`
 argument on [FlutterErrorDetails] set to true, meaning that by default the
 message is only dumped to the console in debug mode (see [
 FlutterErrorDetails]).

