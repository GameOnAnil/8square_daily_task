import 'dart:convert';

import 'package:dbhelper/utils/mycolors.dart';

class Category {
  final int? id;
  final String title;
  final String image;
  final int color;
  final int textColor;

  Category(
      {this.id,
      required this.title,
      required this.image,
      required this.color,
      required this.textColor});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'color': color,
      'textColor': textColor,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      color: map['color']?.toInt() ?? 0,
      textColor: map['textColor']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));
}

final dummyCategoryList = [
  Category(
      image: "assets/images/math.png",
      title: "Math",
      color: MyColors.blueColor.value,
      textColor: MyColors.blueColorDark.value),
  Category(
      image: "assets/images/science.png",
      title: "Science",
      color: MyColors.yellowColor.value,
      textColor: MyColors.yellowColorDark.value),
  Category(
      image: "assets/images/economic.png",
      title: "Economic",
      color: MyColors.greenColor.value,
      textColor: MyColors.greenColorDark.value),
  Category(
      image: "assets/images/computer.png",
      title: "Computer",
      color: MyColors.orangeColor.value,
      textColor: MyColors.orangeColorDark.value),
];
