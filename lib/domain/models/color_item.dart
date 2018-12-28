import 'package:cores/data/models/color_entity.dart';
import 'package:meta/meta.dart';

class ColorItem {
  final String id;
  final String name;

  const ColorItem({
    @required this.id,
    @required this.name,
  });

  static ColorItem fromEntity(ColorEntity entity) => ColorItem(
        id: entity.id,
        name: entity.name,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => 'ColorEntity{id: $id, name: $name}';
}
