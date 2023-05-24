import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:qwise/utils/file_collection.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('signup')
                .doc(FirebaseAuth.instance.currentUser?.email)
                .snapshots(),
            builder: (context, snapshot) {
              final userData = snapshot.data?.data();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome, ${userData?['firstName'] ?? ''}!",
                    style: const TextStyle(
                      fontSize: 16,
                      color: lightBlueColor,
                    ),
                  ),
                  Visibility(
                    visible: adminList.contains(userData?['email'] ?? ''),
                    child: InkWell(
                      onTap: () {
                        context.push(RouteNames.adminPanel);
                      },
                      child: const Icon(
                        Icons.dashboard,
                      ),
                    ),
                  ),
                ],
              );
            }),
        const SizedBox(
          height: 8,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Discover, Enroll & Enhance",
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
