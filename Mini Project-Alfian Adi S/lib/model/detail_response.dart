import 'dart:convert';

DetailWatchResponse detailMovieResponseFromJson(String str) =>
    DetailWatchResponse.fromJson(json.decode(str));

String detailWatchResponseToJson(DetailWatchResponse data) =>
    json.encode(data.toJson());

class DetailWatchResponse {
  DetailWatchResponse({
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

  factory DetailWatchResponse.fromJson(Map<String, dynamic> json) =>
      DetailWatchResponse(
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
