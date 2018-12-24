class Item {
  final String colorId;
  final bool isCorrect;

  const Item(this.colorId, this.isCorrect);

  static Item correct(String colorId) => Item(colorId, true);

  static Item incorrect(String colorId) => Item(colorId, false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          colorId == other.colorId &&
          isCorrect == other.isCorrect;

  @override
  int get hashCode => colorId.hashCode ^ correct.hashCode;

  @override
  String toString() {
    return 'Item{colorId: $colorId, correct: $correct}';
  }
}
