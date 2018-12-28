import 'package:cores/data/models/round_entity.dart';

class LevelEntity {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<RoundEntity> rounds;

  const LevelEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.rounds,
  })  : assert(id != null),
        assert(title != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          image == other.image &&
          rounds == other.rounds;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      rounds.hashCode;

  @override
  String toString() =>
      'LevelEntity{id: $id, title: $title, description: $description, image: $image, exercises: $rounds}';

  LevelEntity copy({
    id,
    title,
    description,
    image,
  }) {
    return LevelEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
