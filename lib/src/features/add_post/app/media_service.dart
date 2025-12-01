import 'dart:io';

import 'package:add_post_app/src/features/add_post/data/local_media_repository.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media_service.g.dart';

class MediaService {
  MediaService(this._repo);
  final LocalMediaRepository _repo;

  Future<List<AssetPathEntity>> loadAlbumsList() async {
    final isGranted = await _repo.getAccess();

    if (!isGranted) return [];

    final albums = await _repo.getAlbums();
    return albums;
  }

  Future<List<AssetEntity>> loadMediaPage({
    AssetPathEntity? album,
    required int pageSize,
    required int page,
  }) async {
    final albums = await loadAlbumsList();
    final currentAlbum = album ?? albums.first;

    final mediaList = await _repo.getAssetsFromAlbum(
      currentAlbum,
      page: page,
      size: pageSize,
    );
    return mediaList;
  }

  Future<File?> getFile(String id) async => _repo.getFile(id);

  Future<void> openSettings() => _repo.openSettings();
}

@riverpod
MediaService mediaService(Ref ref) {
  final repo = ref.read(localMediaRepositoryProvider);
  return MediaService(repo);
}
