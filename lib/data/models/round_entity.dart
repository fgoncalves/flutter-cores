import 'package:cores/data/models/color_entity.dart';

class RoundEntity {
  final List<ColorEntity> colors;
  final String correctColorId;
  final String correctColorName;

  const RoundEntity({
    this.colors,
    this.correctColorId,
    this.correctColorName,
  })  : assert(colors != null),
        assert(correctColorId != null),
        assert(correctColorName != null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundEntity &&
          runtimeType == other.runtimeType &&
          colors == other.colors &&
          correctColorId == other.correctColorId &&
          correctColorName == other.correctColorName;

  @override
  int get hashCode =>
      colors.hashCode ^ correctColorId.hashCode ^ correctColorName.hashCode;

  @override
  String toString() =>
      'RoundEntity{colors: $colors, correctColorId: $correctColorId, correctColorName: $correctColorName}';
}
