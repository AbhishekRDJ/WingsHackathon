import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoProgressProvider with ChangeNotifier {
  int _currentVideoIndex = 0;
  Duration _lastPosition = Duration.zero;

  int get currentVideoIndex => _currentVideoIndex;
  Duration get lastPosition => _lastPosition;

  VideoProgressProvider() {
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentVideoIndex = prefs.getInt('lastVideoIndex') ?? 0;
    int lastPositionSeconds = prefs.getInt('lastVideoPosition') ?? 0;
    _lastPosition = Duration(seconds: lastPositionSeconds);
    notifyListeners();
  }

  Future<void> saveProgress(int index, int position) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastVideoIndex', index);
    await prefs.setInt('lastVideoPosition', position);
    _currentVideoIndex = index;
    _lastPosition = Duration(seconds: position);
    notifyListeners();
  }
}
