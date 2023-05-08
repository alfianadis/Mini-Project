import 'package:mini_project/components/components.dart';

class Data {
  static List<AdsModel> ads = [
    AdsModel(
      title: 'Untuk Penyewaan\nLebih Dari 5x',
      description: '50% Off',
      image: AssetPath.ads1,
    ),
    AdsModel(
      title: 'Untuk Penyewaan\nLebih Dari 10x',
      description: '75% Off',
      image: AssetPath.ads2,
    ),
  ];

  static List<CategoryModel> categories = [
    CategoryModel(
      title: 'Jaket',
      image: AssetPath.category1,
    ),
    CategoryModel(
      title: 'Tenda',
      image: AssetPath.category2,
    ),
    CategoryModel(
      title: 'Cooking\nSet',
      image: AssetPath.category3,
    ),
    CategoryModel(
      title: 'Camping\nGear',
      image: AssetPath.product4,
    ),
    CategoryModel(
      title: 'Hiking\nGear',
      image: AssetPath.category5,
    ),
  ];

  static List<PaymentMethodModel> payments = [
    PaymentMethodModel(
      image: AssetPath.icCreditCard,
      title: 'E-Wallet',
      description: 'Dana, Ovo, Gopay',
    ),
    PaymentMethodModel(
      image: AssetPath.icBank,
      title: 'Mobile Banking',
      description: 'Di Cek Manual',
    ),
  ];
}
