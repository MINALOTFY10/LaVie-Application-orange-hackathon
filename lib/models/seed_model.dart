class SeedModel{
  late String seedId;
  late String name;
  late String description;
  late String imageUrl;
  int quantity = 1;
  int? counter = 1;

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

  SeedModel.fromSeedModel(SeedModel m){
    this.seedId=m.seedId;
    this.name = m.name;
    this.description = m.description;
    this.imageUrl=m.imageUrl;
  }

  void ChangeQuantity(int? q){
    quantity = q!;
  }

  int? getQuantity(){
    return quantity;
  }
}