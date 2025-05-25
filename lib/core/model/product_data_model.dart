import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDataModel {
  final String productID,
      productName,
      productPrice,
      productCategory,
      productDescription,
      ownerID;

  final List<String> productImages;
  final DateTime createdAt;

  ProductDataModel(
      {required this.productID,
      required this.productName,
      required this.productPrice,
      required this.productCategory,
      required this.productDescription,
      required this.ownerID,
      required this.productImages,
      required this.createdAt});

  factory ProductDataModel.fromJson(json) {
    return ProductDataModel(
        productID: json['productID'],
        productName: json['productName'],
        productPrice: json['productPrice'],
        productCategory: json['productCategory'],
        productDescription: json['productDescription'],
        ownerID: json['ownerID'],
        productImages: List<String>.from(json['productImages']),
        createdAt: (json['createdAt'] as Timestamp).toDate());
  }

  ProductDataModel copyWith({
    String? productID,
    String? productName,
    String? productPrice,
    String? productCategory,
    String? productDescription,
    String? ownerID,
    List<String>? productImages,
    DateTime? createdAt,
  }) {
    return ProductDataModel(
        productID: productID ?? this.productID,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productCategory: productCategory ?? this.productCategory,
        productDescription: productDescription ?? this.productDescription,
        ownerID: ownerID ?? this.ownerID,
        productImages: productImages ?? this.productImages,
        createdAt: createdAt ?? this.createdAt);
  }
}
