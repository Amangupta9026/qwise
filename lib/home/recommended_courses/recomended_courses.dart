import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwise/utils/file_collection.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

CollectionReference<Map<String, dynamic>> courseCollection =
    FirebaseFirestore.instance.collection("course");

class RecommendedCourses extends StatelessWidget {
  RecommendedCourses({super.key});

  final yt = YoutubeExplode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recommended Courses"),
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
                  SizedBox(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data?[0]["type"] ?? "",
                                    style: const TextStyle(
                                      color: Colors.grey,
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
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: const Color(0xffC0C0FA),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data?[0]["language"] ?? ""),
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
                                borderRadius: BorderRadius.circular(12),
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
                  )
                ],
              );
            }),
      ],
    );
  }
}
