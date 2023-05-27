import 'package:qwise/admin/admin_provider/admin_add_category_notifier.dart';
import 'package:qwise/utils/file_collection.dart';
import 'package:qwise/widget/bottom_navigationbar_widget.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGradient2,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: HeaderWidget(
          text1: 'Add Courses',
          isCenterTitle: true,
          actions1: MdiIcons.bell,
          onActionPressed: () {
            context.pushNamed(RouteNames.sendNotificationFromAdmin);
          },
        ),
      ),
      bottomNavigationBar:
          Consumer<AdminAddCategoryNotifier>(builder: (context, ref, child) {
        return BottomNavigationBarWidget(
          buttonName: 'Submit',
          color1: primaryColor,
          onButtonPressed: () {
            ref.onSubmitButton(context);
          },
        );
      }),
      body: Container(
        decoration: AppUtils.decoration1(),
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 20, 15, 60),
              child: Consumer<AdminAddCategoryNotifier>(
                  builder: (context, ref, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextWidget(
                      text1: 'Course Id',
                      size1: 18.0,
                      fontWeight1: FontWeight.w400,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller1: ref.courseIdController,
                      onChanged1: (value) {
                        ref.onButtonColorChange();
                      },
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(
                      text1: 'Course Name',
                      size1: 18.0,
                      fontWeight1: FontWeight.w400,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller1: ref.courseNameController,
                      onChanged1: (value) {
                        ref.onButtonColorChange();
                      },
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(
                      text1: 'Course PlayList',
                      size1: 18.0,
                      fontWeight1: FontWeight.w400,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller1: ref.coursePlaylistController,
                      onChanged1: (value) {
                        ref.onButtonColorChange();
                      },
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(
                      text1: 'Image',
                      size1: 18.0,
                      fontWeight1: FontWeight.w400,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller1: ref.imageController,
                      onChanged1: (value) {
                        // ref.buttonColorChange();
                      },
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(
                      text1: 'Language',
                      size1: 18.0,
                      fontWeight1: FontWeight.w400,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller1: ref.languageController,
                      onChanged1: (value) {
                        ref.onButtonColorChange();
                      },
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(
                      text1: 'Price',
                      size1: 18.0,
                      fontWeight1: FontWeight.w400,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller1: ref.priceController,
                      onChanged1: (value) {
                        ref.onButtonColorChange();
                      },
                    ),
                    const SizedBox(height: 20),
                    const TextWidget(
                      text1: 'Type',
                      size1: 18.0,
                      fontWeight1: FontWeight.w400,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormFieldWidget(
                      controller1: ref.typeController,
                      onChanged1: (value) {
                        ref.onButtonColorChange();
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
