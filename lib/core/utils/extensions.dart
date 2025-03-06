extension TimeExtensions on int {
  String get secsToDuration {
    String duration =
        Duration(seconds: this).toString().split('.').first.padLeft(8, "0");
    if (duration.startsWith("00:")) {
      duration = duration.substring(3);
    }
    return duration;
  }
}
