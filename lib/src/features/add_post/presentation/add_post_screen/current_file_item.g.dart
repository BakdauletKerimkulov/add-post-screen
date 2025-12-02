// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_file_item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
