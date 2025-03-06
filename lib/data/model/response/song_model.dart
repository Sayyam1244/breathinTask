class SongModel {
  final int duration;
  final String name;
  final String type;
  final String url;
  final String image;
  final String author;

  SongModel({
    required this.duration,
    required this.name,
    required this.type,
    required this.url,
    required this.image,
    required this.author,
  });

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      image: json['image'],
      duration: json['duration'],
      name: json['name'],
      type: json['type'],
      url: json['url'],
      author: json['author'],
    );
  }
}
