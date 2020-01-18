class Pokemon {
  final String id;
  final String image;
  final String name;
  final int maxHP;

  const Pokemon({this.id, this.image, this.name, this.maxHP});

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        image = json["image"],
        name = json["name"],
        maxHP = json["maxHP"];
}
