# Overview for `RasterCacheSummarizer`

## Description

Summarizes [TimelineEvent]s corresponding to [kRasterCacheEvent] events.

 A sample event (some fields have been omitted for brevity):
 ```json
     ,
 ```

## Members

- **rasterCacheEvents**: `List&lt;TimelineEvent&gt;`
  The raster cache events.

- **_layerCounts**: `List&lt;double&gt;`
- **_layerMemories**: `List&lt;double&gt;`
- **_pictureCounts**: `List&lt;double&gt;`
- **_pictureMemories**: `List&lt;double&gt;`
## Constructors

### Unnamed Constructor
Creates a RasterCacheSummarizer given the timeline events.

