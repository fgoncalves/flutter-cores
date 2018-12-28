class RoundEntity {
  final List<String> colors;
  final String correctColorId;
  final String correctColorName;

  const RoundEntity({
    this.colors,
    this.correctColorId,
    this.correctColorName,
  })  : assert(colors != null),
        assert(correctColorId != null),
        assert(correctColorName != null);
}
