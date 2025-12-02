import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class ThumbnailItem extends ConsumerWidget {
  const ThumbnailItem(this.asset, {super.key});

  final AssetEntity asset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(choosenAssetProvider.notifier).select(asset),
      child: FutureBuilder(
        future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.memory(snapshot.data!, fit: BoxFit.cover),
                ),

                if (asset.type == AssetType.video)
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withAlpha(80),
                    ),
                  ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
