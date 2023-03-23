import 'dart:convert';

class ProdutoModel {
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  ProdutoModel({
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      title: map['title'],
      description: map['description'],
      price: map['price']?.toInt(),
      discountPercentage: map['discountPercentage']?.toDouble(),
      rating: map['rating']?.toDouble(),
      stock: map['stock']?.toInt(),
      brand: map['brand'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source));
}
