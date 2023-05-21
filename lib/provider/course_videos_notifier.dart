import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CourseVideoNotifier extends ChangeNotifier {
  List<Video> videos = [];

  setVideos(List<Video> videos) {
    this.videos = videos;
    notifyListeners();
  }
}
