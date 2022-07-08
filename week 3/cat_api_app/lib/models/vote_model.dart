import 'dart:convert';

class Vote {
  String imageId;
  int value;
  String subId;
  Vote({
    required this.imageId,
    required this.value,
    required this.subId,
  });

  Map<String, dynamic> toMap() {
    return {
      'image_id': imageId,
      'value': value,
      'sub_id': subId,
    };
  }

  factory Vote.fromMap(Map<String, dynamic> map) {
    return Vote(
      imageId: map['image_id'] ?? '',
      value: map['value']?.toInt() ?? 0,
      subId: map['sub_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Vote.fromJson(String source) => Vote.fromMap(json.decode(source));
}
