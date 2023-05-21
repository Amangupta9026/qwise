import 'package:flutter/cupertino.dart';
import 'package:qwise/utils/file_collection.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome, ${currentUser?.displayName ?? ''}!",
          style: const TextStyle(
            fontSize: 14,
            color: lightBlueColor,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Discover, Enrol & Enhance",
                style: TextStyle(
                  fontSize: 24,
                  color: darkBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              CupertinoIcons.bell_circle,
              size: 30,
            ),
          ],
        ),
      ],
    );
  }
}
