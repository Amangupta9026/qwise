import 'package:flutter/cupertino.dart';
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
              PodPlayerView(
                videoUrl: ref.currentVideo?.url ?? ref.videos[0].url,
                videoThumbnail: ref.currentVideo?.thumbnails.standardResUrl ??
                    ref.videos[0].thumbnails.standardResUrl,
                podPlayerController: ref.podPlayerController,
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: ref.videos.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        onTap: () {
                          ref.setCurrentVideo(ref.videos[index]);
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            ref.videos[index].thumbnails.lowResUrl,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return const CupertinoActivityIndicator();
                            },
                          ),
                        ),
                        title: Text(
                          ref.videos[index].title,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.time,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${ref.videos[index].duration?.inMinutes} mins",
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
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
