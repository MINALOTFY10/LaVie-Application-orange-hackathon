class ToolModel{
  late String toolId;
  late String name;
  late String description;
  late String imageUrl;
  int quantity = 1;
  int? counter = 1;

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

  ToolModel.fromToolModel(ToolModel m){
    this.toolId=m.toolId;
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