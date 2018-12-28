import 'package:cores/data/models/round_entity.dart';
import 'package:cores/domain/models/color.dart';
import 'package:cores/domain/models/item.dart';

class Round {
  final bool loading;
  final List<Item> items;
  final String colorName;

  const Round({
    this.loading = true,
    this.items = const [],
    this.colorName = "",
  });

  static Round fromEntity(RoundEntity entity) => Round(
        colorName: entity.correctColorName,
        items: entity.colors
            .map((color) => Item(
                  Color.fromEntity(color),
                  entity.correctColorId == color.id,
                ))
            .toList(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Round &&
          runtimeType == other.runtimeType &&
          loading == other.loading &&
          items == other.items &&
          colorName == other.colorName;

  @override
  int get hashCode => loading.hashCode ^ items.hashCode ^ colorName.hashCode;

  @override
  String toString() {
    return 'Round{loading: $loading, items: $items, colorName: $colorName}';
  }
}
