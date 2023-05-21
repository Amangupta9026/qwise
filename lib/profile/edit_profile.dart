import 'package:flutter/cupertino.dart';
import 'package:qwise/provider/edit_profile_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorGradient2,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: HeaderWidget(
            text1: 'Edit Profile',
            isCenterTitle: true,
            leading1: Icons.arrow_back,
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: colorGradient2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: const TextWidget(
              color1: colortext,
              text1: 'Submit',
              size1: 18,
              fontWeight1: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
            decoration: AppUtils.decoration1(),
            height: double.infinity,
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(children: [
              Consumer<EditProfileNotifier>(builder: (context, ref, child) {
                return InkWell(
                  onTap: () {
                    ref.imagePicker(context);
                  },
                  child: Center(
                      child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: ref.selectedImage != null
                                    ? Image.file(ref.selectedImage!).image
                                    : Image.network(FirebaseAuth.instance
                                                .currentUser?.photoURL ??
                                            "")
                                        .image,
                                fit: BoxFit.cover,
                              ))),
                      Positioned.fill(
                        bottom: 0,
                        right: 4,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                CupertinoIcons.camera,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                );
              }),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 60),
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      controller1: TextEditingController(
                        text: currentUser?.displayName ?? '',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      controller1: TextEditingController(
                        text: currentUser?.email ?? '',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextFormFieldWidget(
                      hinttext1: 'Enter your phone number',
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldWidget(
                      controller1: TextEditingController(
                        text: currentUser?.displayName ?? '',
                      ),
                    ),
                  ],
                ),
              ),
            ])))));
  }
}
