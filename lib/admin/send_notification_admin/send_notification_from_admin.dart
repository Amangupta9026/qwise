import 'package:qwise/admin/admin_provider/send_notification_from_admin_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

import '../../widget/bottom_navigationbar_widget.dart';

class SendNotificationFromAdmin extends StatelessWidget {
  const SendNotificationFromAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGradient2,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: HeaderWidget(
          text1: 'Send Notification',
          isCenterTitle: true,
          leading1: Icons.arrow_back,
        ),
      ),
      bottomNavigationBar: Consumer<SendNotificationfromAdminNotifier>(
          builder: (context, ref, child) {
        return BottomNavigationBarWidget(
          buttonName: 'Submit',
          color1: primaryColor,
          onButtonPressed: () {
            ref.sendNotification(
                title: ref.titleController.text,
                message: ref.messageController.text);
          },
        );
      }),
      body: Container(
        decoration: AppUtils.decoration1(),
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text1: 'Title',
                size1: 18.0,
                fontWeight1: FontWeight.w400,
              ),
              const SizedBox(height: 10.0),
              Consumer<SendNotificationfromAdminNotifier>(
                  builder: (context, ref, child) {
                return TextFormFieldWidget(
                  controller1: ref.titleController,
                  onChanged1: (value) {
                    // ref.buttonColorChange();
                  },
                );
              }),
              const SizedBox(height: 20),
              const TextWidget(
                text1: 'Message',
                size1: 18.0,
                fontWeight1: FontWeight.w400,
              ),
              const SizedBox(height: 10.0),
              Consumer<SendNotificationfromAdminNotifier>(
                  builder: (context, ref, child) {
                return TextFormFieldWidget(
                  controller1: ref.messageController,
                  onChanged1: (value) {
                    //    ref.buttonColorChange();
                  },
                );
              }),
              const SizedBox(height: 20),
              const TextWidget(
                text1: 'Image',
                size1: 18.0,
                fontWeight1: FontWeight.w400,
              ),
              const SizedBox(height: 10.0),
              Consumer<SendNotificationfromAdminNotifier>(
                  builder: (context, ref, child) {
                return TextFormFieldWidget(
                  // controller1: ref.,
                  onChanged1: (value) {
                    //    ref.buttonColorChange();
                  },
                );
              }),
            ],
          ),
        ))),
      ),
    );
  }
}
