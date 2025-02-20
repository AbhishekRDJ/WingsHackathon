import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String recognizedText = "";

  SpeechToTextService() {
    _speech = stt.SpeechToText();
  }

  Future<void> startListening(Function(String) onResult) async {
    bool available = await _speech.initialize();
    print("Speech-to-Text initialized: $available");

    if (available) {
      _speech.listen(
        onResult: (result) {
          recognizedText = result.recognizedWords;
          print("Recognized words: $recognizedText"); // Debugging output
          onResult(recognizedText); // Update UI
        },
      );
    } else {
      print("Speech-to-Text is not available.");
    }
  }

  void stopListening() {
    _speech.stop();
  }
}
