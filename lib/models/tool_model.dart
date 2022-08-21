class ToolModel{
  late String toolId;
  late String name;
  late String description;
  late String imageUrl;

  ToolModel({
    required this.toolId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  // named constructor
  ToolModel.fromJson(Map<String, dynamic> json)
  {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }
}