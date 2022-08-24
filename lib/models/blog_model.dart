import 'package:planetapp/models/plant_model.dart';
import 'package:planetapp/models/seed_model.dart';
import 'package:planetapp/models/tool_model.dart';

class BlogModel{
  late List<PlantModel> plants;
  late List<SeedModel> seeds;
  late List<ToolModel> tools;

  BlogModel({
    required this.plants,
    required this.seeds,
    required this.tools,
    });

  // named constructor
  BlogModel.fromJson(Map<String, dynamic> json)
  {
    plants = json['plantId'];
    seeds = json['name'];
    tools = json['description'];
  }


}