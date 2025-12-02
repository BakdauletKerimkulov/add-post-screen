// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddScreenController)
const addScreenControllerProvider = AddScreenControllerProvider._();

final class AddScreenControllerProvider
    extends $NotifierProvider<AddScreenController, int> {
  const AddScreenControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addScreenControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addScreenControllerHash();

  @$internal
  @override
  AddScreenController create() => AddScreenController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$addScreenControllerHash() =>
    r'3d042788d1df1c26b365931f69d957d13520c055';

abstract class _$AddScreenController extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
