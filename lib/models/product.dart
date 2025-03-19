class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  final bool isSale;
  final double? originalPrice;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.isSale = false,
    this.originalPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final price = (json['price'] as num).toDouble();
    // Add sale logic - if price is above 50, add a 15% discount
    final isSale = price > 50;
    final originalPrice = isSale ? price : null;
    final salePrice = isSale ? price * 0.85 : price;

    return Product(
      id: json['id'],
      title: json['title'],
      price: salePrice,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
      isSale: isSale,
      originalPrice: originalPrice,
    );
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json['rate'] as num).toDouble(),
      count: json['count'],
    );
  }
} 