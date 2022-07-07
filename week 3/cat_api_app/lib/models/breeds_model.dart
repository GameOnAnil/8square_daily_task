import 'dart:convert';

class Breeds {
  String? altNames;
  String? id;
  String? lifeSpan;
  String? name;
  String? origin;
  int? rare;
  String? referenceImageId;
  String? temperament;
  String? weightImperial;
  String? wikipediaUrl;
  Breeds({
    this.altNames,
    this.id,
    this.lifeSpan,
    this.name,
    this.origin,
    this.rare,
    this.referenceImageId,
    this.temperament,
    this.weightImperial,
    this.wikipediaUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'alt_names': altNames,
      'id': id,
      'life_span': lifeSpan,
      'name': name,
      'origin': origin,
      'rare': rare,
      'reference_image_id': referenceImageId,
      'temperament': temperament,
      'weight_imperial': weightImperial,
      'wikipedia_url': wikipediaUrl,
    };
  }

  factory Breeds.fromMap(Map<String, dynamic> map) {
    return Breeds(
      altNames: map['alt_names'],
      id: map['id'],
      lifeSpan: map['life_span'],
      name: map['name'],
      origin: map['origin'],
      rare: map['rare']?.toInt(),
      referenceImageId: map['reference_image_id'],
      temperament: map['temperament'],
      weightImperial: map['weight_imperial'],
      wikipediaUrl: map['wikipedia_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Breeds.fromJson(String source) => Breeds.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Breeds(altNames: $altNames, id: $id, lifeSpan: $lifeSpan, name: $name, origin: $origin, rare: $rare, referenceImageId: $referenceImageId, temperament: $temperament, weightImperial: $weightImperial, wikipediaUrl: $wikipediaUrl)';
  }
}
