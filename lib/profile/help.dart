import 'package:qwise/provider/help_support_notifier.dart';

import '../utils/file_collection.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: HeaderWidget(
          text1: 'Help & Support',
          isCenterTitle: true,
        ),
      ),
      body: Container(
        decoration: AppUtils.decoration1(),
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text1: 'Subject',
                  fontWeight1: FontWeight.bold,
                  size1: 18,
                ),
                const SizedBox(height: 15),
                Consumer<HelpSupportNotifier>(builder: (context, ref, child) {
                  return TextFormFieldWidget(
                    controller1: ref.subjectController,
                    hinttext1: 'Please type subject',
                  );
                }),
                const SizedBox(height: 30),
                const TextWidget(
                  text1: 'Message',
                  fontWeight1: FontWeight.bold,
                  size1: 18,
                ),
                const SizedBox(height: 15),
                Consumer<HelpSupportNotifier>(builder: (context, ref, child) {
                  return TextFormFieldWidget(
                    controller1: ref.messageController,
                    hinttext1: 'Please type your message',
                    maxLines: 5,
                  );
                }),
                const SizedBox(height: 40),
                Consumer<HelpSupportNotifier>(builder: (context, ref, child) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () {
                        ref.onSubmit(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                      ),
                      child: const TextWidget(
                        text1: 'Submit',
                        color1: Colors.white,
                        size1: 16,
                        fontWeight1: FontWeight.w500,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
