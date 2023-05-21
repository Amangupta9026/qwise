import 'package:qwise/provider/course_details_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

import '../../../widget/bottom_navigationbar_widget.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGradient2,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: HeaderWidget(
            text1: 'Course Name',
            isCenterTitle: true,
            leading1: Icons.arrow_back,
            actions1: MdiIcons.bell,
            onActionPressed: () {},
          )),
      bottomNavigationBar: BottomNavigationBarWidget(
        buttonName: 'Enroll Now',
        onButtonPressed: () {},
      ),
      body: Container(
        decoration: AppUtils.decoration1(),
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text1:
                        'Learn Principle of Flutter Course (website and mobile)',
                    color1: colortext,
                    size1: 20.0,
                    fontWeight1: FontWeight.bold,
                  ),
                  const SizedBox(height: 20.0),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushNamed(RouteNames.courseDetails);
                        },
                        child: Container(
                          margin: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          height: MediaQuery.of(context).size.height * 0.284,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 10)
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 12, 10, 0),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/course1.png',
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 128.0,
                        left: 30.0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 10)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(children: [
                                          Image.asset(
                                              'assets/images/profile1.png'),
                                          Image.asset(
                                              'assets/images/profile2.png'),
                                          Image.asset(
                                              'assets/images/profile3.png'),
                                        ]),
                                      ),
                                    ),

                                    // another container for details
                                    Container(
                                        margin:
                                            const EdgeInsets.only(right: 30),
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10)
                                          ],
                                        ),
                                        child: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: TextWidget(
                                              text1: 'Rs 5000/-  4.7(1.0k)',
                                              color1: Colors.white,
                                            )))
                                  ]),
                              const SizedBox(height: 12.0),
                              const TextWidget(
                                text1: 'Flutter Course by Aman Gupta',
                                color1: colortext,
                                size1: 20.0,
                                fontWeight1: FontWeight.bold,
                              ),
                            ]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  const TextWidget(
                    text1: 'Course Description',
                    color1: colortext,
                    size1: 20.0,
                    fontWeight1: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  const TextWidget(
                    text1:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc aliquam aliquet. Sed vitae nisi eget nunc aliquam aliquet.',
                    color1: colortext,
                    size1: 15.0,
                  ),
                  const SizedBox(height: 20.0),
                  const TextWidget(
                    text1: 'Course Content',
                    color1: colortext,
                    size1: 20.0,
                    fontWeight1: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  const TextWidget(
                    text1:
                        "Data Analytics is an rapidly growing area in high demand (e.g., McKinsey) Statistics play a key role in the process of making sound business decisions that will generate higher profits. Without statistics, it's difficult to determine what your target audience wants and needs.",
                    color1: colortext,
                    size1: 15.0,
                  ),
                  const SizedBox(height: 20.0),
                  //Learn More

                  Consumer<CourseDetailsNotifier>(
                      builder: (context, ref, child) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ref.showMore();
                          },
                          child: Row(children: [
                            TextWidget(
                              text1:
                                  !ref.isShowMore ? 'Show More' : 'Show Less',
                              color1: Colors.black,
                              size1: 15.0,
                              fontWeight1: FontWeight.bold,
                            ),
                            const SizedBox(width: 5.0),
                            ref.isShowMore
                                ? const Icon(MdiIcons.arrowDown)
                                : const Icon(MdiIcons.arrowUp),
                          ]),
                        ),
                        const SizedBox(height: 14.0),
                        ref.isShowMore
                            ? const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text1: "What you'll learn",
                                    color1: colortext,
                                    size1: 20.0,
                                    fontWeight1: FontWeight.bold,
                                  ),
                                  SizedBox(height: 10.0),
                                  TextWidget(
                                    text1:
                                        "In this course, you will gain proficiency in how to analyze a number of statistical procedures in SPSS. You will learn how to interpret the output of a number of different statistical tests Learn how to write the results of statistical analyses using APA format's guidelines",
                                    color1: colortext,
                                    size1: 15.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  TextWidget(
                                    text1:
                                        "You will learn how to create beautiful mobile & web user interfaces that you can then turn into live prototypes with the help of Figma. Figma is a leading design software, helping teams and individuals create designs faster and more efficiently. Figma is free and you can use it right on your web browser, on Mac and Windows.",
                                    color1: Colors.black,
                                    size1: 15.0,
                                  ),
                                  SizedBox(height: 20.0),
                                  TextWidget(
                                    text1: "Requirements",
                                    color1: colortext,
                                    size1: 20.0,
                                    fontWeight1: FontWeight.bold,
                                  ),
                                  SizedBox(height: 10.0),
                                  TextWidget(
                                    text1:
                                        "Laptop or PC with Internet Connection and a Browser (Chrome, Safari, Firefox, etc.), No prior knowledge of Figma is required, No prior knowledge of design is required\n\n1 Mobile Device (Android or iOS) to test your designs on a real device, No prior knowledge of Figma is required, No prior knowledge of design is required",
                                    color1: colortext,
                                    size1: 15.0,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
