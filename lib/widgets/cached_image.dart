import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final double width;
  final double height;
  final String imgurl;
  final IconData icon;
  final BoxFit fit;

  const CachedImage({
    this.width,
    this.height,
    this.imgurl,
    this.icon,
    this.fit,
  });
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgurl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => Icon(icon ?? Icons.error),
    );
  }
}
