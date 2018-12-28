import 'package:cores/domain/models/color.dart';

class Item {
  final Color color;
  final bool isCorrect;

  const Item(
    this.color,
    this.isCorrect,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          isCorrect == other.isCorrect;

  @override
  int get hashCode => color.hashCode ^ isCorrect.hashCode;

  @override
  String toString() => 'Item{colorId: $color, correct: $isCorrect}';
}
