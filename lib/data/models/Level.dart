import 'package:cores/data/models/Exercise.dart';

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

  Level copy({
    id,
    title,
    description,
    image,
  }) {
    return Level(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
