import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  final _pageController = PageController(initialPage: 0);

  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

   @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page5(),
  ];

  @override
  Widget build(BuildContext context) {
    return 
  }
}