import 'dart:io';

import 'package:add_post_app/src/features/add_post/app/media_service.dart';
import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/add_post_screen_new.dart';
import 'package:add_post_app/src/features/add_post/presentation/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final List<Widget> _mediaList = [];
  final List<File> path = [];

  File? _file;
  int currentPage = 0;
  int? lastPage;

  int indexx = 0;

  @override
  void initState() {
    super.initState();
    _fetchMedia();
  }

  Future<void> _fetchMedia() async {
    lastPage = currentPage;
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (ps.isAuth) {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        onlyAll: true,
      );
      List<AssetEntity> media = await albums[0].getAssetListPaged(
        page: currentPage,
        size: 50,
      );

      for (final asset in media) {
        if (asset.type == AssetType.image) {
          final file = await asset.file;
          if (file != null) {
            path.add(File(file.path));
            _file = path[0];
          }
        }
      }

      List<Widget> temp = [];
      for (final asset in media) {
        temp.add(
          FutureBuilder(
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

      _mediaList.addAll(temp);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('New post'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Next', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 375,
                child: GridView.builder(
                  itemCount: _mediaList.isNotEmpty ? 1 : 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _mediaList[indexx];
                  },
                ),
              ),

              Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),

              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemCount: _mediaList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        indexx = index;
                      });
                    },
                    child: _mediaList[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddPostScreenNew extends ConsumerWidget with WidgetsBindingObserver {
  const AddPostScreenNew({super.key});

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {}
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('New post'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(mediaServiceProvider).openSettings();
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final assetList = ref.watch(assetControllerProvider).value;
            final currentAsset = ref.watch(choosenAssetProvider);

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 375,
                    child: currentAsset != null
                        ? ThumbnailItem(currentAsset)
                        : Container(color: Colors.grey),
                  ),

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

                  if (assetList != null)
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 1.5,
                        crossAxisSpacing: 1.5,
                      ),
                      itemCount: assetList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final asset = assetList[index];
                        return ThumbnailItem(asset);
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
