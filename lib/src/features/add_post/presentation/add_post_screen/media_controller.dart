import 'dart:io';

import 'package:add_post_app/src/features/add_post/app/media_service.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'media_controller.g.dart';

/// Загружаем список альбомов
@riverpod
Future<List<AssetPathEntity>> getAlbums(Ref ref) async {
  final service = ref.read(mediaServiceProvider);
  return service.loadAlbumsList();
}

/// Текущий выбранный альбом
@riverpod
class CurrentAlbum extends _$CurrentAlbum {
  @override
  AssetPathEntity? build() => null;

  void set(AssetPathEntity album) => state = album;
}

/// Контроллер для постраничной загрузки медиа
@riverpod
class AssetController extends _$AssetController {
  static const int _pageSize = 100;
  final List<AssetEntity> _cache = [];

  @override
  Future<List<AssetEntity>> build() async {
    _cache.clear();
    await loadMore(reset: true);

    if (_cache.isNotEmpty) {
      ref.read(choosenAssetProvider.notifier).select(_cache.first);
    }

    return List.unmodifiable(_cache);
  }

  Future<void> loadMore({bool reset = false}) async {
    final album = ref.watch(currentAlbumProvider);

    if (reset) {
      state = const AsyncLoading();
      _cache.clear();
    }

    final int page = _cache.length ~/ _pageSize;
    final service = ref.read(mediaServiceProvider);

    final assets = await service.loadMediaPage(
      album: album,
      page: page,
      pageSize: _pageSize,
    );

    if (assets.isEmpty) return;

    _cache.addAll(assets);
    state = AsyncData(List.unmodifiable(_cache));
  }

  Future<void> setAlbum(AssetPathEntity album) async {
    ref.read(currentAlbumProvider.notifier).set(album);
    await loadMore(reset: true);
  }
}

//* Хранит выбранный пользователем ассет
@riverpod
class ChoosenAsset extends _$ChoosenAsset {
  @override
  AssetEntity? build() => null;

  void select(AssetEntity asset) => state = asset;
}

//* Управление контроллером
@riverpod
FutureOr<VideoPlayerController> videoController(Ref ref, File file) async {
  final controller = VideoPlayerController.file(file);
  await controller.initialize();
  controller
    ..setLooping(true)
    ..play();

  ref.onDispose(() {
    controller
      ..pause()
      ..dispose();
  });

  return controller;
}
