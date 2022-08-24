import 'package:planetapp/models/plant_model.dart';
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
  int quantity = 1;
  int? counter = 1;

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


  ProductModel.fromProductModel(ProductModel m){
    this.productId=m.productId;
    this.name = m.name;
    this.description = m.description;
    this.imageUrl=m.imageUrl;
    this.type = m.type;
    this.price = m.price;
    this.available = m.available;
  }

  void ChangeQuantity(int? q){
    quantity = q!;
  }

  int? getQuantity(){
    return quantity;
  }
}

