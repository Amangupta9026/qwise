import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CourseVideoNotifier extends ChangeNotifier {
  List<Video> videos = [];
  Video? currentVideo;
  PodPlayerController? podPlayerController;

  init() {
    podPlayerController = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(autoPlay: true),
      playVideoFrom: PlayVideoFrom.youtube(
        currentVideo?.url ?? videos[0].url,
      ),
    )..initialise();
  }

  void setCurrentVideo(Video video) {
    currentVideo = video;
    podPlayerController?.changeVideo(
      playerConfig: const PodPlayerConfig(autoPlay: true),
      playVideoFrom: PlayVideoFrom.youtube(
        video.url,
      ),
    );
    notifyListeners();
  }

  setVideos(List<Video> videos) {
    this.videos = videos;
    notifyListeners();
  }
}
