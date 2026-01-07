# Overview for `TickerCanceled`

## Description

Exception thrown by [Ticker] objects on the [TickerFuture.orCancel] future
 when the ticker is canceled.

## Dependencies

- Exception

## Members

- **ticker**: `Ticker?`
  Reference to the [Ticker] object that was canceled.

 This may be null in the case that the [Future] created for
 [TickerFuture.orCancel] was created after the ticker was canceled.

## Constructors

### Unnamed Constructor
Creates a canceled-ticker exception.

