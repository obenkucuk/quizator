import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quizator/config/theme/my_colors.dart';

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
    precacheImage(NetworkImage(imageUrl), context);

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, _) => Image(
        image: NetworkImage(imageUrl),
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      ),
      fit: fit,
      width: width,
      height: height,
      alignment: alignment,
      maxWidthDiskCache: 1000,
      maxHeightDiskCache: 1000,
      useOldImageOnUrlChange: true,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            value: downloadProgress.progress,
            valueColor: AlwaysStoppedAnimation(context.myColors.primaryColor),
            strokeCap: StrokeCap.round,
          ),
        );
      },
      errorWidget: (_, __, ___) => const Icon(Icons.error),
    );
  }
}
