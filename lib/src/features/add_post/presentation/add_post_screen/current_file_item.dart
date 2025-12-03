// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CurrentFileItem extends ConsumerWidget {
  const CurrentFileItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAsset = ref.watch(choosenAssetProvider);

    return Container(
      height: 375,
      width: double.infinity,
      color: Colors.white38,
      child: currentAsset != null
          ? CurrentFileDisplayer(asset: currentAsset)
          : SizedBox(),
    );
  }
}

class CurrentFileDisplayer extends StatelessWidget {
  const CurrentFileDisplayer({super.key, required this.asset});
  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: asset.file,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || snapshot.data == null) {
          return Center(child: Text('Ошибка загрузки файла'));
        }

        final file = snapshot.data!;

        if (asset.type == AssetType.image) {
          return Image.file(file, fit: BoxFit.cover);
        } else if (asset.type == AssetType.video) {
          return CurrentFileVideoPlayer(file);
        }

        return Center(child: Text('Unknown type'));
      },
    );
  }
}

class CurrentFileVideoPlayer extends ConsumerWidget {
  const CurrentFileVideoPlayer(this.file, {super.key});
  final File file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerAsync = ref.watch(videoControllerProvider(file));

    return controllerAsync.when(
      data: (controller) {
        return VisibilityDetector(
          key: ValueKey(file.hashCode),
          onVisibilityChanged: (info) {
            if (info.visibleFraction < 0.2) {
              controller.pause();
            }
          },
          child: ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    },
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),
                      ),
                    ),
                  ),
                  if (!controller.value.isPlaying)
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => controller.play(),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white.withAlpha(80),
                          size: 72,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, __) =>
          Center(child: Text('Ошибка загрузки видео\n${e.toString()}')),
    );
  }
}
