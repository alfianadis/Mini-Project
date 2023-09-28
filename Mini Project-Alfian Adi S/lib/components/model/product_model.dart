import 'package:intl/intl.dart';

class ProductModel {
  final String title;
  final String description;
  final String specification;
  final int price;
  final String image;

  String get priceText {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp.',
      decimalDigits: 0,
    );
    return currencyFormatter.format(price);
  }

  ProductModel({
    required this.title,
    required this.description,
    required this.specification,
    required this.price,
    required this.image,
  });
}
