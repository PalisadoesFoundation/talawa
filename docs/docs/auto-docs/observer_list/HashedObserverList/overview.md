# Overview for `HashedObserverList`

## Description

A list optimized for the observer pattern, but for larger numbers of observers.

 For small numbers of observers (e.g. less than 10), use [ObserverList] instead.

 The iteration semantics of the this class are slightly different from
 [ObserverList]. This class will only return an item once in the [iterator],
 no matter how many times it was added, although it does require that an item
 be removed as many times as it was added for it to stop appearing in the
 [iterator]. It will return them in the order the first instance of an item
 was originally added.

 See also:

  * [ObserverList] for a list that is fast for small numbers of observers.

## Dependencies

- Iterable

## Members

- **_map**: `LinkedHashMap&lt;T, int&gt;`
