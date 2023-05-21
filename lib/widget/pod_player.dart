import 'package:flutter/widgets.dart';
import 'package:pod_player/pod_player.dart';

class PodPlayerView extends StatefulWidget {
  final String videoUrl;
  final String videoThumbnail;
  const PodPlayerView(
      {required this.videoUrl, required this.videoThumbnail, super.key});

  @override
  State<PodPlayerView> createState() => _PodPlayerViewState();
}

class _PodPlayerViewState extends State<PodPlayerView> {
  late PodPlayerController podPlayerController;
  @override
  void initState() {
    super.initState();
    podPlayerController = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(autoPlay: false),
      playVideoFrom: PlayVideoFrom.youtube(
        widget.videoUrl,
      ),
    )..initialise();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      controller: podPlayerController,
      videoThumbnail: DecorationImage(
          image: Image.network(widget.videoThumbnail).image, fit: BoxFit.cover),
    );
  }
}