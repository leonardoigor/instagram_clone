import 'dart:convert';

class FeedItem {
  String urlImg;
  String title;
  String urlContent;
  int id;
  FeedItem({
    required this.urlImg,
    required this.title,
    required this.urlContent,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'urlImg': urlImg,
      'title': title,
      'urlContent': urlContent,
    };
  }

  factory FeedItem.fromMap(Map<String, dynamic> map) {
    return FeedItem(
      urlImg: map['urlImg'],
      title: map['title'],
      urlContent: map['urlContent'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItem.fromJson(String source) =>
      FeedItem.fromMap(json.decode(source));
}
