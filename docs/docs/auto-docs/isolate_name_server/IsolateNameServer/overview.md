# Overview for `IsolateNameServer`

## Description

Static methods to allow for simple sharing of [SendPort]s across [Isolate]s.

 All isolates share a global mapping of names to ports. An isolate can
 register a [SendPort] with a given name using [registerPortWithName];
 another isolate can then look up that port using [lookupPortByName].

 To create a [SendPort], first create a [ReceivePort], then use
 [ReceivePort.sendPort].

 Since multiple isolates can each obtain the same [SendPort] associated with
 a particular [ReceivePort], the protocol built on top of this mechanism
 should typically consist of a single message. If more elaborate two-way
 communication or multiple-message communication is necessary, it is
 recommended to establish a separate communication channel in that first
 message (e.g. by passing a dedicated [SendPort]).

