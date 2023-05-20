import 'package:qwise/utils/file_collection.dart';

import 'component/banner.dart';
import 'component/home_header.dart';
import 'component/search_courses.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 10,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(
                height: 18,
              ),
              const SearchCoursesTextField(),
              const SizedBox(
                height: 18,
              ),
              HomeBanner(),

              // for navigation
            ],
          ),
        ),
      ),
    );
  }
}
