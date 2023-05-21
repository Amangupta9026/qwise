import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/cupertino.dart';
import 'package:qwise/profile/profile_screen.dart';
import 'package:qwise/provider/page_index_selector.dart';
import 'package:qwise/utils/file_collection.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({ super.key});

  Widget page(index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageIndexSelectorNotifier>(builder: (context, ref, child) {
      return Scaffold(
        bottomNavigationBar: BottomBarBubble(
          selectedIndex: ref.index,
          color: primaryColor,
          backgroundColor: Colors.white,
          items: [
            BottomBarItem(iconData: CupertinoIcons.home),
            BottomBarItem(
              iconData: CupertinoIcons.leaf_arrow_circlepath,
            ),
            BottomBarItem(
              iconData: CupertinoIcons.plus_app,
            ),
            BottomBarItem(iconData: CupertinoIcons.person),
          ],
          onSelect: (index) {
            ref.changeIndex(index);
          },
        ),
        body: page(ref.index),
      );
    });
  }
}
