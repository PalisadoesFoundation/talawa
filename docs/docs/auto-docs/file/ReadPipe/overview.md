# Overview for `ReadPipe`

## Description

The "read" end of an [Pipe] created by [Pipe.create].

 The read stream will continue to listen until the "write" end of the
 pipe (i.e. [Pipe.write]) is closed.

 ```dart
 final pipe = await Pipe.;
 pipe.read.transform(utf8.decoder).listen((data) , onDone:  => print('Done'));
 ```

## Dependencies

- Stream

