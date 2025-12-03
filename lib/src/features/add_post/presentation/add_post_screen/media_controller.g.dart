// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Загружаем список альбомов

@ProviderFor(getAlbums)
const getAlbumsProvider = GetAlbumsProvider._();

/// Загружаем список альбомов

final class GetAlbumsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AssetPathEntity>>,
          List<AssetPathEntity>,
          FutureOr<List<AssetPathEntity>>
        >
    with
        $FutureModifier<List<AssetPathEntity>>,
        $FutureProvider<List<AssetPathEntity>> {
  /// Загружаем список альбомов
  const GetAlbumsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAlbumsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAlbumsHash();

  @$internal
  @override
  $FutureProviderElement<List<AssetPathEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AssetPathEntity>> create(Ref ref) {
    return getAlbums(ref);
  }
}

String _$getAlbumsHash() => r'44e7b3e6ef4ca5b83623814fb7d13240e586bfc2';

/// Текущий выбранный альбом

@ProviderFor(CurrentAlbum)
const currentAlbumProvider = CurrentAlbumProvider._();

/// Текущий выбранный альбом
final class CurrentAlbumProvider
    extends $NotifierProvider<CurrentAlbum, AssetPathEntity?> {
  /// Текущий выбранный альбом
  const CurrentAlbumProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentAlbumProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentAlbumHash();

  @$internal
  @override
  CurrentAlbum create() => CurrentAlbum();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssetPathEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssetPathEntity?>(value),
    );
  }
}

String _$currentAlbumHash() => r'87e63694a441ff32cf01b0044d7858a2b96cfbba';

/// Текущий выбранный альбом

abstract class _$CurrentAlbum extends $Notifier<AssetPathEntity?> {
  AssetPathEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AssetPathEntity?, AssetPathEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AssetPathEntity?, AssetPathEntity?>,
              AssetPathEntity?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Контроллер для постраничной загрузки медиа

@ProviderFor(AssetController)
const assetControllerProvider = AssetControllerProvider._();

/// Контроллер для постраничной загрузки медиа
final class AssetControllerProvider
    extends $AsyncNotifierProvider<AssetController, List<AssetEntity>> {
  /// Контроллер для постраничной загрузки медиа
  const AssetControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'assetControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$assetControllerHash();

  @$internal
  @override
  AssetController create() => AssetController();
}

String _$assetControllerHash() => r'009b666c3e086e335888d13b3fb5d44fb36be57a';

/// Контроллер для постраничной загрузки медиа

abstract class _$AssetController extends $AsyncNotifier<List<AssetEntity>> {
  FutureOr<List<AssetEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<AssetEntity>>, List<AssetEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<AssetEntity>>, List<AssetEntity>>,
              AsyncValue<List<AssetEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ChoosenAsset)
const choosenAssetProvider = ChoosenAssetProvider._();

final class ChoosenAssetProvider
    extends $NotifierProvider<ChoosenAsset, AssetEntity?> {
  const ChoosenAssetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'choosenAssetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$choosenAssetHash();

  @$internal
  @override
  ChoosenAsset create() => ChoosenAsset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AssetEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AssetEntity?>(value),
    );
  }
}

String _$choosenAssetHash() => r'3b641444146ff5341ab4309450c8aee9695cf489';

abstract class _$ChoosenAsset extends $Notifier<AssetEntity?> {
  AssetEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AssetEntity?, AssetEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AssetEntity?, AssetEntity?>,
              AssetEntity?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(videoController)
const videoControllerProvider = VideoControllerFamily._();

final class VideoControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<VideoPlayerController>,
          VideoPlayerController,
          FutureOr<VideoPlayerController>
        >
    with
        $FutureModifier<VideoPlayerController>,
        $FutureProvider<VideoPlayerController> {
  const VideoControllerProvider._({
    required VideoControllerFamily super.from,
    required File super.argument,
  }) : super(
         retry: null,
         name: r'videoControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$videoControllerHash();

  @override
  String toString() {
    return r'videoControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<VideoPlayerController> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VideoPlayerController> create(Ref ref) {
    final argument = this.argument as File;
    return videoController(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$videoControllerHash() => r'0c76c2cb7f526226ba26f2e16c05b2a7b20136d1';

final class VideoControllerFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<VideoPlayerController>, File> {
  const VideoControllerFamily._()
    : super(
        retry: null,
        name: r'videoControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VideoControllerProvider call(File file) =>
      VideoControllerProvider._(argument: file, from: this);

  @override
  String toString() => r'videoControllerProvider';
}
