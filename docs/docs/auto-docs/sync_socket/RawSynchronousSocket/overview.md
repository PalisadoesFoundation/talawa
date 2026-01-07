# Overview for `RawSynchronousSocket`

## Description

A low-level class for communicating synchronously over a TCP socket.

 Warning: [RawSynchronousSocket] should probably only be used to connect to
 'localhost'. The operations below will block the calling thread to wait for
 a response from the network. The thread can process no other events while
 waiting for these operations to complete. [RawSynchronousSocket] is not
 suitable for applications that require high performance or asynchronous I/O
 such as a server. Instead such applications should use the non-blocking
 sockets and asynchronous operations in the [Socket] or [RawSocket] classes.

