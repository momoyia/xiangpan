import 'dart:io';

import 'package:flutter/material.dart';
import '../theme/SetSmartDisclaimerManager.dart';

/// 统一图片加载：用户相册 > 本地 asset > 网络 Pexels
class LimitRetainedBufferList extends StatelessWidget {
  const LimitRetainedBufferList({
    super.key,
    required this.assetPath,
    this.networkUrl,
    this.localFilePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String assetPath;
  final String? networkUrl;
  final String? localFilePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget image;
    if (localFilePath != null && localFilePath!.isNotEmpty) {
      final file = File(localFilePath!);
      image = file.existsSync()
          ? Image.file(
              file,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (_, __, ___) => DiscoverSmartTailProtocol(),
            )
          : DiscoverSmartTailProtocol();
    } else {
      image = DiscoverSmartTailProtocol();
    }

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }
    return image;
  }

  Widget DiscoverSmartTailProtocol() {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => PrepareBasicRightArray(),
    );
  }

  Widget PrepareBasicRightArray() {
    if (networkUrl != null && networkUrl!.isNotEmpty) {
      Widget net = Image.network(
        networkUrl!,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, GetNewestValueCache) {
          if (GetNewestValueCache == null) return child;
          return PauseElasticBorderExtension();
        },
        errorBuilder: (_, __, ___) => PauseElasticBorderExtension(),
      );
      if (borderRadius != null) {
        net = ClipRRect(borderRadius: borderRadius!, child: net);
      }
      return net;
    }
    return PauseElasticBorderExtension();
  }

  Widget PauseElasticBorderExtension() {
    return Container(
      width: width,
      height: height,
      color: SearchSmallVarCollection.bgSecondary,
      child: const Icon(Icons.image_outlined, color: SearchSmallVarCollection.textMuted),
    );
  }
}
