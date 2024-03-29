// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:qwise/utils/file_collection.dart';

class AdminAddCategoryNotifier extends ChangeNotifier {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController coursePlaylistController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController priceController = TextEditingController(
    text: "0",
  );
  TextEditingController typeController = TextEditingController();

  bool colorChange = false;
  final firestore = FirebaseFirestore.instance;

  void onButtonColorChange() {
    if (courseNameController.text.isNotEmpty &&
        coursePlaylistController.text.isNotEmpty &&
        languageController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        typeController.text.isNotEmpty) {
      colorChange = true;
    } else {
      colorChange = false;
    }
    notifyListeners();
  }

  void onSubmitButton(BuildContext context) {
    if (courseNameController.text.isNotEmpty &&
        coursePlaylistController.text.isNotEmpty &&
        languageController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        typeController.text.isNotEmpty) {
      addAddCourseData(context);
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
    }
  }

  Future<void> addAddCourseData(BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    final docRef = await firestore
        .collection('course')
        .orderBy("course_id", descending: true)
        .limit(1)
        .get();
    final docId =
        (int.tryParse(docRef.docs.first.data()['course_id'].toString()) ?? -1) +
            1;

    await firestore.collection('course').doc(docId.toString()).set({
      'course_id': docId,
      'course_name': courseNameController.text,
      'course_search': courseNameController.text.toLowerCase(),
      'course_playlist': coursePlaylistController.text,
      "image": imageController.text,
      'language': languageController.text,
      'price': priceController.text,
      'type': typeController.text
    });
    showMyDialog(
      context,
      'Successfully Course Added',
      '${courseNameController.text} is added, now you can see in client app',
      () {
        courseNameController.clear();
        coursePlaylistController.clear();
        imageController.clear();
        languageController.clear();
        priceController.clear();
        typeController.clear();
        context.pushReplacementNamed(RouteNames.adminPanel);
      },
      istwobutton: false,
    );

    EasyLoading.dismiss();
  }
}
