import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:provider/provider.dart';
import 'video_progress_provider.dart';

class CoursePage extends StatefulWidget {
  final String playlistUrl;
  final String title;

  CoursePage({required this.playlistUrl, required this.title});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Map<String, String>> videos = [];
  bool isLoading = true;
  late YoutubePlayerController _controller;

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
      isLoading = false;
    });

    _initializePlayer();
  }

  void _initializePlayer() {
    final progressProvider =
        Provider.of<VideoProgressProvider>(context, listen: false);
    int lastIndex = progressProvider.currentVideoIndex;
    Duration lastPosition = progressProvider.lastPosition;

    _controller = YoutubePlayerController(
      initialVideoId: videos.isNotEmpty ? videos[lastIndex]['id']! : '',
      flags: YoutubePlayerFlags(autoPlay: true, mute: false),
    )..addListener(() {
        if (_controller.value.playerState == PlayerState.ended) {
          _playNextVideo();
        }
        _saveProgress();
      });

    _controller.seekTo(lastPosition);
  }

  void _onVideoTap(int index) {
    final progressProvider =
        Provider.of<VideoProgressProvider>(context, listen: false);
    progressProvider.saveProgress(index, 0); // Reset position

    setState(() {
      _controller.load(videos[index]['id']!);
    });
  }

  void _playNextVideo() {
    final progressProvider =
        Provider.of<VideoProgressProvider>(context, listen: false);

    if (progressProvider.currentVideoIndex < videos.length - 1) {
      progressProvider.saveProgress(progressProvider.currentVideoIndex + 1, 0);

      setState(() {
        _controller.load(videos[progressProvider.currentVideoIndex]['id']!);
      });
    }
  }

  void _saveProgress() {
    final progressProvider =
        Provider.of<VideoProgressProvider>(context, listen: false);
    progressProvider.saveProgress(progressProvider.currentVideoIndex,
        _controller.value.position.inSeconds);
  }

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<VideoProgressProvider>(context);

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
                          onTap: () {
                            debugPrint("$progressProvider");
                            _onVideoTap(index);
                          },
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
