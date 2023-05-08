import 'package:dio/dio.dart';
import 'package:mini_project/model/detail_product_response.dart';

import '../model/detail_response.dart';

class ProductService {
  Future<DetailProductResponse> getListBestProduct() async {
    try {
      final response = await Dio().get(
        'https://my-json-server.typicode.com/alfianadis/Mini-Project/db',
      );

      print(response.data);

      return DetailProductResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Gagal $e');
    }
  }

  // Future<DetailProductResponse> getDetailWatch(String productID) async {
  //   try {
  //     final response = await Dio().get(
  //         'https://my-json-server.typicode.com/alfianadis/Mini-Project/products/$productID');
  //     if (response.statusCode == 200) {
  //       return DetailProductResponse.fromJson(response.data);
  //     } else {
  //       throw Exception('Failed to load watch detail');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load watch detailll: $e');
  //   }
  // }

  Future<DetailWatchResponse> getProductWatch(String productID) async {
    try {
      final response = await Dio().get(
          'https://my-json-server.typicode.com/alfianadis/Mini-Project/products/$productID');
      if (response.statusCode == 200) {
        return DetailWatchResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load watch detail');
      }
    } catch (e) {
      throw Exception('Failed to load watch detailll: $e');
    }
  }

  // Future<DetailProductResponse> getDetailWatch(String productID) async {
  //   try {
  //     final response = await Dio().get(
  //         'https://my-json-server.typicode.com/alfianadis/Mini-Project/products/$productID');

  //     print(response.data);

  //     return DetailProductResponse.fromJson(response.data);
  //   } on DioError catch (e) {
  //     throw Exception('Gagal  $e');
  //   }
  // }
}
