import 'dart:convert';

class HistoryItem {
  String urlImg;
  String name;
  int id;
  HistoryItem({
    required this.urlImg,
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'urlImg': urlImg,
      'name': name,
      'id': id,
    };
  }

  factory HistoryItem.fromMap(Map<String, dynamic> map) {
    return HistoryItem(
      urlImg: map['urlImg'],
      name: map['name'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryItem.fromJson(String source) =>
      HistoryItem.fromMap(json.decode(source));
}
