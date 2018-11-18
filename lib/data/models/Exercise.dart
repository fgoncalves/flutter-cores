class Exercise {
  final List<String> colors;
  final String correctColorId;
  final String correctColorName;

  const Exercise({
    this.colors,
    this.correctColorId,
    this.correctColorName,
  })  : assert(colors != null),
        assert(correctColorId != null),
        assert(correctColorName != null);
}
