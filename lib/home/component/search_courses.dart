import 'package:flutter/cupertino.dart';

import '../../utils/file_collection.dart';

class SearchCoursesTextField extends StatelessWidget {
  const SearchCoursesTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
        filled: true,
        hintText: "Search courses",
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            color: darkBlueColor,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          width: 52,
          height: 40,
          child: const Icon(
            CupertinoIcons.search,
            color: pinkIconColor,
            size: 28,
          ),
        ),
        fillColor: lightPinkColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
