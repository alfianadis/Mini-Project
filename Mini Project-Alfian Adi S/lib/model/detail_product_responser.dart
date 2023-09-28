// To parse this JSON data, do
//
//     final detailProductResponse = detailProductResponseFromJson(jsonString);

import 'dart:convert';

DetailProductResponse detailProductResponseFromJson(String str) =>
    DetailProductResponse.fromJson(json.decode(str));

String detailProductResponseToJson(DetailProductResponse data) =>
    json.encode(data.toJson());

class DetailProductResponse {
  List<Product> products;

  DetailProductResponse({
    required this.products,
  });

  factory DetailProductResponse.fromJson(Map<String, dynamic> json) =>
      DetailProductResponse(
        products: List<Product>.from(
            json["Products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.spesifikasi,
    required this.image,
    required this.harga,
    required this.waktu,
  });

  int id;
  String productName;
  String description;
  String spesifikasi;
  String image;
  String harga;
  String waktu;

  // Product({
  //   required this.id,
  //   required this.productName,
  //   required this.description,
  //   required this.spesifikasi,
  //   required this.image,
  //   required this.harga,
  //   required this.waktu,
  // });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["productName"],
        description: json["description"],
        spesifikasi: json["spesifikasi"],
        image: json["image"],
        harga: json["harga"],
        waktu: json["waktu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "description": description,
        "spesifikasi": spesifikasi,
        "image": image,
        "harga": harga,
        "waktu": waktu,
      };
}
