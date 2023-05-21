import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker_pro/image_picker_pro.dart';

import '../utils/file_collection.dart';

class EditProfileNotifier extends ChangeNotifier {
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
}
