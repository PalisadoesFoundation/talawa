# Overview for `StringBuffer`

## Description



## Members

- **_BUFFER_SIZE**: `int`
- **_PARTS_TO_COMPACT**: `int`
- **_PARTS_TO_COMPACT_SIZE_LIMIT**: `int`
- **_parts**: `List&lt;String&gt;?`
  /**
   * When strings are written to the string buffer, we add them to a
   * list of string parts.
   */

- **_partsCodeUnits**: `int`
  /**
    * Total number of code units in the string parts. Does not include
    * the code units added to the buffer.
    */

- **_partsCompactionIndex**: `int`
  /**
   * To preserve memory, we sometimes compact the parts. This combines
   * several smaller parts into a single larger part to cut down on the
   * cost that comes from the per-object memory overhead. We keep track
   * of the last index where we ended our compaction and the number of
   * code units added since the last compaction.
   */

- **_partsCodeUnitsSinceCompaction**: `int`
- **_buffer**: `Uint16List?`
  /**
   * The buffer is used to build up a string from code units. It is
   * used when writing short strings or individual char codes to the
   * buffer. The buffer is allocated on demand.
   */

- **_bufferPosition**: `int`
- **_bufferCodeUnitMagnitude**: `int`
  /**
   * Collects the approximate maximal magnitude of the code units added
   * to the buffer.
   *
   * The value of each added code unit is or'ed with this variable, so the
   * most significant bit set in any code unit is also set in this value.
   * If below 256, the string in the buffer is a Latin-1 string.
   */

## Constructors

### Unnamed Constructor
Creates the string buffer with an initial content.

