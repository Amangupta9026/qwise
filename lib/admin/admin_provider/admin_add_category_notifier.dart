import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwise/utils/file_collection.dart';

class AdminAddCategoryNotifier extends ChangeNotifier {
  TextEditingController courseIdController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController coursePlaylistController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  bool colorChange = false;
  final firestore = FirebaseFirestore.instance;

  void onButtonColorChange() {
    if (courseIdController.text.isNotEmpty &&
        courseNameController.text.isNotEmpty &&
        coursePlaylistController.text.isNotEmpty &&
        languageController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        typeController.text.isNotEmpty) {
      colorChange = true;
      notifyListeners();
    } else {
      colorChange = false;
      notifyListeners();
    }
  }

  void onSubmitButton(BuildContext context) {
    if (courseIdController.text.isNotEmpty &&
        courseNameController.text.isNotEmpty &&
        coursePlaylistController.text.isNotEmpty &&
        languageController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        typeController.text.isNotEmpty) {
      addAddCourseData();
      notifyListeners();
    } else {
      showMyDialog(
        context,
        'Please fill all fields',
        'All fields are required for submit',
        () {
          context.pop();
        },
        istwobutton: false,
      );
      notifyListeners();
    }
  }

  void addAddCourseData() async {
    await firestore.collection('course').doc('3').set({
      'course_id': courseIdController.text,
      'course_name': courseNameController.text,
      'course_playlist': coursePlaylistController.text,
      'language': languageController.text,
      'price': priceController.text,
      'type': typeController.text
    });
  }
}
