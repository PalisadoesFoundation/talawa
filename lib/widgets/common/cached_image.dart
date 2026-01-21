import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A standardized widget for loading network images with caching and error handling.
class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit,
  });

  /// The URL of the image to load.
  final String url;

  /// The width of the image.
  final double? width;

  /// The height of the image.
  final double? height;

  /// How the image should be inscribed into the space.
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        placeholder: (_, __) => SizedBox(
          height: height ?? 120,
          width: width,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
        memCacheWidth: 1000,
      );
}
