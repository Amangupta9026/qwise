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

  Future<void> addAddCourseData() async {
    final docRef = await firestore
        .collection('course')
        .orderBy("course_id", descending: true)
        .limit(1)
        .get();
    final docId =
        (int.tryParse(docRef.docs.first.data()['course_id']) ?? -1) + 1;

    await firestore.collection('course').doc(docId.toString()).update({
      'course_id': docId.toString(),
      'course_name': courseNameController.text,
      'course_playlist': coursePlaylistController.text,
      "image": imageController.text,
      'language': languageController.text,
      'price': priceController.text,
      'type': typeController.text
    });
  }
}
