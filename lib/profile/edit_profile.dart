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
              text1: 'Edit Profile',
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
              Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 120,
                      width: 120,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/solmon_boi.jpg'),
                            fit: BoxFit.cover,
                          )))),
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
