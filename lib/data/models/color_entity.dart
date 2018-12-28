import 'package:meta/meta.dart';

class ColorEntity {
  final String id;
  final String name;

  const ColorEntity({
    @required this.id,
    @required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => 'ColorEntity{id: $id, name: $name}';
}
