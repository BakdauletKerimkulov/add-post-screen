import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/media_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
