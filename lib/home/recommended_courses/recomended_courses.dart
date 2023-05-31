import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:qwise/utils/file_collection.dart';

import '../enrolled_courses.dart';

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
        const TextWidget(
          text1: "Recommended Courses",
          size1: 16,
          color1: lightBlueColor,
          fontWeight1: FontWeight.w600,
        ),
        const SizedBox(height: 10),
        StreamBuilder(
            stream: courseCollection
                .orderBy("course_id", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              final courses = snapshot.data?.docs;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: courses?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(RouteNames.courseDetails,
                              queryParameters: {
                                "courseId":
                                    courses?[index]["course_id"].toString() ??
                                        "",
                              });
                        },
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      child: Image.network(
                                        courses?[index]["image"] ?? "",
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        height: 160,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    Positioned.fill(
                                      bottom: -20,
                                      right: 10,
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: darkBlueColor,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                color: Colors.white,
                                              ))),
                                          onPressed: () {
                                            context.pushNamed(
                                                RouteNames.courseDetails,
                                                queryParameters: {
                                                  "courseId": courses?[index]
                                                          ["course_id"] ??
                                                      ""
                                                });
                                          },
                                          child: const Text("View Details"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text1: courses?[index]["course_name"] ??
                                            "",
                                        color1: primaryColor,
                                        size1: 18,
                                        fontWeight1: FontWeight.bold,
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            ignoreGestures: true,
                                            initialRating: 4.7,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 16,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: yellowColor,
                                              size: 3,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ],
    );
  }
}
