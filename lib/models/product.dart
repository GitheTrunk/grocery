class Product {
  final String id;
  final String name;
  final double price;
  final String unit;
  final String image;
  final String category;
  final String? description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.unit,
    this.description,
  });
}
