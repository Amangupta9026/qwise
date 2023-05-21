import 'package:qwise/provider/course_videos_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

import '../../widget/pod_player.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CourseVideoNotifier>(builder: (context, ref, child) {
          return Column(
            children: [
              PodPlayerView(videoUrl: ref.videos[0].url),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ref.videos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          Image.network(ref.videos[index].thumbnails.lowResUrl),
                      title: Text(ref.videos[index].title),
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
