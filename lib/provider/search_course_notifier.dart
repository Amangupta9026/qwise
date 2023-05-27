import '../utils/file_collection.dart';

class SearchCourseNotifier extends ChangeNotifier {
  // List<Course> _searchCourseList = [];
  // List<Course> get searchCourseList => _searchCourseList;

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  Future<void> searchCourse(String query) async {
    //_searchCourseList = await CourseService().searchCourse(query);
    notifyListeners();
  }
}
