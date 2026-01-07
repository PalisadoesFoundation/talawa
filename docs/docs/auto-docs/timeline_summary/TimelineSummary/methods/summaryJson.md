# Method: `summaryJson`

## Description

Encodes this summary as JSON.

 Data ends with "_time_millis" means time in milliseconds and numbers in
 the "frame_build_times", "frame_rasterizer_times", "frame_begin_times" and
 "frame_rasterizer_begin_times" lists are in microseconds.

 * "average_frame_build_time_millis": Average amount of time spent per
   frame in the framework building widgets, updating layout, painting and
   compositing.
   See [computeAverageFrameBuildTimeMillis].
 * "90th_percentile_frame_build_time_millis" and
   "99th_percentile_frame_build_time_millis": The p-th percentile frame
   rasterization time in milliseconds. 90 and 99-th percentile number is
   usually a better metric to estimate worse cases. See discussion in
   https://github.com/flutter/flutter/pull/19121#issuecomment-419520765
   See [computePercentileFrameBuildTimeMillis].
 * "worst_frame_build_time_millis": The longest frame build time.
   See [computeWorstFrameBuildTimeMillis].
 * "missed_frame_build_budget_count': The number of frames that missed
   the [kBuildBudget] and therefore are in the danger of missing frames.
   See [computeMissedFrameBuildBudgetCount]. Because [kBuildBudget] is a
   constant, this does not represent a real missed frame count.
 * "average_frame_rasterizer_time_millis": Average amount of time spent
   per frame in the engine rasterizer.
   See [computeAverageFrameRasterizerTimeMillis].
 * "stddev_frame_rasterizer_time_millis": Standard deviation of the amount
   of time spent per frame in the engine rasterizer.
   See [computeStandardDeviationFrameRasterizerTimeMillis].
 * "90th_percentile_frame_rasterizer_time_millis" and
   "99th_percentile_frame_rasterizer_time_millis": The 90/99-th percentile
   frame rasterization time in milliseconds.
   See [computePercentileFrameRasterizerTimeMillis].
 * "worst_frame_rasterizer_time_millis": The longest frame rasterization
   time.
   See [computeWorstFrameRasterizerTimeMillis].
 * "missed_frame_rasterizer_budget_count": The number of frames that missed
   the [kBuildBudget] on the raster thread and therefore are in the danger
   of missing frames. See [computeMissedFrameRasterizerBudgetCount].
   Because [kBuildBudget] is a constant, this does not represent a real
   missed frame count.
 * "frame_count": The total number of frames recorded in the timeline. This
   is also the length of the "frame_build_times" and the "frame_begin_times"
   lists.
   See [countFrames].
 * "frame_rasterizer_count": The total number of rasterizer cycles recorded
   in the timeline. This is also the length of the "frame_rasterizer_times"
   and the "frame_rasterizer_begin_times" lists.
   See [countRasterizations].
 * "frame_build_times": The build time of each frame, by tracking the
   [TimelineEvent] with name [kBuildFrameEventName].
 * "frame_rasterizer_times": The rasterize time of each frame, by tracking
   the [TimelineEvent] with name [kRasterizeFrameEventName]
 * "frame_begin_times": The build begin timestamp of each frame.
 * "frame_rasterizer_begin_times": The rasterize begin time of each frame.
 * "average_vsync_transitions_missed": Computes the average of the
   `vsync_transitions_missed` over the lag events.
   See [SceneDisplayLagSummarizer.computeAverageVsyncTransitionsMissed].
 * "90th_percentile_vsync_transitions_missed" and
   "99th_percentile_vsync_transitions_missed": The 90/99-th percentile
   `vsync_transitions_missed` over the lag events.
   See [SceneDisplayLagSummarizer.computePercentileVsyncTransitionsMissed].
 * "average_vsync_frame_lag": Computes the average of the time between
   platform vsync signal and the engine frame process start time.
   See [VsyncFrameLagSummarizer.computeAverageVsyncFrameLag].
 * "90th_percentile_vsync_frame_lag" and "99th_percentile_vsync_frame_lag":
   The 90/99-th percentile delay between platform vsync signal and engine
   frame process start time.
   See [VsyncFrameLagSummarizer.computePercentileVsyncFrameLag].
 * "average_layer_cache_count": The average of the values seen for the
   count of the engine layer cache entries.
   See [RasterCacheSummarizer.computeAverageLayerCount].
 * "90th_percentile_layer_cache_count" and
   "99th_percentile_layer_cache_count": The 90/99-th percentile values seen
   for the count of the engine layer cache entries.
   See [RasterCacheSummarizer.computePercentileLayerCount].
 * "worst_layer_cache_count": The worst (highest) value seen for the
   count of the engine layer cache entries.
   See [RasterCacheSummarizer.computeWorstLayerCount].
 * "average_layer_cache_memory": The average of the values seen for the
   memory used for the engine layer cache entries, in megabytes.
   See [RasterCacheSummarizer.computeAverageLayerMemory].
 * "90th_percentile_layer_cache_memory" and
   "99th_percentile_layer_cache_memory": The 90/99-th percentile values seen
   for the memory used for the engine layer cache entries.
   See [RasterCacheSummarizer.computePercentileLayerMemory].
 * "worst_layer_cache_memory": The worst (highest) value seen for the
   memory used for the engine layer cache entries.
   See [RasterCacheSummarizer.computeWorstLayerMemory].
 * "average_picture_cache_count": The average of the values seen for the
   count of the engine picture cache entries.
   See [RasterCacheSummarizer.computeAveragePictureCount].
 * "90th_percentile_picture_cache_count" and
   "99th_percentile_picture_cache_count": The 90/99-th percentile values seen
   for the count of the engine picture cache entries.
   See [RasterCacheSummarizer.computePercentilePictureCount].
 * "worst_picture_cache_count": The worst (highest) value seen for the
   count of the engine picture cache entries.
   See [RasterCacheSummarizer.computeWorstPictureCount].
 * "average_picture_cache_memory": The average of the values seen for the
   memory used for the engine picture cache entries, in megabytes.
   See [RasterCacheSummarizer.computeAveragePictureMemory].
 * "90th_percentile_picture_cache_memory" and
   "99th_percentile_picture_cache_memory": The 90/99-th percentile values seen
   for the memory used for the engine picture cache entries.
   See [RasterCacheSummarizer.computePercentilePictureMemory].
 * "worst_picture_cache_memory": The worst (highest) value seen for the
   memory used for the engine picture cache entries.
   See [RasterCacheSummarizer.computeWorstPictureMemory].
 * "average_frame_request_pending_latency": Computes the average of the delay
   between `Animator::RequestFrame` and `Animator::BeginFrame` in the engine.
   See [FrameRequestPendingLatencySummarizer.computeAverageFrameRequestPendingLatency].
 * "90th_percentile_frame_request_pending_latency" and
   "99th_percentile_frame_request_pending_latency": The 90/99-th percentile
   delay between `Animator::RequestFrame` and `Animator::BeginFrame` in the
   engine.
   See [FrameRequestPendingLatencySummarizer.computePercentileFrameRequestPendingLatency].

## Return Type
`Map&lt;String, dynamic&gt;`

