import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/add_post_screen_new.dart';
import 'package:add_post_app/src/features/add_post/presentation/media_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MediaGrid extends ConsumerWidget {
  const MediaGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assetList = ref.watch(assetControllerProvider).value;

    return assetList != null
        ? GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 1.5,
              crossAxisSpacing: 1.5,
            ),
            itemCount: assetList.length,
            itemBuilder: (BuildContext context, int index) {
              final asset = assetList[index];
              return GestureDetector(
                onTap: () =>
                    ref.read(choosenAssetProvider.notifier).select(asset),
                child: ThumbnailItem(asset),
              );
            },
          )
        : SizedBox();
  }
}
