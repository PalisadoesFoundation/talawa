# Overview for `StreamBuilderBase`

## Description

Base class for widgets that build themselves based on interaction with
 a specified [Stream].

 A [StreamBuilderBase] is stateful and maintains a summary of the interaction
 so far. The type of the summary and how it is updated with each interaction
 is defined by sub-classes.

 Examples of summaries include:

 * the running average of a stream of integers;
 * the current direction and speed based on a stream of geolocation data;
 * a graph displaying data points from a stream.

 In general, the summary is the result of a fold computation over the data
 items and errors received from the stream along with pseudo-events
 representing termination or change of stream. The initial summary is
 specified by sub-classes by overriding [initial]. The summary updates on
 receipt of stream data and errors are specified by overriding [afterData] and
 [afterError], respectively. If needed, the summary may be updated on stream
 termination by overriding [afterDone]. Finally, the summary may be updated
 on change of stream by overriding [afterDisconnected] and [afterConnected].

 `T` is the type of stream events.

 `S` is the type of interaction summary.

 See also:

  * [StreamBuilder], which is specialized for the case where only the most
    recent interaction is needed for widget building.

## Dependencies

- StatefulWidget

## Members

- **stream**: `Stream&lt;T&gt;?`
  The asynchronous computation to which this builder is currently connected,
 possibly null. When changed, the current summary is updated using
 [afterDisconnected], if the previous stream was not null, followed by
 [afterConnected], if the new stream is not null.

## Constructors

### Unnamed Constructor
Creates a [StreamBuilderBase] connected to the specified [stream].

