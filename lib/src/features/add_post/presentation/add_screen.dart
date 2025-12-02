import 'package:add_post_app/src/features/add_post/presentation/add_post_screen/add_post_screen.dart';
import 'package:add_post_app/src/features/add_post/presentation/add_reels_screen/add_reels_screen.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

int _currentPage = 0;

class _AddScreenState extends State<AddScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void navigationTapped(int page) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [AddPostScreen(), AddReelsScreen()],
            ),

            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              bottom: 10,
              right: _currentPage == 0 ? 100 : 150,
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(140),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => navigationTapped(0),
                      child: Text(
                        'Post',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: _currentPage == 0 ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () => navigationTapped(1),
                      child: Text(
                        'Reels',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: _currentPage == 1 ? Colors.white : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
