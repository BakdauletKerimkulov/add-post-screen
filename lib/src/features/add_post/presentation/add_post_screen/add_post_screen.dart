import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/current_file_item.dart';
import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/media_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPostScreen extends ConsumerStatefulWidget {
  const AddPostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends ConsumerState<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    //super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('New post'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Next',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CurrentFileItem(),

              SizedBox(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    Consumer(
                      builder: (context, ref, _) {
                        return GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Recent',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              MediaGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
