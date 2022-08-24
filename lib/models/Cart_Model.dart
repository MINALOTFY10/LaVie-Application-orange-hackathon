class CartModel{
  late String id;
  late String imageUrl;
  late String name;
  late int price;
  late int quantity;

  CartModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.quantity,
  });

  void ChangeQuantity(int q){
    quantity = q;
  }

  int? getQuantity(){
    return quantity;
  }

}