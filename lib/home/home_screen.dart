import 'package:qwise/home/recommended_courses/recomended_courses.dart';
import 'package:qwise/utils/file_collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: AppUtils.decoration1(),
        child: SafeArea(
          child: SingleChildScrollView(
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
                  const SizedBox(
                    height: 18,
                  ),
                  RecommendedCourses(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
