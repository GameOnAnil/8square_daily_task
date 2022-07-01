import 'dart:convert';

class Book {
  final int? id;
  final String name;
  final String author;
  final double price;
  final int categoryId;

  Book(
      {this.id,
      required this.name,
      required this.author,
      required this.price,
      required this.categoryId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'price': price,
      'category_id': categoryId,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      author: map['author'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      categoryId: map['category_id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));
}
