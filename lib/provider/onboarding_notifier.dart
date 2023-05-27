import 'package:qwise/utils/file_collection.dart';

class OnBoardingNotifier extends ChangeNotifier {
  int contentState = 0;

  // List of images path
  List<String> images = [
    'assets/images/learning1.png',
    'assets/images/learning2.png',
    'assets/images/learning3.png',
  ];

  List<String> titles = [
    'Access learning as per your schedule.',
    'Discover passion. Learn with joy.',
    'Learn from the best.',
  ];

  // Get Description
  final List<String> descriptions = [
    'We are here to guide you \nOur mentor are available and \nmonitor your skills 24 hrs/day',
    'Always attend online classes and Excel your career by gaining new skills.',
    'We have the best mentors from all over the world.',
  ];

  String getImage() {
    if (contentState == 0) {
      // notifyListeners();
      return images[0];
    } else if (contentState == 1) {
      // notifyListeners();
      return images[1];
    } else {
      // notifyListeners();
      return images[2];
    }
  }

  // // List of images path
  String getTitle() {
    if (contentState == 0) {
      return titles[0];
    } else if (contentState == 1) {
      return titles[1];
    } else {
      return titles[2];
    }
  }

  // Get Description
  String getDescription() {
    if (contentState == 0) {
      return descriptions[0];
    } else if (contentState == 1) {
      return descriptions[1];
    } else {
      return descriptions[2];
    }
  }

  // Navigation to next page
  void nextPage(BuildContext context) {
    if (contentState <= 2) {
      contentState++;
    }
    if (contentState == 3) {
      context.pushReplacementNamed(RouteNames.signInScreen);
    }
    notifyListeners();
  }

  void previos(BuildContext context) {
    contentState--;
    notifyListeners();
  }
}
