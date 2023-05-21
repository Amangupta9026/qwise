import 'package:pod_player/pod_player.dart';
import 'package:qwise/provider/course_videos_notifier.dart';
import 'package:qwise/utils/file_collection.dart';

class PodPlayerView extends StatefulWidget {
  final String videoUrl;
  final String videoThumbnail;
  PodPlayerController? podPlayerController;
  PodPlayerView(
      {required this.videoUrl,
      required this.videoThumbnail,
      required this.podPlayerController,
      super.key});

  @override
  State<PodPlayerView> createState() => _PodPlayerViewState();
}

class _PodPlayerViewState extends State<PodPlayerView> {
  @override
  void initState() {
    super.initState();
    widget.podPlayerController = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(autoPlay: true),
      playVideoFrom: PlayVideoFrom.youtube(
        widget.videoUrl,
      ),
    )..initialise();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.podPlayerController == null) {
      Provider.of<CourseVideoNotifier>(context).init();
    }
    return PodVideoPlayer(
      key: ValueKey(widget.videoUrl),
      controller: widget.podPlayerController!,
      podProgressBarConfig: const PodProgressBarConfig(
        bufferedBarColor: primaryColor,
        circleHandlerColor: primaryColor,
        playingBarColor: primaryColor,
      ),
      videoThumbnail: DecorationImage(
        image: Image.network(widget.videoThumbnail).image,
        fit: BoxFit.cover,
      ),
    );
  }
}
