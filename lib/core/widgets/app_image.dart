import 'dart:io';

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// 统一图片加载：用户相册 > 本地 asset > 网络 Pexels
class AppImage extends StatelessWidget {
  const AppImage({
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
              errorBuilder: (_, __, ___) => _assetOrNetwork(),
            )
          : _assetOrNetwork();
    } else {
      image = _assetOrNetwork();
    }

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }
    return image;
  }

  Widget _assetOrNetwork() {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => _networkOrPlaceholder(),
    );
  }

  Widget _networkOrPlaceholder() {
    if (networkUrl != null && networkUrl!.isNotEmpty) {
      Widget net = Image.network(
        networkUrl!,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return _placeholder();
        },
        errorBuilder: (_, __, ___) => _placeholder(),
      );
      if (borderRadius != null) {
        net = ClipRRect(borderRadius: borderRadius!, child: net);
      }
      return net;
    }
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      width: width,
      height: height,
      color: AppColors.bgSecondary,
      child: const Icon(Icons.image_outlined, color: AppColors.textMuted),
    );
  }
}
