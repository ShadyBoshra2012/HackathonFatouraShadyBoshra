class Movie {
  final int id;
  final String title;
  final String imagePath;

  Movie({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  factory Movie.fromJson(Map<String, dynamic> data) {
    Movie movie = Movie(
      id: data["id"],
      title: data["title"],
      imagePath: data["backdrop_path"]?? "",
    );
    return movie;
  }

  Map<String, Object> toMap() {
    return {
      "id": this.id,
      "title": this.title,
      "backdrop_path": this.imagePath,
    };
  }
}
