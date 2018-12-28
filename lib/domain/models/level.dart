import 'package:cores/data/models/level_entity.dart';
import 'package:cores/domain/models/round.dart';

class Level {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<Round> rounds;
  final int currentRound;

  const Level({
    this.id,
    this.title,
    this.description,
    this.image,
    this.rounds,
    this.currentRound = -1,
  })  : assert(id != null),
        assert(title != null);

  static Level fromEntity(LevelEntity level) {
    return Level(
      id: level.id,
      title: level.title,
      description: level.description,
      image: level.image,
      rounds: level.rounds?.map(Round.fromEntity)?.toList(),
    );
  }

  Level copy({
    String id,
    String title,
    String description,
    String image,
    List<Round> rounds,
    int currentRound,
  }) =>
      Level(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        rounds: rounds ?? this.rounds,
        currentRound: currentRound ?? this.currentRound,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Level &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          image == other.image &&
          rounds == other.rounds &&
          currentRound == other.currentRound;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      rounds.hashCode ^
      currentRound.hashCode;

  @override
  String toString() {
    return 'Level{id: $id, title: $title, description: $description, image: $image, rounds: $rounds, currentLevel: $currentRound}';
  }
}
