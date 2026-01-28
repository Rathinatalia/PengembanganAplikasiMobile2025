class Character {
  final int id;
  final String name;
  final String image;
  final String role;
  final String anime;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.role,
    required this.anime,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['character']['mal_id'],
      name: json['character']['name'],
      image: json['character']['images']['jpg']['image_url'],
      role: json['role'],
      anime: "Naruto",
    );
  }
}
