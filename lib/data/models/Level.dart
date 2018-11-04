class Level {
  final String title;
  final String description;
  final String image;

  const Level({
    this.title,
    this.description,
    this.image,
  }) : assert(title != null);

  Level copy({
    title,
    description,
    image,
  }) {
    return Level(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
