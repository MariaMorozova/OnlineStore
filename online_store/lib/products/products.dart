class Product {
  final int productId;
  final String title;
  final int price;
  final int rating;
  final String imageUrl;
  final List<String> images;
  final int isAvailableForSale;

  Product({
    this.productId,
    this.title,
    this.price,
    this.rating,
    this.imageUrl,
    this.images,
    this.isAvailableForSale});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      rating: json['rating'] as int,
      imageUrl: json['imageUrl'] as String,
      isAvailableForSale: json['isAvailableForSale'] as int,
      images: new List<String>.from(json['images'])
    );
  }
}