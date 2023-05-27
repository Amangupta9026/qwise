import 'package:flutter/cupertino.dart';
import 'package:qwise/provider/edit_profile_notifier.dart';
import 'package:qwise/utils/file_collection.dart';
import 'package:random_avatar/random_avatar.dart';

import '../widget/bottom_navigationbar_widget.dart';

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
        bottomNavigationBar:
            Consumer<EditProfileNotifier>(builder: (context, ref, child) {
          return BottomNavigationBarWidget(
            buttonName: 'Submit',
            onButtonPressed: () {
              ref.editProfileUpdate(context);
            },
          );
        }),
        body: FutureBuilder(
            future: Provider.of<EditProfileNotifier>(context, listen: false)
                .getUserData(),
            builder: (context, snapshot) {
              return Container(
                  decoration: AppUtils.decoration1(),
                  height: double.infinity,
                  child: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(children: [
                    Consumer<EditProfileNotifier>(
                        builder: (context, ref, child) {
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
                                  border: Border.all(color: colortext),
                                  image: FirebaseAuth
                                              .instance.currentUser?.photoURL !=
                                          null
                                      ? DecorationImage(
                                          image: ref.selectedImage != null
                                              ? FileImage(ref.selectedImage!)
                                              : Image.network(FirebaseAuth
                                                          .instance
                                                          .currentUser
                                                          ?.photoURL ??
                                                      "")
                                                  .image,
                                          fit: BoxFit.cover,
                                        )
                                      : null),
                              child:
                                  FirebaseAuth.instance.currentUser?.photoURL ==
                                          null
                                      ? RandomAvatar(
                                          FirebaseAuth.instance.currentUser
                                                  ?.email ??
                                              "xyz",
                                        )
                                      : null,
                            ),
                            Positioned.fill(
                              bottom: 0,
                              right: 4,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColor, width: 2),
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
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
                    Consumer<EditProfileNotifier>(
                        builder: (context, ref, child) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 60),
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                                controller1: ref.nameController),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                              controller1: ref.emailController,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                              controller1: ref.phoneController,
                            ),
                            const SizedBox(height: 20),
                            TextFormFieldWidget(
                                controller1: ref.cityController),
                          ],
                        ),
                      );
                    }),
                  ]))));
            }));
  }
}
