import 'dart:developer';

import '../../utils/file_collection.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // content state
  int contentState = 0;

  // List of title
  List<String> titles = [
    'Access learning as per your schedule.',
    'Discover passion. Learn with joy.',
    'Learn from home',
  ];

  // List of descriptions
  List<String> descriptions = [
    'We are here to teach you \nOur mentor are available and \nmonitor your skills 24 hrs/Day',
    'always attend online classes and Excel your career by gaining new skills.',
    'to avoid the spread of covid 19. \nyou can do learn work from home and\nalways be close to your family',
  ];

  // List of images path
  List<String> images = [
    'assets/images/learning1.png',
    'assets/images/learning1.png',
    'assets/images/learning1.png',
  ];

  // Get Title
  String getTitle(int contentState) {
    if (contentState == 0) {
      return titles[0];
    } else if (contentState == 1) {
      return titles[1];
    } else {
      return titles[2];
    }
  }

  // Get Description
  String getDescription(int contentState) {
    if (contentState == 0) {
      return descriptions[0];
    } else if (contentState == 1) {
      return descriptions[1];
    } else {
      return descriptions[2];
    }
  }

  // Get Images
  String getImage(int contentState) {
    if (contentState == 0) {
      return images[0];
    } else if (contentState == 1) {
      return images[1];
    } else {
      return images[2];
    }
  }

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
        Container(
          margin: const EdgeInsets.only(top: 0.0),
          child: Image(
            height: 640.0,
            image: AssetImage(getImage(contentState)),
          ),
        ),
        // Top Components
        Container(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              contentState != 0
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          contentState--;
                          log(contentState.toString());
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    )
                  : const SizedBox(),
              contentState != 2
                  ? Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(),
                      child: InkWell(
                        // canRequestFocus: true,

                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
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
        ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  TextWidget(
                    text1: getTitle(contentState),
                    textAlign1: TextAlign.center,
                    size1: 22,
                    fontWeight1: FontWeight.w700,
                  ),

                  const SizedBox(
                    height: 16.0,
                  ),
                  // Description
                  TextWidget(
                    text1: getDescription(contentState),
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
                          // 0
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Container(
                              height: 4.0,
                              width: contentState == 0 ? 18.0 : 12.0,
                              color: contentState == 0
                                  ? const Color(0xFFD16ACF)
                                  : const Color(0xFFCBD6F3),
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          // 1
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Container(
                              height: 4.0,
                              width: contentState == 1 ? 18.0 : 12.0,
                              color: contentState == 1
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
                              width: contentState == 2 ? 18.0 : 12.0,
                              color: contentState == 2
                                  ? const Color(0xFFD16ACF)
                                  : const Color(0xFFCBD6F3),
                            ),
                          ),
                        ],
                      ),
                      // Button Next
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (contentState <= 2) {
                              contentState++;
                            }
                            if (contentState == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           SignUpScreen()));
                            }
                          });
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
