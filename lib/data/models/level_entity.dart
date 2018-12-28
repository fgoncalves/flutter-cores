import 'package:cores/data/models/exercise.dart';

class LevelEntity {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<Exercise> exercises;

  const LevelEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.exercises,
  })  : assert(id != null),
        assert(title != null);

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
