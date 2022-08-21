class SeedModel{
  late String seedId;
  late String name;
  late String description;
  late String imageUrl;

  SeedModel({
    required this.seedId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  // named constructor
  SeedModel.fromJson(Map<String, dynamic> json)
  {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}