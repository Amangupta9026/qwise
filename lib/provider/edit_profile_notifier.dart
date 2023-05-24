import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker_pro/image_picker_pro.dart';

import '../utils/file_collection.dart';

class EditProfileNotifier extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final firestore = FirebaseFirestore.instance;

  File? selectedImage;
  void imagePicker(BuildContext context) async {
    showMyDialog(
        context,
        'Choose Image',
        'Please choose an image from camera or gallery',
        () => imagePickFromGallery(context),
        istwobutton: true,
        actionButtonText1: 'Camera',
        actionButtonText2: 'Gallery', actiontap1: () {
      imagePickFromCamera(context);
    });
    notifyListeners();
  }

  imagePickFromGallery(BuildContext context) async {
    context.pop();

    ImagePickerPlus? picker = ImagePickerPlus(context);

    SelectedImagesDetails? galleryDetails =
        await picker.pickImage(source: ImageSource.gallery);
    EasyLoading.show(status: 'loading...');
    if (galleryDetails != null) {
      selectedImage = galleryDetails.selectedFiles.first.selectedFile;
    }
    notifyListeners();
    EasyLoading.dismiss();
  }

  void imagePickFromCamera(BuildContext context) async {
    context.pop();

    ImagePickerPlus? picker = ImagePickerPlus(context);

    SelectedImagesDetails? galleryDetails =
        await picker.pickImage(source: ImageSource.camera);
    EasyLoading.show(status: 'loading...');
    if (galleryDetails != null) {
      selectedImage = galleryDetails.selectedFiles.first.selectedFile;
    }
    notifyListeners();
    EasyLoading.dismiss();
  }

  Future<void> getUserData() async {
    final userData = await FirebaseFirestore.instance
        .collection('signup')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .get();

    nameController =
        TextEditingController(text: userData.data()?['firstName'] ?? '');
    emailController =
        TextEditingController(text: userData.data()?['email'] ?? '');
  }

  Future<void> editProfileUpdate() async {
    // EasyLoading.show(status: 'loading...');

    final FirebaseAuth auth = FirebaseAuth.instance;
    String? email = auth.currentUser?.email;

    return firestore.collection('signup').doc(email).update({
      'firstName': nameController.text,
      'servertime': FieldValue.serverTimestamp(),
    });
  }
}
