# Overview for `PlatformException`

## Description

Thrown to indicate that a platform interaction failed in the platform
 plugin.

 See also:

  * [MethodCodec], which throws a [PlatformException], if a received result
    envelope represents an error.
  * [MethodChannel.invokeMethod], which completes the returned future
    with a [PlatformException], if invoking the platform plugin method
    results in an error envelope.
  * [EventChannel.receiveBroadcastStream], which emits
    [PlatformException]s as error events, whenever an event received from the
    platform plugin is wrapped in an error envelope.

## Dependencies

- Exception

## Members

- **code**: `String`
  An error code.

- **message**: `String?`
  A human-readable error message, possibly null.

- **details**: `dynamic`
  Error details, possibly null.

 This property is `dynamic`, which means type-checking is skipped when accessing
 this property. To minimize the risk of type errors at runtime, the value should
 be cast to `Object?` when accessed.

- **stacktrace**: `String?`
  Native stacktrace for the error, possibly null.

 This contains the native platform stack trace, not the Dart stack trace.

 The stack trace for Dart exceptions can be obtained using try-catch blocks, for example:

 ```dart
 try  catch (e, stacktrace) 
 ```

 On Android this field is populated when a `RuntimeException` or a subclass of it is thrown in the method call handler,
 as shown in the following example:

 ```kotlin
 import androidx.annotation.NonNull
 import io.flutter.embedding.android.FlutterActivity
 import io.flutter.embedding.engine.FlutterEngine
 import io.flutter.plugin.common.MethodChannel

 class MainActivity:  
 ```

 It is also populated on Android if the method channel result is not serializable.
 If the result is not serializable, an exception gets thrown during the serialization process.
 This can be seen in the following example:

 ```kotlin
 import androidx.annotation.NonNull
 import io.flutter.embedding.android.FlutterActivity
 import io.flutter.embedding.engine.FlutterEngine
 import io.flutter.plugin.common.MethodChannel

 class MainActivity:  
 ```

 In the cases described above, the content of [stacktrace] will be the unprocessed output of calling `` on the exception.

 MacOS, iOS, Linux and Windows don't support querying the native stacktrace.

 On custom Flutter embedders this value will be null on platforms that don't support querying the call stack.

## Constructors

### Unnamed Constructor
Creates a [PlatformException] with the specified error [code] and optional
 [message], and with the optional error [details] which must be a valid
 value for the [MethodCodec] involved in the interaction.

