class PlantModel{
  late String plantId;
  late String name;
  late String description;
  late String imageUrl;
  late int waterCapacity;
  late int sunLight;
  late int temperature;
  int quantity = 1;
  int? counter = 1;

  PlantModel({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature
  });

  // named constructor
  PlantModel.fromJson(Map<String, dynamic> json)
  {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  PlantModel.fromPlantModel(PlantModel m){
    this.plantId=m.plantId;
    this.name = m.name;
    this.description = m.description;
    this.imageUrl=m.imageUrl;
    this.waterCapacity = m.waterCapacity;
    this.sunLight = m.sunLight;
    this.temperature = m.temperature;
  }

  void ChangeQuantity(int? q){
    quantity = q!;
  }

  int? getQuantity(){
    return quantity;
  }
}