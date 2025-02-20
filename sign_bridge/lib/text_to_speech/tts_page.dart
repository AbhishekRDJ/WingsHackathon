import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class TTSPage extends StatefulWidget {
  @override
  _TTSPageState createState() => _TTSPageState();
}

class _TTSPageState extends State<TTSPage> with SingleTickerProviderStateMixin {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textController = TextEditingController();
  bool isSpeaking = false;
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    // Staggered animations for each dot
    _animations = List.generate(
      4,
      (index) => Tween<double>(begin: 0.5, end: 1.2).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 1.0, curve: Curves.easeInOut),
        ),
      ),
    );

    flutterTts.setStartHandler(() {
      setState(() => isSpeaking = true);
      _controller.repeat(reverse: true);
    });

    flutterTts.setCompletionHandler(() {
      setState(() => isSpeaking = false);
      _controller.stop();
    });

    flutterTts.setCancelHandler(() {
      setState(() => isSpeaking = false);
      _controller.stop();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _speak() async {
    String text = textController.text.trim();
    if (text.isNotEmpty) {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setPitch(1.0);
      await flutterTts.setVolume(1.0);
      await flutterTts.speak(text);
    }
  }

  Future<void> _stop() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A148C),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text Field
              Text(
                "Text To Speech",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(66, 63, 62, 62),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: textController,
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                      hintText: "Enter text to speak...",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.white60, fontSize: 16),
                      border: InputBorder.none,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Animated Speaking Indicator
              if (isSpeaking)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return ScaleTransition(
                          scale: _animations[index],
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.lerp(Colors.white, Colors.blueAccent,
                                  _animations[index].value),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),

              SizedBox(height: 30),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _speak,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text("Speak",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  GestureDetector(
                    onTap: _stop,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text("Stop",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
