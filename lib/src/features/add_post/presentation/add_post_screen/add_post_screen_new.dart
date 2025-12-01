import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/media_grid.dart';
import 'package:add_post_app/src/features/add_post/presentation/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostScreenNew2 extends ConsumerStatefulWidget {
  const AddPostScreenNew2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPostScreenNew2State();
}

class _AddPostScreenNew2State extends ConsumerState<AddPostScreenNew2>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('New post'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Next',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrentFile(),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              MediaGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

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
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

class CurrentFile extends ConsumerWidget {
  const CurrentFile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFile = ref.watch(currentFileProvider).value;
    return Container(
      height: 375,
      width: double.infinity,
      color: Colors.white38,
      child: currentFile != null
          ? Image.file(currentFile, fit: BoxFit.cover)
          : SizedBox(),
    );
  }
}
