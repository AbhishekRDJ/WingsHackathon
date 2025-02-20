class TextToSignService {
  static final Map<String, String> signMap = {
    "hello": "assets/signs/hello.mp4",
  };

  static String? getSignImage(String text) {
    return signMap[text.toLowerCase()];
  }
}
