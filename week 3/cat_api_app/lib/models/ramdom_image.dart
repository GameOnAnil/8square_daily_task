import 'dart:convert';

class RandomImage {
  final String id;
  final String url;
  final int width;
  final int height;
  RandomImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory RandomImage.fromMap(Map<String, dynamic> map) {
    return RandomImage(
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      width: map['width']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RandomImage.fromJson(String source) =>
      RandomImage.fromMap(json.decode(source));
}
