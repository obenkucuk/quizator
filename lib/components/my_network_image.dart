import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
final class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator.adaptive(value: downloadProgress.progress),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
    );
  }
}
