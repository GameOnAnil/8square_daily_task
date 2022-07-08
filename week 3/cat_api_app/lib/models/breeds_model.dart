import 'dart:convert';

import 'package:cat_api_app/models/image.dart';

class Breeds {
  String? altNames;
  String? id;
  String? lifeSpan;
  String? name;
  String? description;
  String? origin;
  int? rare;
  String? referenceImageId;
  String? temperament;
  String? weightImperial;
  String? wikipediaUrl;
  Image? image;
  Breeds({
    this.altNames,
    this.id,
    this.lifeSpan,
    this.name,
    this.description,
    this.origin,
    this.rare,
    this.referenceImageId,
    this.temperament,
    this.weightImperial,
    this.wikipediaUrl,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'altNames': altNames,
      'id': id,
      'lifeSpan': lifeSpan,
      'name': name,
      'description': description,
      'origin': origin,
      'rare': rare,
      'referenceImageId': referenceImageId,
      'temperament': temperament,
      'weightImperial': weightImperial,
      'wikipediaUrl': wikipediaUrl,
      'image': image?.toMap(),
    };
  }

  factory Breeds.fromMap(Map<String, dynamic> map) {
    return Breeds(
      altNames: map['altNames'],
      id: map['id'],
      lifeSpan: map['lifeSpan'],
      name: map['name'],
      description: map['description'],
      origin: map['origin'],
      rare: map['rare']?.toInt(),
      referenceImageId: map['referenceImageId'],
      temperament: map['temperament'],
      weightImperial: map['weightImperial'],
      wikipediaUrl: map['wikipediaUrl'],
      image: map['image'] != null ? Image.fromMap(map['image']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Breeds.fromJson(String source) => Breeds.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Breeds(altNames: $altNames, id: $id, lifeSpan: $lifeSpan, name: $name, origin: $origin, rare: $rare, referenceImageId: $referenceImageId, temperament: $temperament, weightImperial: $weightImperial, wikipediaUrl: $wikipediaUrl)';
  }
}
