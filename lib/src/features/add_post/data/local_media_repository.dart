import 'dart:io';

import 'package:photo_manager/photo_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_media_repository.g.dart';

class LocalMediaRepository {
  Future<bool> getAccess() async {
    final ps = await PhotoManager.requestPermissionExtend();
    return ps.hasAccess;
  }

  Future<List<AssetPathEntity>> getAlbums() async {
    return await PhotoManager.getAssetPathList(onlyAll: true);
  }

  Future<List<AssetEntity>> getAssetsFromAlbum(
    AssetPathEntity albumPath, {
    int page = 0,
    int size = 50,
  }) async {
    final entities = await albumPath.getAssetListPaged(page: page, size: size);
    return entities;
  }

  Future<File?> getFile(String id) async {
    final asset = await AssetEntity.fromId(id);
    return asset?.file;
  }

  Future<void> openSettings() => PhotoManager.openSetting();
}

@riverpod
LocalMediaRepository localMediaRepository(Ref ref) {
  return LocalMediaRepository();
}
