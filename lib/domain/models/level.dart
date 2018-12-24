import 'package:cores/data/models/Exercise.dart';
import 'package:cores/data/models/level_entity.dart';

class Level {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<Exercise> exercises;

  const Level({
    this.id,
    this.title,
    this.description,
    this.image,
    this.exercises,
  })  : assert(id != null),
        assert(title != null);

  static Level fromEntity(LevelEntity level) {
    return Level(
      id: level.id,
      title: level.title,
      description: level.description,
      image: level.image,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Level &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          image == other.image &&
          exercises == other.exercises;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      exercises.hashCode;

  @override
  String toString() {
    return 'Level{id: $id, title: $title, description: $description, image: $image, exercises: $exercises}';
  }
}
