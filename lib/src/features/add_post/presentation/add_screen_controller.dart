import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_screen_controller.g.dart';

@riverpod
class AddScreenController extends _$AddScreenController {
  @override
  int build() => 0;

  void changePage(int page) => state = page;
}
