import 'package:cores/data/models/color_entity.dart';
import 'package:meta/meta.dart';

class Color {
  final String id;
  final String name;

  const Color({
    @required this.id,
    @required this.name,
  });

  static Color fromEntity(ColorEntity entity) => Color(
        id: entity.id,
        name: entity.name,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Color &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => 'ColorEntity{id: $id, name: $name}';
}
