import 'package:flutter/material.dart';
import 'package:sign_bridge/services/speech_to_text_service.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenOfVTS extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenOfVTS> {
  SpeechToTextService speechService = SpeechToTextService();
  String displayedText = "";
  VideoPlayerController? _controller;
  String? assetPath;
  bool isLoading = false;

  void _loadVideo(String word) {
    Map<String, String> signDictionary = {
      "hello": "assets/sign/hello.mp4",
    };

    assetPath = signDictionary[word.toLowerCase()];
    if (assetPath != null) {
      setState(() {
        isLoading = true;
      });

      _controller?.dispose();
      _controller = VideoPlayerController.asset(assetPath!)
        ..initialize().then((_) {
          setState(() {
            isLoading = false;
          });
          _controller!.setVolume(0);
          _controller!.setLooping(true);
          _controller!.play();
        }).catchError((error) {
          print("Error initializing video: $error");
          setState(() {
            isLoading = false;
          });
        });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Voice to Sign Converter",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    displayedText.isEmpty
                        ? "🎤 Speak something..."
                        : displayedText,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      speechService.startListening((text) {
                        setState(() {
                          displayedText = text;
                        });
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purpleAccent.withOpacity(0.6),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.mic_rounded,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: displayedText.isNotEmpty
                        ? () {
                            _loadVideo(displayedText);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyanAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_circle_fill,
                            color: Colors.black, size: 30),
                        SizedBox(width: 10),
                        Text(
                          "Show Sign",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildVideoContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoContainer() {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : assetPath != null &&
                  _controller != null &&
                  _controller!.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  ),
                )
              : Center(
                  child: Text(
                    displayedText.isNotEmpty
                        ? "Sign not found for '$displayedText'"
                        : "",
                    style: GoogleFonts.poppins(fontSize: 18, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
    );
  }
}
