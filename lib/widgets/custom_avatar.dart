import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    Key? key,
    required this.isImageNull,
    this.firstAlphabet,
    this.cacheManager,
    this.imageUrl,
    this.fontSize = 40,
  }) : super(key: key);
  final bool isImageNull;
  final String? firstAlphabet;
  final String? imageUrl;
  final double? fontSize;
  final BaseCacheManager? cacheManager;

  @override
  Widget build(BuildContext context) {
    return isImageNull
        ? CircleAvatar(
            backgroundColor:
                Theme.of(context).iconTheme.color!.withOpacity(0.2),
            child: Center(
              child: Text(
                firstAlphabet!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: fontSize),
              ),
            ),
          )
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
            errorWidget: (context, url, error) => const CircleAvatar(
                  child: Icon(Icons.error),
                ));
  }
}
