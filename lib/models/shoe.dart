


class Shoe  {
  final String name ;
  final double price ;
  final String imgPath ;
  final String description ;

  Shoe({required this.name, 
  required this.price, 
  required this.imgPath,
   required this.description});

 // Convert a Shoe object into a Map for JSON serialization
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imgPath': imgPath,
      'description': description,
    };
  }
  // Convert a Map (JSON) into a Shoe object for deserialization
  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      name: json['name'],
      price: json['price'],
      imgPath: json['imgPath'],
      description: json['description'],
    );
  }
   
}