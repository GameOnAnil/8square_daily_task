class Image {
  String? id;
  int? width;
  int? height;
  String? url;

  Image({this.id, this.width, this.height, this.url});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      id: map['id'],
      width: map['width']?.toInt(),
      height: map['height']?.toInt(),
      url: map['url'],
    );
  }
}
