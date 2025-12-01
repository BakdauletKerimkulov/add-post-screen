// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_media_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localMediaRepository)
const localMediaRepositoryProvider = LocalMediaRepositoryProvider._();

final class LocalMediaRepositoryProvider
    extends
        $FunctionalProvider<
          LocalMediaRepository,
          LocalMediaRepository,
          LocalMediaRepository
        >
    with $Provider<LocalMediaRepository> {
  const LocalMediaRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localMediaRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localMediaRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocalMediaRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalMediaRepository create(Ref ref) {
    return localMediaRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalMediaRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalMediaRepository>(value),
    );
  }
}

String _$localMediaRepositoryHash() =>
    r'ff6500d14f78defa1829c15fe503b0f801d587cf';
