import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CourseVideoNotifier extends ChangeNotifier {
  List<Video> videos = [];
  Video? currentVideo;

  void setCurrentVideo(Video video) {
    currentVideo = video;
    notifyListeners();
  }

  setVideos(List<Video> videos) {
    this.videos = videos;
    notifyListeners();
  }
}
