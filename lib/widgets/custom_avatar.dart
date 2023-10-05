// ignore_for_file: talawa_good_doc_comments, talawa_api_doc
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

/// Creates a custom avatar.
///
/// The avatar is created using the image provided,
/// or the first alphabet with a standard background color.
class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    required this.isImageNull,
    this.firstAlphabet,
    this.cacheManager,
    this.imageUrl,
    this.fontSize = 40,
    this.maxRadius = 16,
  }) : super(key: key);

  /// Custom avatar data.
  final bool isImageNull;

  /// Custom avatar data.
  final String? firstAlphabet;

  /// Custom avatar data.
  final String? imageUrl;

  /// Custom avatar data.
  final double? fontSize;

  /// Custom avatar data.
  final double? maxRadius;

  /// Custom avatar data.
  final BaseCacheManager? cacheManager;

  @override
  Widget build(BuildContext context) {
    return isImageNull
        //creating the avatar with the icon-theme color when the image is null
        ? CircleAvatar(
            backgroundColor:
                Theme.of(context).iconTheme.color!.withOpacity(0.2),
            maxRadius: maxRadius,
            child: Center(
              child: Text(
                firstAlphabet!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: fontSize),
              ),
            ),
          )
        //creating the avatar with the provided image
        : CachedNetworkImage(
            cacheManager: cacheManager,
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                backgroundColor:
                    Theme.of(context).iconTheme.color!.withOpacity(0.2),
                backgroundImage: imageProvider,
              );
            },
            imageUrl: imageUrl!,
            placeholder: (context, url) => CircleAvatar(
              child: Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: Colors.white30,
                child: const CircleAvatar(),
              ),
            ),
            errorWidget: (context, url, error) =>
                const CircleAvatar(child: Icon(Icons.error)),
          );
  }
}
