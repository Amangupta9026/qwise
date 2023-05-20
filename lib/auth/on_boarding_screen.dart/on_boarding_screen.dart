import '../../utils/file_collection.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD16ACF).withOpacity(0.9),
      body: SafeArea(
        child: onBoarding(context),
      ),
    );
  }

  Stack onBoarding(BuildContext context) {
    return Stack(
      children: [
        // Image Illustration
        Consumer<OnBoardingNotifier>(builder: (context, ref, child) {
          return Container(
            margin: const EdgeInsets.only(top: 0.0),
            child: Image(
              height: 640.0,
              image: AssetImage(ref.getImage()),
            ),
          );
        }),
        // Top Components
        Consumer<OnBoardingNotifier>(builder: (context, ref, child) {
          return Container(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ref.contentState != 0
                    ? GestureDetector(
                        onTap: () {
                          ref.previos(context);
                          
                        },
                        child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            )),
                      )
                    : const SizedBox(),
                ref.contentState != 2
                    ? Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: const BoxDecoration(),
                        child: InkWell(
                          // canRequestFocus: true,

                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                              fontFamily: "Sofia",
                              color: Colors.white,
                              fontSize: 19.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        }),
        // Content
        Align(
            alignment: FractionalOffset.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Container(
                decoration: AppUtils.decoration1(),
                width: double.infinity,
                padding: const EdgeInsets.all(32.0),
                child: Consumer<OnBoardingNotifier>(
                    builder: (context, ref, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      TextWidget(
                        text1: ref.getTitle(),
                        // getTitle(contentState),
                        textAlign1: TextAlign.center,
                        size1: 22,
                        fontWeight1: FontWeight.w700,
                      ),

                      const SizedBox(
                        height: 16.0,
                      ),
                      // Description
                      TextWidget(
                        text1: ref.getDescription(),
                        textAlign1: TextAlign.center,
                        size1: 18,
                        fontWeight1: FontWeight.w400,
                      ),

                      const SizedBox(
                        height: 40.0,
                      ),
                      // Bottom Components
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Indicator
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: 4.0,
                                  width: ref.contentState == 0 ? 18.0 : 12.0,
                                  color: ref.contentState == 0
                                      ? const Color(0xFFD16ACF)
                                      : const Color(0xFFCBD6F3),
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              // 1
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: 4.0,
                                  width: ref.contentState == 1 ? 18.0 : 12.0,
                                  color: ref.contentState == 1
                                      ? const Color(0xFFD16ACF)
                                      : const Color(0xFFCBD6F3),
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              // 2
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: 4.0,
                                  width: ref.contentState == 2 ? 18.0 : 12.0,
                                  color: ref.contentState == 2
                                      ? const Color(0xFFD16ACF)
                                      : const Color(0xFFCBD6F3),
                                ),
                              ),
                            ],
                          ),
                          // Button Next
                          GestureDetector(
                            onTap: () {
                              ref.nextPage(context);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: const BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            )),
      ],
    );
  }
}
