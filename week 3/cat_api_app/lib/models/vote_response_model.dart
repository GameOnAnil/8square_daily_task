import 'dart:convert';

class VoteResponse {
  String message;
  int id;
  VoteResponse({
    required this.message,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'id': id,
    };
  }

  factory VoteResponse.fromMap(Map<String, dynamic> map) {
    return VoteResponse(
      message: map['message'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VoteResponse.fromJson(String source) =>
      VoteResponse.fromMap(json.decode(source));
}
