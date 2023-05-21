import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/material.dart';
import 'package:qwise/utils/colors.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  final int index;
  const MainScreen({this.index = 0, super.key});

  Widget page() {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return const HomeScreen();

      case 4:
        return const HomeScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarBubble(
        selectedIndex: index,
        color: primaryColor,
        backgroundColor: Colors.white,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.redeem),
          BottomBarItem(
            iconData: Icons.psychology_alt_rounded,
          ),
          BottomBarItem(iconData: Icons.notifications),
          BottomBarItem(iconData: Icons.person_4_rounded),
        ],
        onSelect: (index) {},
      ),
      body: page(),
    );
  }
}
