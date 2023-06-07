import 'package:flutter/cupertino.dart';
import 'package:qwise/provider/course_videos_notifier.dart';
import 'package:qwise/utils/file_collection.dart';
import 'package:qwise/widget/pod_player.dart';

class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<CourseVideoNotifier>().podPlayerController?.pause();
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: Consumer<CourseVideoNotifier>(builder: (context, ref, child) {
            ref.init();
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 16, 16, 15),
                  decoration: AppUtils.decoration1(),
                  child: Row(children: [
                    InkWell(
                        onTap: () {
                          context
                              .read<CourseVideoNotifier>()
                              .podPlayerController
                              ?.pause();
                          context.pop();
                        },
                        child: const Icon(Icons.arrow_back, size: 30)),
                    const Spacer(),
                    const Text('Video',
                        style: TextStyle(
                            fontSize: 18,
                            color: colortext,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                  ]),
                ),
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
                              loadingBuilder:
                                  (context, child, loadingProgress) {
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
      ),
    );
  }
}
