import 'package:qwise/utils/file_collection.dart';

class CourseDetailsNotifier extends ChangeNotifier {
  bool isShowMore = false;
  void showMore() {
    isShowMore = !isShowMore;
    notifyListeners();
  }
}
