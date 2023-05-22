import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwise/provider/course_videos_notifier.dart';
import 'package:qwise/utils/file_collection.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

CollectionReference<Map<String, dynamic>> courseCollection =
    FirebaseFirestore.instance.collection("course");

class EnrolledCourses extends StatelessWidget {
  EnrolledCourses({super.key});

  final yt = YoutubeExplode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: HeaderWidget(
          text1: 'Enrolled Courses',
          isCenterTitle: true,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: AppUtils.decoration1(),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30, 20, 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchCoursesTextField(),
                const SizedBox(height: 30.0),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: TextWidget(
                    text1: "Recommended Courses",
                    size1: 16,
                    color1: lightBlueColor,
                    fontWeight1: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                StreamBuilder(
                    stream: courseCollection.snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final data = snapshot.data?.docs;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () async {
                              List<Video> videos = [];
                              await for (var video in yt.playlists.getVideos(
                                  Uri.parse(data?[0]["course_playlist"] ?? "")
                                          .queryParameters["list"] ??
                                      "")) {
                                videos.add(video);
                              }
                              context
                                  .read<CourseVideoNotifier>()
                                  .setVideos(videos);
                              context.push(
                                RouteNames.courseView,
                              );
                            },
                            child: SizedBox(
                              height: 140,
                              child: Card(
                                surfaceTintColor: Colors.white,
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data?[0]["type"] ?? "",
                                              style: const TextStyle(
                                                color: colortext,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              data?[0]["course_name"] ?? "",
                                              style: const TextStyle(
                                                color: darkBlueColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffECE7FE),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xffC0C0FA),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    data?[0]["language"] ?? ""),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            data?[0]["image"] ?? "",
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
                const SizedBox(
                  height: 38,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
