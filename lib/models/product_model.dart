import 'package:planetapp/models/seed_model.dart';
import 'package:planetapp/models/tool_model.dart';

class ProductModel {
  late String productId;
  late String name;
  late String description;
  late String imageUrl;
  late String type;
  late int price;
  late bool available;
  late SeedModel seed;
  late PlantModel plant;
  late ToolModel tool;

  ProductModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.available,
    required this.seed,
    required this.plant,
    required this.tool,

  });

  // named constructor
  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    if(json['type'] == "PLANT")
    {
     plant = (json['plant'] != null ? PlantModel.fromJson(json['plant']) : null)!;
      //plant = json['plant'];
    }
    else if(json['type'] == "SEED")
    {
      seed = (json['seed'] != null ? SeedModel.fromJson(json['seed']) : null)!;
      //seed = json['seed'];
    }
    else
    {
      tool = (json['tool'] != null ? ToolModel.fromJson(json['tool']) : null)!;
      //tool = json['tool'];
    }
  }
}

class PlantModel{
  late String plantId;
  late String name;
  late String description;
  late String imageUrl;
  late int waterCapacity;
  late int sunLight;
  late int temperature;

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
}