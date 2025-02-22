import 'dart:async';
import 'package:flutter/material.dart';
import '../../../constants/sizes.dart';

class DynamicImage extends StatelessWidget {
  const DynamicImage({
    super.key,
    required this.imagePaths,
  });

  final List<String> imagePaths;

  Future<Size> _getImageSize(String assetPath) async {
    final Image image = Image.asset(assetPath);
    final Completer<Size> completer = Completer();

    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo info, bool _) {
          completer.complete(
            Size(
              info.image.width.toDouble(),
              info.image.height.toDouble(),
            ),
          );
        },
      ),
    );

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Size>(
      future: _getImageSize(imagePaths.first),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (!snapshot.hasData) {
          return const Text("이미지를 불러올 수 없습니다.");
        }

        final Size imageSize = snapshot.data!;
        final double aspectRatio = imageSize.width / imageSize.height;

        final double imageWidth =
            aspectRatio > 1 ? Width.w100 + Width.w100 : Width.w100 + Width.w32;
        final double imageHeight =
            aspectRatio > 1 ? Height.h100 : Height.h100 + Height.h64;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imagePaths
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                    padding: EdgeInsets.only(
                      right:
                          entry.key == imagePaths.length - 1 ? 0 : Sizes.size5,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        Sizes.size12,
                      ),
                      child: Image.asset(
                        entry.value,
                        width: imageWidth,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
