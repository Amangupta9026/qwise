import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qwise/utils/file_collection.dart';

class RecommendedCourses extends StatelessWidget {
  RecommendedCourses({super.key});

  final List? images = [
    Image.asset('assets/images/profile1.png'),
    Image.asset('assets/images/profile2.png'),
    Image.asset('assets/images/profile3.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.only(left: 10.0, bottom: 20),
          child: TextWidget(
            text1: "Recommended Courses",
            size1: 16,
            color1: lightBlueColor,
            fontWeight1: FontWeight.w600,
          ),
        ),
        Stack(
          children: [
            InkWell(
              onTap: () {
                context.pushNamed(RouteNames.courseDetails);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                padding: EdgeInsets.zero,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, blurRadius: 10)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 0),
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
              top: 90.0,
              left: 30.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Course Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(color: Colors.grey, blurRadius: 10)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(children: [
                                  for (int i = 0; i < images!.length; i++)
                                    images?[i],
                                ]),
                              )),

                          // another container for details
                          Container(
                              margin: const EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(color: Colors.grey, blurRadius: 10)
                                ],
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextWidget(
                                    text1: 'View Details',
                                    color1: Colors.white,
                                  )))
                        ]),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const TextWidget(
                          text1: 'Learn Principle of UX & U...',
                          color1: primaryColor,
                          size1: 18,
                          fontWeight1: FontWeight.bold,
                        ),
                        const SizedBox(width: 10.0),
                        const TextWidget(
                          text1: 'Live',
                          color1: primaryColor,
                          size1: 18,
                          fontWeight1: FontWeight.w600,
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                            height: 6,
                            width: 6,
                            decoration: const BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle))
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        const TextWidget(
                          text1: 'Rs 3000/-',
                          color1: primaryColor,
                          size1: 16,
                          fontWeight1: FontWeight.bold,
                        ),
                        const SizedBox(width: 10.0),
                        RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: 5.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: yellowColor,
                            size: 2,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 10.0),
                        const TextWidget(
                          text1: '4.7 (1.0k)',
                          color1: primaryColor,
                          size1: 16,
                          fontWeight1: FontWeight.bold,
                        )
                      ],
                    )
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
