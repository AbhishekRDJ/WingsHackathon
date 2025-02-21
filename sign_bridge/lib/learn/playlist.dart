import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class CoursePage extends StatefulWidget {
  final String playlistUrl;
  final String title;

  CoursePage({required this.playlistUrl, required this.title});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Map<String, String>> videos = [];
  int _currentVideoIndex = 0;
  late YoutubePlayerController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPlaylistVideos();
  }

  Future<void> _fetchPlaylistVideos() async {
    var yt = YoutubeExplode();
    var playlist = await yt.playlists.get(widget.playlistUrl);
    var videoList = <Map<String, String>>[];

    await for (var video in yt.playlists.getVideos(playlist.id)) {
      videoList.add({
        'id': video.id.value,
        'title': video.title,
        'thumbnail': video.thumbnails.standardResUrl,
        'duration': video.duration?.toString().split('.')[0] ?? 'Unknown',
      });
    }

    yt.close();

    setState(() {
      videos = videoList;
      _initializePlayer();
      isLoading = false;
    });
  }

  void _initializePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: videos[_currentVideoIndex]['id']!,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    )..addListener(() {
        if (_controller.value.playerState == PlayerState.ended) {
          _playNextVideo();
        }
      });
  }

  void _playNextVideo() {
    if (_currentVideoIndex < videos.length - 1) {
      setState(() {
        _currentVideoIndex++;
        _controller.load(videos[_currentVideoIndex]['id']!);
      });
    }
  }

  void _onVideoTap(int index) {
    setState(() {
      _currentVideoIndex = index;
      _controller.load(videos[index]['id']!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: YoutubePlayer(controller: _controller),
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(12),
                      itemCount: videos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _onVideoTap(index),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.grey[900],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.1),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    videos[index]['thumbnail']!,
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        videos[index]['title']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "Duration: ${videos[index]['duration']}",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
